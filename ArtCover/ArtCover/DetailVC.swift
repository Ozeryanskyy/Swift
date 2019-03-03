//
//  DetailVC.swift
//  ArtCover
//
//  Created by Anton Ozeryanskyy on 3/3/19.
//  Copyright © 2019 Anton Ozeryanskyy. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var trackTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.image = UIImage(named: trackTitle)
        titleLabel.text = trackTitle
        titleLabel.numberOfLines = 0
    }
    
}
