//
//  main.swift
//  PasswordCloud
//
//  Created by userext on 09/05/23.
//

import Foundation

struct Password{
    var value: String
    var userName: String
    var url: String
}

var passwordList: [Password]

print("Bem vindo, selecione uma opção")
print("Digite 1, para criar sua senha")
print("Digite 2, para visualizar sua senha")
print("Digite 3, para editar sua senha")
print("Digite 4, para remover sua senha")
print("Digite 5, para sair")

var running: Bool = true
while (running) {
    if let input = readLine(), let option = Int(input) {
        switch option {
            case 1:
                create()
            case 2:
                print("Visualizar")
            case 3:
                print("Editar")
            case 4:
                print("Remover")
            case 5:
                running = false
            default:
                print("Opção inválida!")
        }
    }
}

print("Aplicação encerrada!")

func create() -> Void{
    print("Digite um Username:")
    var userName = readLine()
    
    print("Digite um URL:")
    var url = readLine()
    
    print("Digite uma senha:")
    var password = readLine()
    
    let newPassword = 
}

