//
//  LocalContactsProvider.swift
//  iContacts
//
//  Created by Masoud Sheikh Hosseini on 11/11/22.
//

import Foundation

protocol FileBrowser {
    func load(fileName: String, type: String) -> Data?
}

final class BundleBrowser: FileBrowser {
    func load(fileName: String, type: String) -> Data? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: type) else { return nil }
        return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}

final class LocalContactsProvider {
    
    enum Error: Swift.Error {
        case fileNotFound
    }
    
    static private let jsonFileName = "contacts"
    
    private let broswer: FileBrowser
    
    init(browser: FileBrowser) {
        self.broswer = browser
    }
}

extension LocalContactsProvider: ContactsProvider {

    private struct JSONSchema: Decodable {
        let groups: [Group]
    }
    
    func load(completion: @escaping (ContactsProviderResult) -> Void) {
        guard let jsonData = broswer.load(fileName: Self.jsonFileName, type: "json") else {
            return completion(.failure(Error.fileNotFound))
        }
        
        do {
            let json = try JSONDecoder().decode(JSONSchema.self, from: jsonData)
            completion(.success(json.groups))
        } catch {
            completion(.failure(error))
        }
    }
}
