//
//  Extensions.swift
//  MeowFacts
//
//  Created by Steven Sullivan on 1/26/23.
//

import UIKit

//MARK: - UIImageView
extension UIImageView {
    //load image from url func
    func load(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        //Download image on background thread
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    //Set UIImageView image on main thread
                    DispatchQueue.main.async {
                        self?.image = loadedImage
                    }
                }
            }
        }
    }
}
