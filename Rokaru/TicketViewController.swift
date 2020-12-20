//
//  TicketViewController.swift
//  Rokaru
//
//  Created by Endru Tjen on 21/12/20.
//

import UIKit
import QRCode

class TicketViewController: UIViewController {
    @IBOutlet weak var _ticket: Ticket!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        _ticket.title.text = "Nasi Goreng Pinsen Crazy"
        _ticket.date.text = "Senin, 200 Desember 395485"
        _ticket.time.text = "13:9948"
        _ticket.qr.image = QRCode("https://mamakgila.com")?.image
    }

}
