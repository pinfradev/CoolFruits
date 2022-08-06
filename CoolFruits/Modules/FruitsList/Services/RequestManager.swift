//
//  RequestManager.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 21-07-22.
//

import Foundation

protocol RequestManagerProvider {
    func getAllFruts(_ completion: @escaping (([FruitModel]?, Error?) -> Void))
}

class RequestManager: RequestManagerProvider {
    var session: URLSession
    var baseURL: String = "https://www.fruityvice.com/api/fruit"
    
    init() {
        self.session = URLSession(configuration: URLSessionConfiguration.default)
    }
    
    func getAllFruts(_ completion: @escaping (([FruitModel]?, Error?) -> Void)) {
        session.dataTask(with: URL(string: baseURL + "/all")!) { data, response, error in
            if error != nil {
                
                DispatchQueue.main.async {
                    completion(nil, error)
                    return
                }
            } else {
                do {
                    let decodedObject = try JSONDecoder().decode([FruitModel].self, from: data!)
                    DispatchQueue.main.async {
                        completion(decodedObject, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, NSError(domain: "https://www.fruityvice.com/api/fruit", code: 500))
                    }
                }
            }
        }.resume()
    }
}
