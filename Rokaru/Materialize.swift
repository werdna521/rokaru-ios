//
//  Materialize.swift
//  Rokaru
//
//  Created by Endru Tjen on 20/12/20.
//

import Foundation
import MaterialComponents

class Materialize {
    public static func containButton(_ btn: MDCButton, tint: String, icon: String) {
        btn.applyContainedTheme(withScheme: MDCContainerScheme())
        btn.setBackgroundColor(UIColor(hex: "#FFFFFFFF"))
        btn.setTitleColor(UIColor(hex: "#4B6B7DFF"), for: .normal)
        btn.setImage(UIImage(systemName: icon), for: .normal)
        btn.setImageTintColor(UIColor(hex: tint), for: .normal)
    }
}
