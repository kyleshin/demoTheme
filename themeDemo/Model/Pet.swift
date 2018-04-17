//
//  Pet.swift
//  themeDemo
//
//  Created by Kyle Shin on 4/11/18.
//  Copyright © 2018 Kyle Hongkai Shin. All rights reserved.
//

import UIKit

struct Pet {
    let animalType: PetType
    let petName: String
    var petPhoto: UIImage?
}

class PetDataProvider {
    static let sharedProvider = PetDataProvider()
    
    let petsData: [Pet]
    
    init() {
        self.petsData = [
            Pet(animalType: .Fish, petName: "Nemo", petPhoto: UIImage(named:"fish")),
            Pet(animalType: .Dog, petName: "Chowder", petPhoto: UIImage(named:"dog")),
            Pet(animalType: .Cat, petName: "Chloe", petPhoto: UIImage(named: "cat"))
        ]
    }
    
}
