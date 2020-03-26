//
//  ContentView.swift
//  CoffeeApp
//
//  Created by Praveen Bhaskar on 22/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM = OrderListViewModel()
    @State var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach(self.orderListVM.orders, id: \.name) { order in
                    
                    Text(order.name).font(.largeTitle)
                }.onDelete(perform: delete)
            }
            
            .navigationBarTitle("Orders")
            .navigationBarItems(trailing: Button("Add New Order") {
                self.showModal = true
            })
                .sheet(isPresented: self.$showModal, onDismiss: {
                    self.orderListVM.fetchAllOrder()
                }) {
                AddOrderView(showModal: self.$showModal)
            }
        }

    }
    
    private func delete(at offset: IndexSet) {
        offset.forEach { (index) in
            let vm = self.orderListVM.orders[index]
            self.orderListVM.deleteOrder(vm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
