import Foundation

struct Password: Codable{
    var value: String
    var userName: String
    var url: String
    
    init(_ value: String, _ userName: String, _ url: String) {
        self.value = value
        self.userName = userName
        self.url = url
    }
}
 


func readFile() -> [Password] {

    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let url = path.appendingPathComponent("Challenges/PasswordCloud/PasswordCloud/data").appendingPathExtension("json")
    print(url)
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()

        return try decoder.decode([Password].self, from: data)
        
    } catch  {
        return []
    }
}

func writeFile(_ list: [Password]){
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let url = path.appendingPathComponent("Challenges/PasswordCloud/PasswordCloud/data").appendingPathExtension("json")
    
    
    let encoder = JSONEncoder()
    
    guard let jsonData = try? encoder.encode(list) else { fatalError("Não foi possível realizar a codificação!")}
    print(jsonData)
    do {
        try jsonData.write(to: url)
    } catch  {
        print(error)
    }
}

var passwordList: [Password] = readFile()

enum passwordListError: Error {
    case invalidSelection
    
//    var rawValue: String {
//        switch self {
//        case  .invalidSelection:
//            return "Índice não encontrado"
//        }
//    }
}

var menu = """
Bem vindo ao Gerenciador de Senhas
              🍎
    Selecione uma opção:
    1 - Criar uma senha
    2 - Visualizar uma senha
    3 - Editar uma senha
    4 - Remover uma senha
    5 - Encerrar aplicação
"""
var running: Bool = true
while (running) {
    print(menu)
    if let input = readLine(), let option = Int(input) {
        switch option {
            case 1:
                create()
            case 2:
                read()
            case 3:
            if let index = Int(getInput("Digite o index da senha a ser alterada")){
                do {
                    try edit(indice: index)
                } catch passwordListError.invalidSelection {
                    print("Índice não encontrado!")
                }
                
            }
            case 4:
            if let index = Int(getInput("Digite o index da senha a ser deletado")){
                do {
                    try remove(indice: index)
                } catch passwordListError.invalidSelection {
                    print("Índice não encontrado!")
                }
                
            }
            case 5:
                running = false
            default:
                print("Opção inválida!")
        }
    }
}

print("Aplicação encerrada!")

func getInput(_ label: String) -> String {
    while(true){
        print(label)
        if let input = readLine(), input != "" {
            return input
        }else{
            print("Campo obrigatório")
        }
    }
}

func create(){
    print("Criação de Senha:")
    let userName = getInput("Nome de usuário:")
    let url = getInput("URL:")
    let value = getInput("Senha:")
    
    let newPassword = Password(value, userName, url)
    
    passwordList.append(newPassword)
    
    writeFile(passwordList)
    print("Senha criada com sucesso!")
    print(passwordList)
    _ = readLine()
}

func read(){
    print("Visualização de Senha:")
    print("index \t| usuário \t| URL \t| Senha")
    
    
    passwordList.enumerated().forEach { (index, item) in
        print("\(index) \t| \(item.userName) \t| \(item.url) \t| \(item.value)")
    }
    
    _ = readLine()
}

func edit(indice: Int) throws {
    switch indice {
        case 0..<passwordList.count:
            var selectedPassword = passwordList.enumerated().filter { index, item in
                index == indice
            }[0].element
            
            selectedPassword.value = getInput("Digite o novo password")
        
            passwordList[indice] = selectedPassword
        
            print("Senha alterada com sucesso!")
            
            _ = readLine()
        default:
            throw passwordListError.invalidSelection
    }

}

func remove(indice: Int) throws {
    switch indice {
        case 0..<passwordList.count:
            var filterList = passwordList.enumerated().filter { index, item in
                index != indice
            }
            passwordList = filterList.map({ item in
                return item.element
            })
            print("Senha deletada com sucesso!")
            
            _ = readLine()
        default:
            throw passwordListError.invalidSelection
    }

}
