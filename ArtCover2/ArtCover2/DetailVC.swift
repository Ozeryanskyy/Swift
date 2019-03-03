//
//  DetailVC.swift
//  ArtCover2
//
//  Created by Anton Ozeryanskyy on 3/3/19.
//  Copyright © 2019 Anton Ozeryanskyy. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var trackName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image.image = UIImage(named: trackName)
        label.text = trackName
        label.numberOfLines = 0
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
