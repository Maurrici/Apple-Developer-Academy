//
//  AddItemView.swift
//  CoreDataExample
//
//  Created by Maurício de Moura on 14/06/23.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var value = ""
    
    var category: Category
    
    var body: some View {
        VStack{
            Spacer()
            
            TextField("Item", text: $value)
                .textFieldStyle(.roundedBorder)
            
            Button{
                save()
            }label: {
                Text("Save")
            }
        }
        .padding()
    }
    
    func save() {
        let item = Item(context: viewContext)
        
        item.value = value
        item.addToCategories(category)
        
        do{
            try PersistanceController.shared.save()
            dismiss()
        }catch{
            print(error.localizedDescription)
        }
    }
}

