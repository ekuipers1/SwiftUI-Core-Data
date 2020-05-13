//
//  AttributeFormView.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct AttributeFormView: View {
    
    @Binding var textName: String
    @Binding var textOrder: String
    @Binding var itemdescription: String
    
    var body: some View {
        
            Section(header: Text("Object".uppercased())) {
                
                VStack {
                    HStack {
                        Text("Name: ")
                        Spacer()
                    }
                    TextField("Enter Object Name", text: self.$textName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: 5)
                }.font(.callout).padding()    .background(RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("lilac")))
                
                VStack {
                    HStack {
                        Text("Amount: ")
                        Spacer()
                    }
                    TextField("Enter Amount", text: self.$textOrder)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    .shadow(radius: 5)
                }.font(.callout).padding()    .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("lilac")))
                
                VStack {
                    HStack {
                        Text("Description: ")
                        Spacer()
                    }
                    TextField("Enter Description", text: self.$itemdescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(radius: 5)
                    }.font(.callout).padding()    .background(RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color("lilac")))
            }
    }
}

#if DEBUG
struct AttributeFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Form {
                AttributeFormView(textName: .constant(" Objects "), textOrder: .constant("0"), itemdescription: .constant("Decription"))
           }
        }
    }
}
#endif
