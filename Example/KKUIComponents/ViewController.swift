//
//  ViewController.swift
//  KKUIComponents
//
//  Created by geowarsong on 09/20/2020.
//  Copyright (c) 2020 geowarsong. All rights reserved.
//

import UIKit
import KKUIComponents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let shadowedView = RoundedShadowedView(frame: CGRect(x: 40, y: 40, width: 200, height: 100))
        shadowedView.backgroundLayerColor = .red
        shadowedView.backgroundLayerLineWidth = 4
        shadowedView.backgroundLayerStrokeColor = .yellow
        shadowedView.shadowColor = .black
        shadowedView.shadowAlpha = 0.7
        shadowedView.shadowRadius = 24
        shadowedView.cornerRadius = 20
        shadowedView.shadowOffset = CGSize(width: 3, height: 8)
        view.addSubview(shadowedView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

