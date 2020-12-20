//
//  ProductViewController.swift
//  Rokaru
//
//  Created by Endru Tjen on 21/12/20.
//

import UIKit
import MaterialComponents

class ProductViewController: UIViewController {
    @IBOutlet weak var _orderButton: MDCButton!
    @IBOutlet weak var _favoriteButton: MDCFloatingButton!
    @IBOutlet weak var _addToCartButton: MDCButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _favoriteButton.setBackgroundColor(UIColor(hex: "#F97EBDFF"))
        Materialize.containButton(_orderButton, tint: "#6CC164FF", icon: "paperclip")
        Materialize.containButton(_addToCartButton, tint: "#E4B65CFF", icon: "cart")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
