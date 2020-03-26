//
//  AddOrderViewModel.swift
//  CoffeeApp
//
//  Created by Praveen Bhaskar on 22/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import Foundation

class AddOrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
    
    func saveOrder() {
        CoreDataManager.shared.saveOrder(name: self.name, type: self.type)
    }
}
