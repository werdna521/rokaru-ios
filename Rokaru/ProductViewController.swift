//
//  ProductViewController.swift
//  Rokaru
//
//  Created by Endru Tjen on 21/12/20.
//

import UIKit
import MaterialComponents
import TORoundedButton
import SwiftHTTP

class ProductViewController: UIViewController {
    @IBOutlet weak var _favoriteButton: MDCFloatingButton!
    @IBOutlet weak var _pesanButton: RoundedButton!
    
    private func loadData() {
        HTTP.GET("https://rokaru-api.binusian.id/product/4") { response in
            if let error = response.error {
                return
            }
            let data = response.data
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _favoriteButton.setBackgroundColor(UIColor(hex: "#F97EBDFF"))
        
        _pesanButton.tappedHandler = {
            self.performSegue(withIdentifier: "gotoDetailBelanja", sender: nil)
        }
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
