//
//  ModelData.swift
//  Landmarks
//
//  Created by userext on 17/05/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject{
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
    
    var featureds: [Landmark] {
        landmarks.filter{$0.isFeatured}
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else{
        fatalError("Não foi possível encontrar o arquivo \(fileName)")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Não foi possível carregar o arquivo \(fileName)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Não foi possível decodificar o arquivo \(fileName)")
    }
}
