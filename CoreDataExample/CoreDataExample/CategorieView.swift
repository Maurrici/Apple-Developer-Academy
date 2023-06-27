//
//  CategorieView.swift
//  CoreDataExample
//
//  Created by Maurício de Moura on 14/06/23.
//

import SwiftUI

struct CategorieView: View {
    
    @State var category: Category
    @FetchRequest var items: FetchedResults<Item>
    
    @State private var isAddItemViewPresemted = false
    @State private var isEditCategory = false
    @State var editName = ""
    
    var body: some View {
        
        VStack{
            if(isEditCategory){
                HStack{
                    TextField("", text: $editName)
                        .textFieldStyle(.roundedBorder)
                    
                    Spacer()
                    
                    Button {
                        do{
                            try PersistanceController.shared.save()
                            isEditCategory.toggle()
                        }catch{
                            print(error.localizedDescription)
                        }
                    } label: {
                        Text("Confirmar")
                    }
                }
                .padding()
                
            }else{
                HStack{
                    Text(category.value ?? "")
                    
                    Spacer()
                    
                    Button {
                        isEditCategory.toggle()
                        editName = category.value ?? ""
                    } label: {
                        Text("Editar")
                    }
                }
                .padding()
            }
            
            
            
            List{
                ForEach(items){ item in
                    Label(item.value ?? "", systemImage: "list.bullet.circle.fill")
                }
                .onDelete(perform: delete(offsets:))
            }
            .toolbar{
                Button{
                    isAddItemViewPresemted.toggle()
                }label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isAddItemViewPresemted) {
                    AddItemView(category: category)
                }
            }
        }
    }
    
    func delete(offsets: IndexSet){
        withAnimation {
            offsets.forEach{ offset in
                let item = items[offset]
                do{
                    try PersistanceController.shared.delete(item)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

