//
//  KittenViewModel.swift
//  MeowFacts
//
//  Created by Steven Sullivan on 1/26/23.
//

import Foundation

protocol KittenViewModelDelegate {
    func updateUI()
}


class KittenViewModel {
    
    var kittenFact: String?
    var delegate: KittenViewModelDelegate?
    
    private var helper: KittenFactServiceProtocol
    
    init(helper: KittenFactServiceProtocol = KittenFactService()) {
        self.helper = helper
    }

    func getKittenFact() {
        helper.delegate = self
        helper.fetchData() { kittenFact in
            self.kittenFact = kittenFact.fact
            self.delegate?.updateUI()
        }
    }
}
