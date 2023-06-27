//
//  ContentView.swift
//  CoreDataExample
//
//  Created by Maurício de Moura on 13/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isAddCategoryViewPresented = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Category.value, ascending: true)],
        animation: .default)
        private var categories: FetchedResults<Category>
    
    @State private var search = ""
    
    var body: some View {
        List{
            ForEach(categories){ category in
                NavigationLink {
                    let itemsCategory = FetchRequest<Item>(
                        sortDescriptors: [NSSortDescriptor(keyPath: \Item.value, ascending: true)],
                        predicate: NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Item.categories), category),
                        animation: .default)
                    
                    CategorieView(category: category, items: itemsCategory)
                } label: {
                    Text(category.value ?? "")
                }

            }
            .onDelete(perform: delete(offsets:))
        }
        .searchable(text: $search)
        .onChange(of: search, perform: { newValue in
            categories.nsPredicate = searchPredicate(query: search)
        })
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    isAddCategoryViewPresented.toggle()
                } label: {
                    Label("Adicionar", systemImage: "plus")
                }
                .sheet(isPresented: $isAddCategoryViewPresented) {
                    AddCategoryView()
                }
            }
        }
    }
    
    private func delete(offsets: IndexSet){
        withAnimation {
            offsets.forEach{ offset in
                let category = categories[offset]
                
                do{
                    try PersistanceController.shared.delete(category)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    private func searchPredicate(query: String) -> NSPredicate? {
        if query.isEmpty { return nil }
        return NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Category.value), query)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
