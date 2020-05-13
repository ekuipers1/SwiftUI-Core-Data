//
//  ItemFormView.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct ItemFormView: View {

    @Binding var textName: String
    @Binding var textOrder: String
    @Binding var itemdescription: String
    
    @Binding var editMode: EditMode
    
    var body: some View {
        
        Section(header: Text("Item".uppercased())) {
            
            VStack {
                HStack {
                    Text("Name: ").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    TextField("Enter Item Name", text: self.$textName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: 5)
                } else {
                    HStack {
                        Text(self.textName)
                        Spacer()
                    }
                }
            }.font(.callout).padding()    .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color("brownish")))
            
            VStack {
                HStack {
                    Text("Amount: ").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    TextField("Enter Order", text: self.$textOrder)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: 5)
                } else {
                    HStack {
                        Text(self.textOrder)
                        Spacer()
                    }
                }
            }.font(.callout).padding()    .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color("brownish")))
            
            VStack {
                HStack {
                    Text("Description: ").foregroundColor(.gray)
                    Spacer()
                }
                if self.editMode == .active {
                    TextField("Enter description", text: self.$itemdescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: 5)
                } else {
                    HStack {
                        Text(self.itemdescription)
                        Spacer()
                    }
                }
            }.font(.callout).padding()    .background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color("brownish")))
        }
    }
}

#if DEBUG
struct ItemFormView_Previews : PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            Form {
                ItemFormView(textName: .constant("Item 0"),
                             textOrder: .constant("0"),
                             itemdescription: .constant("Description 0"),
                             editMode: .constant(.active) )
            }
        }
    }
}
#endif
