//
//  MainViewController.swift
//  SwitchColor
//
//  Created by Олег Федоров on 04.09.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setCurrentColor(_ color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setCurrentColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

