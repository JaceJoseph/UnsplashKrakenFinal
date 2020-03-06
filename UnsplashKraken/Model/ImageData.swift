//
//  ImageData.swift
//  UnsplashTest
//
//  Created by Jesse Joseph on 28/02/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import Foundation

struct Images:Decodable{
    var images:[ImageDetail]
    enum CodingKeys:String,CodingKey{
        case images = "results"
    }
}

struct ImageDetail:Decodable{
    var created_at:String
    var urls:URLs
    var user:User
    var id:String
    enum CodingKeys:String,CodingKey{
        case created_at = "created_at"
        case urls = "urls"
        case user = "user"
        case id = "id"
    }
}

struct User:Decodable{
    var name:String
    var profileImage:ProfileImage
    enum CodingKeys:String,CodingKey{
        case name = "name"
        case profileImage = "profile_image"
    }
}

struct ProfileImage:Decodable{
    var small:URL
    var medium:URL
    var large:URL
    enum CodingKeys:String,CodingKey{
        case small = "small"
        case medium = "medium"
        case large = "large"
    }
}

struct URLs: Decodable {
    let raw: URL
    let full: URL
    let regular: URL
    let small: URL
    let thumb: URL
    enum CodingKeys:String,CodingKey{
        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
    }
}

