//
//  ShopViewController.swift
//  Rokaru
//
//  Created by Endru Tjen on 20/12/20.
//

import UIKit
import MaterialComponents

class ShopViewController: UIViewController {
    @IBOutlet weak var _directionButton: MDCButton!
    @IBOutlet weak var _callButton: MDCButton!
    @IBOutlet weak var _chatButton: MDCButton!
    @IBOutlet weak var _product: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Materialize.containButton(_directionButton, tint: "#6CC164FF", icon: "location")
        Materialize.containButton(_callButton, tint: "#E4B65CFF", icon: "phone")
        Materialize.containButton(_chatButton, tint: "#F86CB4FF", icon: "message")
        
        let tapGesture = UIGestureRecognizer(target: self, action: Selector("onTapProduct:"))
        _product.addGestureRecognizer(tapGesture)
        _product.isUserInteractionEnabled = true
    }
    
    @objc func onTapProduct(gesture: UIGestureRecognizer) {
        performSegue(withIdentifier: "shop-to-product", sender: nil)
    }

}
