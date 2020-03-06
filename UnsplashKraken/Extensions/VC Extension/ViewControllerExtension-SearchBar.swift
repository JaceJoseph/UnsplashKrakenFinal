//
//  ViewControllerExtension-SearchBar.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 01/03/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit

extension ViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.setPage(page: 1)
        guard let searchBarText = searchBar.text else {return}
        viewModel.removeImageDatas()
        let searchedTerm = searchBarText
        
        viewModel.fetch(page: viewModel.page, keyWord: searchedTerm)
        viewModel.setKeyWord(keyWord: searchedTerm)
        
        searchBar.resignFirstResponder()
    }
}
