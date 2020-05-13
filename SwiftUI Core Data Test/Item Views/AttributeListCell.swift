//
//  AttributeListCell.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct AttributeListCell: View {
    
    var name: String
    var itemdescription: String
    var order: Int32
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(self.name)
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Text(String(self.itemdescription))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
    }
}

#if DEBUG
struct AttributeListCell_Previews: PreviewProvider {
    static var previews: some View {
        AttributeListCell(name: "Objects 0.0", itemdescription: "Basement", order: 99)
    }
}
#endif
