//
//  SettingsViewController.swift
//  SwitchColor
//
//  Created by Олег Федоров on 20.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var mutableView: UIView!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var valueRedTF: UITextField!
    @IBOutlet var valueGreenTF: UITextField!
    @IBOutlet var valueBlueTF: UITextField!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = 0.05
        greenSlider.value = 0.27
        blueSlider.value = 0.49
        
        setValue(for: valueRedLabel, valueGreenLabel, valueBlueLabel)
        setValue(for: valueRedTF, valueGreenTF, valueBlueTF)
        
        mutableView.layer.cornerRadius = 10
        
        changeColor()
    }
    
    // MARK: - IB Actions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        changeColor()
    // теперь в данном методе мы обновляем значение того, слайдера, который используем
        switch sender {
        case redSlider:
            valueRedLabel.text = string(from: redSlider)
            valueRedTF.text = string(from: redSlider)
        case greenSlider:
            valueGreenLabel.text = string(from: greenSlider)
            valueGreenTF.text = string(from: greenSlider)
        default:
            valueBlueLabel.text = string(from: blueSlider)
            valueBlueTF.text = string(from: blueSlider)
        }
    }
    
    // MARK: - Private Methods
    private func changeColor() {
        mutableView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case valueRedLabel:
                valueRedLabel.text = string(from: redSlider)
            case valueGreenLabel:
                valueGreenLabel.text = string(from: greenSlider)
            default:
                valueBlueLabel.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case valueRedTF:
                valueRedTF.text = string(from: redSlider)
            case valueGreenTF:
                valueGreenTF.text = string(from: greenSlider)
            default:
                valueBlueTF.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}



