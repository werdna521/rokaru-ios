//
//  ShopViewController.swift
//  Rokaru
//
//  Created by Endru Tjen on 20/12/20.
//

import UIKit
import MaterialComponents
import SwiftHTTP

class ShopViewController: UIViewController {
    @IBOutlet weak var _directionButton: MDCButton!
    @IBOutlet weak var _callButton: MDCButton!
    @IBOutlet weak var _chatButton: MDCButton!
    @IBOutlet weak var _product: UIImageView! {
        didSet {
            self._product.tappable = true
        }
    }
    
    private func loadData() {
        HTTP.GET("https://rokaru-api.binusian.id/umkm/4") { response in
            if let error = response.error {
                return
            }
            let data = response.data
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
        
        loadData()
        
    }

    @IBAction func directionTapped(_ sender: Any) {
        if let url = URL(string: "https://maps.apple.com/?address=Jalan%20Haji%20Ridi,%20Pesanggrahan,%20Jakarta,%20Indonesia&auid=8921037561209289179&ll=-6.235405,106.760813&lsp=9902&q=Nasi%20Goreng&_ext=ChgKBAgEEEUKBAgFEAMKBAgGEBQKBAgKEAASJCnESNeD+fEYwDFkDsVaorBaQDliJgGKIvAYwEGc8Tr3v7BaQA%3D%3D"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func teleponTapped(_ sender: Any) {
        if let url = URL(string: "tel://622153696969"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
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
