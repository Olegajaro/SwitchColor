//
//  MainViewController.swift
//  SwitchColor
//
//  Created by Олег Федоров on 04.09.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    var redComponent: CGFloat!
    var greenComponent: CGFloat!
    var blueComponent: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redComponent = 0.05
        greenComponent = 0.23
        blueComponent = 0.49
        
        mainView.backgroundColor = UIColor(
            red: redComponent,
            green: greenComponent,
            blue: blueComponent,
            alpha: 1
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }

        settingsVC.redComponent = redComponent
        settingsVC.greenComponent = greenComponent
        settingsVC.blueComponent = blueComponent
    }
}
