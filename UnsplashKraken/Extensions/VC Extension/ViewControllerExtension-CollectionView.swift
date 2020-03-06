//
//  ViewControllerExtension.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 01/03/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = viewModel.getRegularImageURLAt(index: indexPath.row)
        let rowKey = viewModel.listOfImages[indexPath.row].id
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCells", for: indexPath) as? ImageCollectionViewCell{
            
            if let cachedImage = viewModel.imageCache.object(forKey: NSString(string: rowKey)){
                cell.image.image = cachedImage
            }else{
                DispatchQueue.main.async {
                cell.setCell(image: row)
                }
            return cell
            }
        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let lastElement = viewModel.numberOfData()-1
        if indexPath.row == lastElement && viewModel.numberOfData()>=10{
            if viewModel.isLoading == false{
                viewModel.fetch(page: viewModel.page, keyWord: viewModel.keyword ?? "something")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        transferIndex = indexPath.row
        performSegue(withIdentifier: "imageDetail", sender: self)
        
    }
    
}
