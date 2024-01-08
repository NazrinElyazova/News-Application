//
//  Parser.swift
//  News APP
//
//  Created by Nazrin on 10.11.23.
//

import Foundation

class Parser {
//    var save = [News]()
    func getJsonFile(completion: ([News]) -> Void) {
        if let file = Bundle.main.url(forResource: "Article", withExtension: "json") {
            do {
                let data = try Data(contentsOf: file)
                let result = try JSONDecoder().decode([News].self, from: data)
//                self.save = result
                completion(result)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}
