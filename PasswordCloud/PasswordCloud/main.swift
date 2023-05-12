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

enum passwordListError: Error {
    case invalidSelection
}

// Global Variables
var passwordList: [Password] = readFile()
let menu = """
Bem vindo ao Gerenciador de Senhas
            🍎
    Selecione uma opção:
    1 - Criar uma senha
    2 - Visualizar todas as senhas
    3 - Pesquisar senha
    4 - Editar uma senha
    5 - Remover uma senha
    6 - Encerrar aplicação
"""

// Main Execution
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
                search()
            case 4:
            if let index = Int(getInput("Digite o index da senha a ser alterada")){
                do {
                    try edit(indice: index)
                } catch passwordListError.invalidSelection {
                    print("Índice não encontrado!")
                }
                
            }
            case 5:
            if let index = Int(getInput("Digite o index da senha a ser deletado")){
                do {
                    try remove(indice: index)
                } catch passwordListError.invalidSelection {
                    print("Índice não encontrado!")
                }
                
            }
            case 6:
                running = false
            default:
                print("Opção inválida!")
        }
    }
}

print("Aplicação encerrada!")

// Control Functions
func create(){
    print("Criação de Senha:")
    let userName = getInput("Nome de usuário:")
    let url = getInput("URL:").lowercased()
    var value: String
    
    var choice: Bool = true
    while choice {
        print("Você deseja gerar uma senha aleatória?")
        let response = getInput("Digite sim(S) ou não(N)")
        
        if response.lowercased() == "s" || response.lowercased() == "sim" {
            value = UUID().uuidString
        } else if response.lowercased() == "n" || response.lowercased() == "não" || response.lowercased() == "nao" {
            value = getInput("Senha:")
        }else{
            print("Opção inválida!")
            continue
        }
        
        let newPassword = Password(value, userName, url)
        
        passwordList.append(newPassword)
        
        choice = false
    }
    
    writeFile(passwordList)
    print("Senha criada com sucesso!")
    print("Aperte return para prosseguir")
    _ = readLine()
}

func read(){
    print("\(formatString("Index"))| \(formatString("Usuário"))| \(formatString("URL"))| \(formatString("Senha"))")
    passwordList.enumerated().forEach { (index, item) in
        print("\(formatString(String(index)))| \(formatString(item.userName))| \(formatString(item.url))| \(formatString(item.value))")
    }
    
    print("Aperte return para prosseguir")
    _ = readLine()
}

func search() {
    let url = getInput("Digite a URL desejada: ")
    
    let filterList = passwordList.filter { value in
        value.url.contains(url)
    }
    
    if (filterList.isEmpty) {
        print("Valor não encontrado")
    } else {
        print("\(formatString("Index"))| \(formatString("Usuário"))| \(formatString("URL"))| \(formatString("Senha"))")
        filterList.enumerated().forEach { (index, item) in
            print("\(formatString(String(index)))| \(formatString(item.userName))| \(formatString(item.url))| \(formatString(item.value))")
        }
    }
    
    print("Aperte return para prosseguir")
    _ = readLine()
    
}

func edit(indice: Int) throws {
    switch indice {
        case 0..<passwordList.count:
            var selectedPassword = passwordList.enumerated().filter { index, item in
                index == indice
            }[0].element
            
            selectedPassword.userName = getInput("Digite o novo usuário:")
            selectedPassword.value = getInput("Digite o novo password:")
        
            passwordList[indice] = selectedPassword
            
            writeFile(passwordList)
            print("Senha alterada com sucesso!")
            
            print("Aperte return para prosseguir")
            _ = readLine()
        default:
            throw passwordListError.invalidSelection
    }

}

func remove(indice: Int) throws {
    switch indice {
        case 0..<passwordList.count:
            let filterList = passwordList.enumerated().filter { index, item in
                index != indice
            }
            passwordList = filterList.map({ item in
                return item.element
            })
            
            writeFile(passwordList)
            print("Senha deletada com sucesso!")
            
            print("Aperte return para prosseguir")
            _ = readLine()
        default:
            throw passwordListError.invalidSelection
    }

}

// File Manipulation Functions
func readFile() -> [Password] {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let url = path.appendingPathComponent("data").appendingPathExtension("json")
    
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
    let url = path.appendingPathComponent("data").appendingPathExtension("json")
    
    let encoder = JSONEncoder()
    
    guard let jsonData = try? encoder.encode(list) else { fatalError("Não foi possível realizar a codificação!")}
    
    do {
        try jsonData.write(to: url)
    } catch  {
        print(error)
    }
}

// Help functions
func formatString(_ text: String) -> String{
    if(text.count < 20){
        let space = String(repeating: " ", count: 20 - text.count)
        return text + space
    }else{
        return text
    }
}

func getInput(_ label: String) -> String {
    while(true){
        print(label)
        if let input = readLine(), input != ""  {
            if (input.count < 20) {
                return input
            } else {
                print ("O campo deve ter no máximo 20 caracteres")
            }
        } else {
            print("Campo obrigatório")
        }
    }
}
