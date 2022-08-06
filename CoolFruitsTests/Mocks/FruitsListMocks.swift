//
//  FruitsListMocks.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 5/8/22.
//

import Foundation

@testable import CoolFruits

class FruitsListMocks {
    
    func getFruitsList() -> [FruitModel] {
        let fruitsList = parseJsonToModel(objectType: [FruitModel].self, fileModelPath: "FruitsList")
        
        return fruitsList
    }
    
    private func parseJsonToModel<T: Decodable>(objectType: T.Type, fileModelPath: String) -> T {
        let jsonBundle = Bundle(for: FruitsListMocks.self)
        
        guard let url = jsonBundle.url(forResource: fileModelPath, withExtension: "json"),
              let jsonData = try? Data(contentsOf: url),
              let object = try? JSONDecoder().decode(objectType, from: jsonData) else {
            abort()
        }
        
        return object
    }
}
