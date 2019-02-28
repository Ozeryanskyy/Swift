//
//  ViewController.swift
//  TConverter
//
//  Created by Anton Ozeryanskyy on 2/16/19.
//  Copyright © 2019 Anton Ozeryanskyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var celciusLabel: UILabel!
    @IBOutlet weak var farengeitLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let temperatureCelcius = Int(round(sender.value))
        celciusLabel.text = "\(temperatureCelcius)ºC"
        let temperatureFarengeit = Int(round((sender.value * 9 / 5) + 32))
        farengeitLabel.text = "\(temperatureFarengeit)ºF"
    }
}

