//
//  Ticket.swift
//  Rokaru
//
//  Created by Endru Tjen on 21/12/20.
//

import UIKit

class Ticket: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var qr: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var _qr: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {
        let nib = UINib(nibName: "Ticket", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        Materialize.yuan(contentView)
        Materialize.yuan(_qr)
        addSubview(contentView)
    }

}
