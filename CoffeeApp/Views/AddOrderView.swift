//
//  AddOrderView.swift
//  CoffeeApp
//
//  Created by Praveen Bhaskar on 22/03/2020.
//  Copyright © 2020 Praveen Bhaskar. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    
    @State var addOrderVM = AddOrderViewModel()
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    
                    TextField("Enter Name", text: self.$addOrderVM.name)
                    
                    Picker(selection: self.$addOrderVM.type,
                           label: Text("Coffee Type")) {
                        
                        Text("Cappuccino").tag("cap")
                        Text("Regular").tag("reg")
                        Text("Expresso").tag("exp")

                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Button("Place Order") {
                        if self.addOrderVM.name.count > 0 {
                            self.addOrderVM.saveOrder()
                            self.showModal = false
                        }
                        
                    }
                }
            }.padding()
            
            .navigationBarTitle("Add Order")
        }
        
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(showModal: .constant(false))
    }
}
