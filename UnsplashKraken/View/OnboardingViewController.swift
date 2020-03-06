//
//  OnboardingViewController.swift
//  UnsplashKraken
//
//  Created by Jesse Joseph on 02/03/20.
//  Copyright © 2020 Jesse Joseph. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onboardingButtonPushed(_ sender: UIButton) {
       UserDefaults.standard.set(10, forKey: "loggedIn")
    }
}
