//
//  ViewController.swift
//  ControlObjects
//
//  Created by Mikhail Chibrin on 17.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonGetPressed() {
    }
    
    @IBAction func switchChange(_ sender: UISwitch) {
    }
    
    @IBAction func sliderValueChange() {
    }
    
    @IBAction func textFieldGetChange() {
    }
}

