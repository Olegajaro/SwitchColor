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
        
        mutableView.layer.cornerRadius = 10

        mutableView.backgroundColor = color
        
        setSliders()
        setValue(for: valueRedLabel, valueGreenLabel, valueBlueLabel)
        setValue(for: valueRedTF, valueGreenTF, valueBlueTF)
        
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
    
    private func setSliders() {
        let ciColor = CIColor(color: color)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case valueRedTF:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: valueRedLabel)
            case valueGreenTF:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: valueGreenLabel)
            default:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: valueBlueLabel)
            }
            
            changeColor()
            return
        }
        
        showAlert(title:"Wrong format", message: "Please enter correctvalue")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
}




