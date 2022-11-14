//
//  RemoteContactsLoader.swift
//  iContacts
//
//  Created by Masoud on 14/11/22.
//

import Foundation

public enum HttpClientResult {
    case failure(Error)
    case success(Data, HTTPURLResponse)
}

public protocol HttpClient {
    func get(from url: URL, completion: @escaping (HttpClientResult)->Void)
}

public class URLSessionHTTPClient: HttpClient {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    private struct UnexpectedValue: Error {}

    public func get(from url: URL, completion: @escaping (HttpClientResult) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            } else {
                completion(.failure(UnexpectedValue()))
            }
        }.resume()
    }
}

final class RemoteContactsProvider {
        
    private let httpClient: HttpClient
    private let url: URL
    
    init(httpClient: HttpClient, url: URL) {
        self.httpClient = httpClient
        self.url = url
    }
}

extension RemoteContactsProvider: ContactsProvider {

    private struct JSONSchema: Decodable {
        let groups: [Group]
    }
    
    func load(completion: @escaping (ContactsProviderResult) -> Void) {
        httpClient.get(from: url) { [weak self] result in
            guard self != nil else { return }

            switch result {
            case .success(let data, _):
                do {
                    let json = try JSONDecoder().decode(JSONSchema.self, from: data)
                    completion(.success(json.groups))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
