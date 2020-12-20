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
    @IBOutlet weak var _product: UIImageView! {
        didSet {
            self._product.tappable = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Materialize.containButton(_directionButton, tint: "#6CC164FF", icon: "location")
        Materialize.containButton(_callButton, tint: "#E4B65CFF", icon: "phone")
        Materialize.containButton(_chatButton, tint: "#F86CB4FF", icon: "message")
        self._product.callback = {
            self.performSegue(withIdentifier: "shop-to-product", sender: nil)
        }
    }

}

public typealias SimpleClosure = (() -> ())
private var tappableKey : UInt8 = 0
private var actionKey : UInt8 = 1

extension UIImageView {
    
    @objc var callback: SimpleClosure {
        get {
            return objc_getAssociatedObject(self, &actionKey) as! SimpleClosure
        }
        set {
            objc_setAssociatedObject(self, &actionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var gesture: UITapGestureRecognizer {
        get {
            return UITapGestureRecognizer(target: self, action: #selector(tapped))
        }
    }
    
    var tappable: Bool! {
        get {
            return objc_getAssociatedObject(self, &tappableKey) as? Bool
        }
        set(newValue) {
            objc_setAssociatedObject(self, &tappableKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            self.addTapGesture()
        }
    }

    fileprivate func addTapGesture() {
        if (self.tappable) {
            self.gesture.numberOfTapsRequired = 1
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(gesture)
        }
    }

    @objc private func tapped() {
        callback()
    }
}
