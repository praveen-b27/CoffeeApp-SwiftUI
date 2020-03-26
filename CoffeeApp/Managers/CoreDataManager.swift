//
//  CoreDataManager.swift
//  CoffeeApp
//
//  Created by Praveen Bhaskar on 22/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func fetchOrder(name: String) -> Order? {
        var orders: [Order] = []
        
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        orderRequest.predicate = NSPredicate(format: "name == %@", name)
        
        do {
            orders = try self.moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return orders.first
    }
    
    func fetchAllOrder() -> [Order]{
        
        var orders: [Order] = []
        
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        
        do {
            orders = try self.moc.fetch(orderRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return orders
    }
    
    func saveOrder(name: String, type: String) {
        let order = Order(context: self.moc)
        order.name = name
        order.type = type
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    
    func deleteOrder(name: String) {
        
        do {
            if let order = self.fetchOrder(name: name) {
                self.moc.delete(order)
                try self.moc.save()

            }
        } catch let error as NSError {
            print(error)
        }
    }
}
