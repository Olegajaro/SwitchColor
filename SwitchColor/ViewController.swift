//
//  ViewController.swift
//  SwitchColor
//
//  Created by Олег Федоров on 20.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mutableView: UIView!
    
    @IBOutlet var valueRedSlider: UILabel!
    @IBOutlet var valueGreenSlider: UILabel!
    @IBOutlet var valueBlueSlider: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mutableView.layer.cornerRadius = 10
    }
    
    func changeColor() {
        mutableView.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value),
            alpha: 1)
    }

    
    @IBAction func changingRedAlphaComponent() {
        valueRedSlider.text = String(format: "%.2f", redSlider.value)
        
        changeColor()
    }
    
    @IBAction func changingGreenAlphaComponent() {
        valueGreenSlider.text = String(format: "%.2f", greenSlider.value)
        
        changeColor()
    }
    
    @IBAction func changingBlueAlphaComponent(_ sender: Any) {
        valueBlueSlider.text = String(format: "%.2f", blueSlider.value)
        
        changeColor()
    }
}

