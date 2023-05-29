//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date>{
        let min = Calendar.current.date(byAdding: .year, value:-1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        
        return min...max
    }
    
    var body: some View {
        List{
            HStack{
                Text("Nome").bold()
                Divider()
                TextField("Nome", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Notificações").bold()
            }
            
            VStack(alignment: .leading, spacing: 20){
                Text("Foto sazonais").bold()
                
                Picker("Fotos sazonais", selection: $profile.seasonalPhoto){
                    ForEach(Profile.Season.allCases){ season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Data da meta").bold()
            }
        }
        .padding(.top, 30)
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
