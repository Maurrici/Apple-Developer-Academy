//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notificações: \(profile.prefersNotifications ? "On": "Off")")
                Text("Fotos sazonais: \(profile.seasonalPhoto.rawValue)")
                Text("Data de meta: ") + Text(profile.goalDate, style: .date)
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                Text("Caminhadas recentes")
                    .font(.headline)
                
                HikeView(hike: modelData.hikes[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
