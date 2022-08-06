//
//  RequestManagerMock.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 5/8/22.
//

@testable import CoolFruits
import Foundation
import XCTest

enum ResponseType {
    case success
    case failure
}

class RequestManagerMock: RequestManagerProvider {
    
    var responseType: ResponseType!
    
    init(responseType: ResponseType = .success) {
        self.responseType = responseType
    }
    
    func getAllFruts(_ completion: @escaping (([FruitModel?]?, Error?) -> Void)) {
        if responseType == .success {
            let fruitsList = FruitsListMocks().getFruitsList()
            completion(fruitsList, nil)
        } else {
            completion(nil, NSError(domain: "https://www.fruityvice.com/api/fruit", code: 500))
        }
    }
}
