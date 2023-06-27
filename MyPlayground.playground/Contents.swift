import Foundation

struct Pokemon: Codable{
    var name: String
    var url: String
}

class API {
    static private var baseURL = "https://pokeapi.co/api/v2/"
    
    static func getAllPokemons() async -> [Pokemon] {
        let urlRequest = URLRequest(url: URL(string: "https://pokeapi.co/api/v2/pokemon")!)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let pokemons = try JSONDecoder().decode([Pokemon].self, from: data)
            
            return pokemons
        } catch{
            print(error)
        }
        
        return []
    }
    
}

let result = await API.getAllPokemons()

print(result)
