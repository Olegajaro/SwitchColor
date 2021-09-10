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
    
    // MARK: - Public Properties
    var color: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.value = Float(color.rgba.red)
        greenSlider.value = Float(color.rgba.green)
        blueSlider.value = Float(color.rgba.blue)

        color = mutableView.backgroundColor
        
        setValue(for: valueRedLabel, valueGreenLabel, valueBlueLabel)
        setValue(for: valueRedTF, valueGreenTF, valueBlueTF)
        
        mutableView.layer.cornerRadius = 10
        
        changeColor()
    }
    
    // MARK: - IB Actions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        changeColor()
    
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
    
    @IBAction func doneButtonPressed() {
        delegate.setCurrentColor(mutableView.backgroundColor ?? .white)
        dismiss(animated: true)
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

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case valueRedTF:
            valueGreenTF.becomeFirstResponder()
        case valueGreenTF:
            valueBlueTF.becomeFirstResponder()
        default:
            valueRedTF.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case valueRedTF:
            redSlider.value = Float(valueRedTF.text ?? "0") ?? 0
            valueRedLabel.text = string(from: redSlider)
        case valueGreenTF:
            greenSlider.value = Float(valueGreenTF.text ?? "0") ?? 0
            valueGreenLabel.text = string(from: greenSlider)
        default:
            blueSlider.value = Float(valueBlueTF.text ?? "0") ?? 0
            valueBlueLabel.text = string(from: blueSlider)
        }
        
        changeColor()
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}



