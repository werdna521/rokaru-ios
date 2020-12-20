//
//  ViewController.swift
//  Rokaru
//
//  Created by Endru Tjen on 20/12/20.
//

import UIKit
import Koloda

class ViewController: UIViewController {
    @IBOutlet weak var _kolodaView: KolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _kolodaView.delegate = self
        _kolodaView.dataSource = self
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
        return 5
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
