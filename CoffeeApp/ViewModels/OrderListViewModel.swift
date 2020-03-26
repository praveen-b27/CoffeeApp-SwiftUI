//
//  OrderListViewModel.swift
//  CoffeeApp
//
//  Created by Praveen Bhaskar on 22/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders: [OrderModel] = []
    
    init() {
        fetchAllOrder()
    }
    
    func fetchAllOrder() {
        self.orders = CoreDataManager.shared.fetchAllOrder().map(OrderModel.init)
    }
    
    func deleteOrder(_ model: OrderModel) {
        CoreDataManager.shared.deleteOrder(name: model.name)
        fetchAllOrder()
    }
}

class OrderModel {
    var name: String = ""
    var type: String = ""
    
    init(order: Order) {
        self.name = order.name ?? ""
        self.type = order.type ?? ""
    }
}
