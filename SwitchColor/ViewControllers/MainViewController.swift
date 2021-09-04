//
//  MainViewController.swift
//  SwitchColor
//
//  Created by Олег Федоров on 04.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setCurrentColor(
        for redComponent: CGFloat,
        for greenComponent: CGFloat,
        and blueComponent: CGFloat
        )
}

class MainViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    
    var redComponent: CGFloat!
    var greenComponent: CGFloat!
    var blueComponent: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = UIColor(
            red: redComponent ?? 1,
            green: greenComponent ?? 1,
            blue: blueComponent ?? 1,
            alpha: 1
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }

        settingsVC.redComponent = redComponent
        settingsVC.greenComponent = greenComponent
        settingsVC.blueComponent = blueComponent
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setCurrentColor(
        for redComponent: CGFloat,
        for greenComponent: CGFloat,
        and blueComponent: CGFloat
    ) {
        mainView.backgroundColor = UIColor(
            red: redComponent,
            green: greenComponent,
            blue: blueComponent,
            alpha: 1
        )
    }
}
