//
//  ImagesRequest.swift
//  UnsplashTest
//
//  Created by Jesse Joseph on 28/02/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import Foundation

enum ImageError:Error{
    case noDataAvailable
    case cannotAccessData
}

struct ImagesRequest{
    let resourceURL:URL
    let API_KEY = "tFUDCVIotQbaDoQHn5cpepWtFHXBwbTmG6lXTTl1vTs"
    
    init(keyWord:String, page:Int) {
        let resourceString = "https://api.unsplash.com/search/photos?client_id=\(API_KEY)&page=\(page)&query=\(keyWord)"
        
        guard let resourceURL = URL(string: resourceString) else { fatalError() }
        self.resourceURL = resourceURL
        
    }
    
    func getImages(completion:@escaping(Result<[ImageDetail], ImageError>)->Void){
        let dataTask = URLSession.shared.dataTask(with: resourceURL){ data, _, _ in
            guard let jsonData = data else{
                completion(.failure(.noDataAvailable))
                print("fail no data")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let imageResponse = try decoder.decode(Images.self, from: jsonData)
                let imageDetail = imageResponse.images
                print(imageDetail)
                completion(.success(imageDetail))
                print("success")
                
            }catch{
                completion(.failure(.cannotAccessData))
                print("fail cant access")
                return
            }
            
        }
        dataTask.resume()
    }
    
}
