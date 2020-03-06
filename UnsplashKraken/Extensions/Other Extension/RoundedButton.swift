//
//  RoundedButton.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 02/03/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import Foundation
import UIKit
class RoundedButton:UIButton{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
    }
}
