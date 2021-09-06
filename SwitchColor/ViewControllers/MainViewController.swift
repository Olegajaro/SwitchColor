//
//  MainViewController.swift
//  SwitchColor
//
//  Created by Олег Федоров on 04.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setCurrentColor(
        redComponent: CGFloat,
        greenComponent: CGFloat,
        blueComponent: CGFloat
        )
}

class MainViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    var color: UIColor!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = color ?? .red
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.color = mainView.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setCurrentColor(
        redComponent: CGFloat,
        greenComponent: CGFloat,
        blueComponent: CGFloat
    ) {
        mainView.backgroundColor = UIColor(
            red: redComponent,
            green: greenComponent,
            blue: blueComponent,
            alpha: 1
        )
    }
}
