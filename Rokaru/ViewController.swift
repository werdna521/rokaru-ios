//
//  ViewController.swift
//  Rokaru
//
//  Created by Endru Tjen on 20/12/20.
//

import UIKit
import Koloda
import MaterialComponents

class ViewController: UIViewController {
    @IBOutlet weak var _kolodaView: KolodaView!
    @IBOutlet weak var _hateButton: MDCFloatingButton!
    @IBOutlet weak var _loveButton: MDCFloatingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _kolodaView.delegate = self
        _kolodaView.dataSource = self
        
        _hateButton.setBackgroundColor(UIColor(hex: "#f1ca20ff"))
        _loveButton.setBackgroundColor(UIColor(hex: "#f86cb4ff"))
    }

    @IBAction func _onLove(_ sender: Any) {
        _kolodaView.swipe(SwipeResultDirection.right)
    }
    
    @IBAction func _onHate(_ sender: Any) {
        _kolodaView.swipe(SwipeResultDirection.left)
    }
}

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let alert = UIAlertController(title: "Congratulation!", message: "Now you're \(index)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

extension ViewController: KolodaViewDataSource {
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return 20
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = NgeryCard(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width - 48, height: 400))
        view.titleLabel.text = "Nasi Goreng Pinsen Gilak"
        view.subtitleLabel.text = "200 m"
        view.imageView.image = UIImage(named: "nasi-goreng")
        view.imageView.layer.cornerRadius = 20
        view.imageView.clipsToBounds = true
        return view
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
