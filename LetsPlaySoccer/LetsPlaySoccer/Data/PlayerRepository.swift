//
//  PlayerRepository.swift
//  LetsPlaySoccer
//
//  Created by Maurício de Moura on 16/06/23.
//

import Foundation
import CoreData

class PlayerRepository {
    private let context: NSManagedObjectContext
    
    init() {
        self.context = PersistanceController.shared.container.viewContext
    }
    
    // Função para criar um novo Pet no CoreData
    func createPet(_ player: PlayerModel) {
        let playerEntity = Player(context: context)
        
        // Configurar os atributos do petEntity com base nos valores do PlayerModel
        playerEntity.id = player.id
        playerEntity.name = player.name
        playerEntity.age = Int64(player.age)
        playerEntity.image = player.image
        
        // Salvar o contexto para persistir o novo pet no CoreData
        saveContext()
    }
    
    // Função para buscar um Pet pelo ID e retornar como PlayerModel
    func getPetById(_ id: UUID) -> PlayerModel? {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            let playerEntity = result.first
            
            if let playerEntity = playerEntity {
                // Converter o playerEntity em um PlayerModel e retornar
                return convertToPlayerModel(playerEntity)
            }
        } catch {
            print("Erro ao buscar pet do CoreData: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    // Função para pegar todos os Pet
    func getAllPlayers() -> [PlayerModel] {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        
        do {
            let playerEntities = try context.fetch(fetchRequest)
            
            // Converter cada petEntity em um PetModel
            let playerModels = playerEntities.map { convertToPlayerModel($0) }
            
            return playerModels
        } catch {
            print("Erro ao obter pets do CoreData: \(error.localizedDescription)")
        }
        
        return []
    }
    
    // Função para atualizar um Pet no CoreData com base no ID
    func updatePetById(_ id: UUID, with player: PlayerModel) {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id as CVarArg)
        
        do {
            let result = try context.fetch(fetchRequest)
            let playerEntity = result.first
            
            if let playerEntity = playerEntity {
                // Atualizar os atributos do petEntity com base nos valores do PlayerModel
                playerEntity.name = player.name
                playerEntity.age = Int64(player.age)
                playerEntity.position = player.position.rawValue
                playerEntity.image = player.image
                
                // Salvar o contexto para persistir as mudanças no CoreData
                saveContext()
            }
        } catch {
            print("Erro ao atualizar pet do CoreData: \(error.localizedDescription)")
        }
    }
    
    // Função para deletar um Pet do CoreData com base no ID
    func deletePetById(_ id: UUID) {
        let fetchRequest: NSFetchRequest<Player> = Player.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        print(fetchRequest)
        
        do {
            let result = try context.fetch(fetchRequest)
            print(result)
            let playerEntity = result.first
            
            if let playerEntity = playerEntity {
                // Remover o petEntity do contexto e salvar as mudanças
                context.delete(playerEntity)
                saveContext()
            }
        } catch {
            print("Erro ao deletar pet do CoreData: \(error.localizedDescription)")
        }
    }
    
    // Função auxiliar para converter um Pet (PetEntity) em um PlayerModel
    private func convertToPlayerModel(_ playerEntity: Player) -> PlayerModel {
        var playerModel = PlayerModel()
        playerModel.id = playerEntity.id ?? UUID()
        playerModel.name = playerEntity.name ?? ""
        playerModel.age = Int(playerEntity.age)
        playerModel.position = Position(rawValue: playerEntity.position ?? "Indefinido") ?? Position.none
        playerModel.image = playerEntity.image ?? nil
        
        return playerModel
    }
    
    // Função auxiliar para salvar o contexto do CoreData
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Erro ao salvar contexto do CoreData: \(error.localizedDescription)")
        }
    }
}
