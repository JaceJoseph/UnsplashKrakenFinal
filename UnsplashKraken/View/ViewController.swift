//
//  ViewController.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 27/02/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var placeholderImage: UIImageView!
    
    let viewModel = ViewControllerViewModel()
    var transferIndex = 0
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var ImageSearch: UISearchBar!
    
    override func viewDidLoad() {
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        ImageSearch.delegate = self
        viewModel.delegate = self
        imageCollectionView.indicatorStyle = .white
        self.hideKeyboardWhenTapped()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? ImageDetailViewController{
            destVC.detailImage = viewModel.listOfImages[transferIndex]
        }
    }
}
