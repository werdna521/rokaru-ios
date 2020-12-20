//
//  DetailBelanjaViewController.swift
//  Rokaru
//
//  Created by Stanley on 21/12/20.
//

import UIKit
import TORoundedButton

class DetailBelanjaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var _buttonBayar: RoundedButton!
    @IBOutlet weak var _tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellItem = tableView.dequeueReusableCell(withIdentifier: "cellBarang") as! BarangTableViewCell
        
        cellItem._barangImage.image = UIImage(named: "nasi-goreng")
        cellItem._barangName.text = "Nasi Goreng"
        cellItem._barangPrice.text = "Rp25.000 x 1"
        
        Materialize.yuan(cellItem._barangImage, chiangkuang: false)
        
        return cellItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _tableview.delegate = self
        _tableview.dataSource = self
        
        _buttonBayar.tappedHandler = {
            self.performSegue(withIdentifier: "gotoBayar", sender: nil)
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
