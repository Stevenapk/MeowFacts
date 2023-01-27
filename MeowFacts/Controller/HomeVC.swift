//
//  ViewController.swift
//  MeowFacts
//
//  Created by Steven Sullivan on 1/26/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var factLbl: UILabel!
    
    var viewModel = KittenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getKittenFact()
    }
    
    //when users finishes tapping anywhere on screen, reloads data
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        viewModel.getKittenFact()
    }
}


//MARK: - KittenViewModelDelegate
extension HomeVC: KittenViewModelDelegate {
    
    //update controller UI func
    func updateUI() {
        //main thread
        DispatchQueue.main.async {
            //update image
            self.imgView.load(Constants.kittenImageUrl + "\(Int.random(in: 0...16))")
            //update view background color
            self.view.backgroundColor = Constants.Colors.randomElement()
            //update fact text
            if let fact = self.viewModel.kittenFact {
                self.factLbl.text = "Fact: \(fact)"
            }
        }
    }
    
}

