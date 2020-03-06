//
//  ImageDetailViewController.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 29/02/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    var detailImage:ImageDetail?

    @IBOutlet weak var imageShown: UIImageView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        if let displayedImage = detailImage{
            self.loadingSpinner.startAnimating()
            DispatchQueue.main.async {
                self.imageShown.load(url: displayedImage.urls.regular)
                self.profilePic.load(url: displayedImage.user.profileImage.large)
                self.creatorLabel.text = self.detailImage?.user.name
                self.dateLabel.text = self.detailImage?.created_at
                self.loadingSpinner.stopAnimating()
            }
        }
    }
    
    @IBAction func buttonPushed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
