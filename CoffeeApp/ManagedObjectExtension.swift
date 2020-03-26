//
//  ManagedObjectExtension.swift
//  CoffeeApp
//
//  Created by Praveen Bhaskar on 22/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NSManagedObjectContext {
    
    static var current: NSManagedObjectContext {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        return appdelegate.persistentContainer.viewContext
    }
}
