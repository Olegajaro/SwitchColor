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
        
        valueRedSlider.text = String(format: "%.2f", redSlider.value)
        valueGreenSlider.text = String(format: "%.2f", greenSlider.value)
        valueBlueSlider.text = String(format: "%.2f", blueSlider.value)
        
        mutableView.layer.cornerRadius = 10
        
        changeColor()
    }
    
    // MARK: - IB Actions
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        changeColor()
        
        valueRedSlider.text = String(format: "%.2f", redSlider.value)
        valueGreenSlider.text = String(format: "%.2f", greenSlider.value)
        valueBlueSlider.text = String(format: "%.2f", blueSlider.value)
    }
    
    // MARK: - Private Methods
    private func changeColor() {
        mutableView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}



