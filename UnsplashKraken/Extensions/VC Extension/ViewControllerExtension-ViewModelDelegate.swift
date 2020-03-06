//
//  ViewControllerExtension-ViewModelDelegate.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 01/03/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit

extension ViewController:setupUI{
    func hidePlaceholderImage() {
        self.placeholderImage.isHidden = true
    }
    
    func showPlaceholderImage() {
        self.placeholderImage.isHidden = false
        self.placeholderImage.image = #imageLiteral(resourceName: "iPhone 11 Pro Max Copy")
    }
    
    func updateCollection() {
        self.imageCollectionView.reloadData()
    }
    
    
}
