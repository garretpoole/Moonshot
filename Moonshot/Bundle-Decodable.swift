//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Garret Poole on 3/18/22.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        //find file somewhere in the bundle
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle")
        }
        //load the data into a data instance
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle")
        }
        //decode the data from JSON to local instance
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else{
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
