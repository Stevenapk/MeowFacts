//
//  KittenFact.swift
//  MeowFacts
//
//  Created by Steven Sullivan on 1/26/23.
//

import Foundation


struct KittenFact: Decodable {
    let fact: String

    enum CodingKeys: CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //decode the data: [String] -> first string in the array or a default value
        let data: [String] = try container.decode([String].self, forKey: .data)
        self.fact = data.first ?? "One litter of kittens can have multiple fathers. 👀"
    }
}
