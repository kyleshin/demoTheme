//
//  ListViewController.swift
//  themeDemo
//
//  Created by Kyle Shin on 4/4/18.
//  Copyright © 2018 Kyle Hongkai Shin. All rights reserved.
//

import UIKit


class PetListViewController : UITableViewController {
    
    let cellId = "cellId"
    var pets:[Pet] = PetDataProvider.sharedProvider.petsData    //data for our table view
    
    //MARK:- View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundAndNavBarColor()
        //Listen for theme change, posted from settings page
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeTheme), name: .themeChanged, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK:- TableView Functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PetListCell
        
        cell.petNameLabel.text = "Pet Name: \(pets[indexPath.row].petName)"
        cell.petTypeLabel.text = "Type: \(pets[indexPath.row].animalType.rawValue)"
        cell.petPhoto.image = pets[indexPath.row].petPhoto
        
        setupCellColors(cell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    //MARK:-
    
    private func setupCellColors(_ cell: PetListCell){
        cell.backgroundColor = Theme.current.standardBackgroundColor
        cell.petNameLabel.textColor = Theme.current.standardTextColor
        cell.petTypeLabel.textColor = Theme.current.standardTextColor
    }
    
    private func setupBackgroundAndNavBarColor(){
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
    }
    
    private func updateThemeColor(){
        setupBackgroundAndNavBarColor()
        for cell in tableView.visibleCells {
            setupCellColors(cell as! PetListCell)
        }
    }
    
    @objc func didChangeTheme(){
        updateThemeColor()
    }

}
