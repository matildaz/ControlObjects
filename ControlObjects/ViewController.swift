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
    
    var number = 128 {
        didSet {
            number = (number + 256) % 256
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rottateSwitches()
        updateUI()
        view.isUserInteractionEnabled = true
        view.backgroundColor = .systemOrange
    }

    @IBAction func buttonGetPressed() {
        number = (number + 1) % 256
        button.setTitle("\(number)", for: [])
    }
    
    func rottateSwitches() {
        for item2 in switches {
            item2.layer.transform = CATransform3DMakeRotation(-.pi/2, 0, 0, 1)
        }
    }
    
    func updateNumberFromTheSwitches() {
        var count = 0
        for item2 in switches {
            count += item2.isOn ? item2.tag : 0
        }
        self.number = count
    }
    
    func switchUpdate() {
        for item in switches {
            item.isOn = Int(number) & item.tag != 0
        }
    }
    
    /// option + cmd + / = Description
    func updateUI() {
        button.setTitle("\(number)", for: [])
        // присваваем значение для любых ситуаций []
        textField.text = "\(number)"
        switchUpdate()
        slider.value = Float.init(number)
    }
    
    @IBAction func switchChange(_ sender: UISwitch) {
        updateNumberFromTheSwitches()
    }
    
    @IBAction func sliderValueChange() {
        number = Int(slider.value)
    }
    
    @IBAction func textFieldGetChange() {
        number = Int(textField.text ?? "") ?? 128
    }
    
    @IBAction func screenHasBeenTapped(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        if location.x < view.bounds.midX {
            number -= 1
        } else {
            number += 1
        }
    }
}

