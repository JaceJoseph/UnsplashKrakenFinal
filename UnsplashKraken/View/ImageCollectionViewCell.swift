//
//  ImageCollectionViewCell.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 27/02/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import UIKit
class ImageCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    var imageLoaded:UIImage?
    var isloaded:Bool = false
    
    func setCell(image:URL?){
        if let url = image{
            self.image.image = #imageLiteral(resourceName: "iPhone 11 Pro Max")
            startSpinner()
            setupImage(url: url)
            stopSpinner()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func startSpinner(){
        loadingSpinner.startAnimating()
        print("start")
    }
    
    func stopSpinner(){
        loadingSpinner.stopAnimating()
        loadingSpinner.hidesWhenStopped = true
    }
    
    func setupImage(url:URL){
        self.image.load(url: url)
        self.imageLoaded = self.image.image
    }
}
