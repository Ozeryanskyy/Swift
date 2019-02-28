//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Anton Ozeryanskyy on 2/20/19.
//  Copyright © 2019 Anton Ozeryanskyy. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var uiElements = ["UISegmentedControl",
                      "UILabel",
                      "UISlider",
                      "UITextField",
                      "UIButton",
                      "UIDatePicker"]
    var selectedElement: String?
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmentedContol: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 100
        
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(1))
        
        
        label.text = String(slider.value)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedContol.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        datePicker.locale = Locale(identifier: "ru_RU")
        
        choiceUiElement()
        createToolbar()
    }
    
    func hideAllElements() {
        segmentedContol.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        switchLabel.isHidden = true
        datePicker.isHidden = true
        doneButton.isHidden = true
    }
    
    func choiceUiElement() {
        
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        
        textField.inputView = elementPicker
        
        elementPicker.backgroundColor = .brown
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
        switch segmentedContol.selectedSegmentIndex {
        case 0:
            label.text = "The first segment is selected"
            label.textColor = .red
        case 1:
            label.text = "The second segment is selected"
            label.textColor = .blue
        case 2:
            label.text = "The third segment is selected"
            label.textColor = .yellow
        default:
            print("ERROR")
        }
        
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        label.text = String(Int(sender.value))
        
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value/100))
        
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else {
            return
        }
        
        if textField.text!.rangeOfCharacter(from: .decimalDigits) != nil {

            let alert = UIAlertController(title: "Wrong format", message: "Only letters allowed", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { action in
                if let textField = alert.textFields?[0]{
                    self.textField.text = textField.text
                }
            }
            alert.addTextField {(textField) in
                textField.placeholder = "Enter your name"
            }
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
    
    @IBAction func changeDate(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        let dateValue = dateFormatter.string(from: sender.date)
        label.text = dateValue
    }
    @IBAction func switchAction(_ sender: UISwitch) {
        segmentedContol.isHidden = !segmentedContol.isHidden
        label.isHidden = !label.isHidden
        slider.isHidden = !slider.isHidden
        textField.isHidden = !textField.isHidden
        datePicker.isHidden = !datePicker.isHidden
        doneButton.isHidden = !doneButton.isHidden
        
        if sender.isOn {
            switchLabel.text = "Show all elements"
        } else {
            switchLabel.text = "Hide all elements"
        }
        
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolbar
        
        toolbar.tintColor = .white
        toolbar.barTintColor = .brown
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}


extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedElement = uiElements[row]
        textField.text = selectedElement
        
        switch row {
        case 0:
            hideAllElements()
            segmentedContol.isHidden = false
        case 1:
            hideAllElements()
            label.isHighlighted = false
        case 2:
            hideAllElements()
            slider.isHidden = false
        case 3:
            hideAllElements()
        case 4:
            hideAllElements()
            doneButton.isHidden = false
        case 5:
            hideAllElements()
            datePicker.isHidden = false
        default:
            hideAllElements()
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .white
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 23)
        pickerViewLabel.text = uiElements[row]
        
        return pickerViewLabel
    }
    
}
