//
//  KittenFactService.swift
//  MeowFacts
//
//  Created by Steven Sullivan on 1/26/23.
//

import Foundation


protocol KittenFactServiceProtocol {
    var delegate: KittenViewModel? { get set }
    func fetchData(completionHandler: @escaping (KittenFact)->())
}

class KittenFactService: KittenFactServiceProtocol {
    
    weak var delegate: KittenViewModel?

    //fetch json data func
    func fetchData(completionHandler: @escaping (KittenFact)->()) {
        guard let url = URL(string: Constants.kittenFactUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            //decode data
            let kittenFact = try? JSONDecoder().decode(KittenFact.self, from: data)
            completionHandler(kittenFact!)
        }
        .resume()
    }
}
