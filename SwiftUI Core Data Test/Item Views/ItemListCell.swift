//
//  ItemListCell.swift
//  CoreDataSUI
//
//  Created by Erik Kuipers on 05/04/20.
//  Copyright © 2020  ECKO Design. All rights reserved.
//

import SwiftUI

struct ItemListCell: View {
    
    var name: String
    var itemdescription: String
    var order: Int32
    var check: Bool
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(name)
                        .font(.headline)
                    
                    Spacer()
                }
                HStack {
                    Text(String(itemdescription))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
            if self.check {
                Image(systemName: "checkmark")
            }
        }
    }
}

#if DEBUG
struct ItemListCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemListCell(name: "Item 0", itemdescription: "Basement", order: 0, check: false)
    }
}
#endif
