//
//  ViewControllerViewModel.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 01/03/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit

protocol setupUI {
    func hidePlaceholderImage()
    func showPlaceholderImage()
    func updateCollection()
}

class ViewControllerViewModel{
    var listOfImages = [ImageDetail](){
        didSet{
            DispatchQueue.main.async {
                self.delegate.updateCollection()
            }
        }
    }
    
    let imageCache = NSCache<NSString,UIImage>()
    
    var page:Int = 1
    var keyword:String?
    var isLoading:Bool = false
    
    var delegate:setupUI!
    
    func fetch(page:Int, keyWord:String){
           if !isLoading{
               isLoading = true
               self.page += 1
               let imageRequest = ImagesRequest(keyWord: keyWord, page: page)
               imageRequest.getImages { [weak self] result in
                   switch result{
                   case .failure(let error):
                       print(error)
                   case.success(let images):
                       if images.isEmpty{
                        if self?.listOfImages.isEmpty ?? true{
                            DispatchQueue.main.async {
                             self?.delegate.showPlaceholderImage()
                             self?.isLoading = false
                            }
                        }
                       }else{
                           DispatchQueue.main.async {
                            self?.delegate.hidePlaceholderImage()
                            self?.listOfImages += images
                            self?.isLoading = false
                        }
                    }
                }
            }
        }
    }
    
    func removeImageDatas(){
        listOfImages.removeAll()
    }
    
    func getRegularImageURLAt(index:Int)->URL{
        return listOfImages[index].urls.regular
    }
    
    func numberOfData()->Int{
        return listOfImages.count
    }
    
    func setPage(page:Int){
        self.page = page
    }
    
    func setKeyWord(keyWord:String){
        self.keyword = keyWord
    }
    
}
