//
//  ContentView.swift
//  Landmarks
//
//  Created by userext on 16/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab{
        case featured
        case list
    }
    
    init() {
        //UITabBar.appearance().barTintColor = UIColor(Color("mainColor"))
    }
    
    var body: some View {
            TabView(selection: $selection) {
                CategoryHome()
                    .tabItem{
                        Label("Menu",systemImage: "star")
                    }
                    .tag(Tab.featured)
                
                LandmarkList()
                    .tabItem{
                        Label("Lista", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
            }
            .tint(.orange)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self){ deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environmentObject(ModelData())
        }
    }
}
