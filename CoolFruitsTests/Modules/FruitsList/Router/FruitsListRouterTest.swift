//
//  FruitsListRouterTest.swift
//  CoolFruitsTests
//
//  Created by Fray Pineda on 6/8/22.
//

import Quick
import Nimble

@testable import CoolFruits

class FruitsListRouterTest: QuickSpec {
    
    override func spec() {
        
        var sut: FruitsListRouter!
        
        beforeEach {
            sut = FruitsListRouter()
        }
        
        afterEach {
            sut = nil
        }
        
        describe("A FruitsListRouter") {
            
        }
        
    }
}
