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
        _ticket.date.text = "Senin, 21 Desember 2020"
        _ticket.time.text = "15:45"
        _ticket.qr.image = QRCode("https://mamakgila.com")?.image
    }

}
