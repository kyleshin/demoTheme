//
//  SettingsViewController.swift
//  themeDemo
//
//  Created by Kyle Shin on 4/11/18.
//  Copyright © 2018 Kyle Hongkai Shin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var themeSegmentedControl: UISegmentedControl!
    @IBOutlet var themeLabel: UILabel!
    @IBOutlet var settingLabel: UILabel!
    
    //MARK:- IBActions
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleTheme(_ sender: UISegmentedControl) {
        
        switch themeSegmentedControl.selectedSegmentIndex {
        case 0:
            Theme.light.apply()
        case 1:
            Theme.dark.apply()
        case 2:
            Theme.dubs.apply()
        default:
            Theme.light.apply()
        }
        
        NotificationCenter.default.post(name: .themeChanged, object: nil)
    }
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        themeSegmentedControl.selectedSegmentIndex = Theme.current.rawValue
        setupColors()
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeTheme), name: .themeChanged, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK:- Functions
    @objc func didChangeTheme(){
        UIView.animate(withDuration: 0.2) {
            self.setupColors()
        }
    }

    private func setupColors(){
        view.backgroundColor = Theme.current.standardBackgroundColor
        themeLabel.textColor = Theme.current.standardTextColor
        settingLabel.textColor = Theme.current.standardTextColor
        doneButton.setTitleColor(Theme.current.standardTextColor, for: .normal)
        themeSegmentedControl.tintColor = Theme.current.standardTintColor
    }


}

