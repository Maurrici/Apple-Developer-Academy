//
//  AddCategoryView.swift
//  CoreDataExample
//
//  Created by Maurício de Moura on 13/06/23.
//

import SwiftUI

struct AddCategoryView: View {
    @State private var value = ""
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        VStack{
            TextField("Category", text: $value)
                .textFieldStyle(.roundedBorder)
            
            Button {
                save()
            } label: {
                Text("Save")
            }
            Spacer()
        }
        .padding()
    }
    
    func save(){
        let category = Category(context: viewContext)
        
        category.value = value
        category.
        
        do{
            try PersistanceController.shared.save()
            dismiss()
        }catch{
            print(error.localizedDescription)
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
