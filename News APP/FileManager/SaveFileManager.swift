//
//  SaveFileManager.swift
//  News APP
//
//  Created by Nazrin on 10.11.23.
//

import Foundation

class SaveFileManager {
    
    func getJsonFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files [0].appendingPathComponent("favority.json")
        print(path)
        return path
    }
    
    func writeJsonData(items: [News]) {
        do {
            let data = try JSONEncoder().encode(items)
            try data.write(to: getJsonFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readJsonFile(complete: (([News]) -> Void)) {
        if let data = try? Data(contentsOf: getJsonFilePath()) {
            do {
                _ = try JSONDecoder().decode([News].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
