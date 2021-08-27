//
//  ViewController.swift
//  SwitchColor
//
//  Created by Олег Федоров on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var mutableView: UIView!
    
    @IBOutlet var valueRedSlider: UILabel!
    @IBOutlet var valueGreenSlider: UILabel!
    @IBOutlet var valueBlueSlider: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = 0.05
        greenSlider.value = 0.27
        blueSlider.value = 0.49
        
        setValue(for: valueRedSlider, valueGreenSlider, valueBlueSlider)
        
        mutableView.layer.cornerRadius = 10
        
        changeColor()
    }
    
    // MARK: - IB Actions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        changeColor()
    // теперь в данном методе мы обновляем значение того, слайдера, который используем
        switch sender {
        case redSlider:
            valueRedSlider.text = string(from: redSlider)
        case greenSlider:
            valueGreenSlider.text =  string(from: greenSlider)
        default:
            valueBlueSlider.text = string(from: blueSlider)
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
            case valueRedSlider:
                valueRedSlider.text = string(from: redSlider)
            case valueGreenSlider:
                valueGreenSlider.text = string(from: greenSlider)
            default:
                valueBlueSlider.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}



