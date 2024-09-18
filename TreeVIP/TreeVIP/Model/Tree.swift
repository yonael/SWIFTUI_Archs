import Foundation
import TreeServices

struct Tree: Identifiable, Hashable {
    let id: Int?
    let name: String?
    let kind: String?
    let stade: String?
    let address: String?
    let arrondissement: String?
    
    init(id: Int?, name: String?, kind: String?, stade: String?, address: String?, arrondissement: String?) {
        self.id = id
        self.name = name
        self.kind = kind
        self.stade = stade
        self.address = address
        self.arrondissement = arrondissement
    }
    
    init(from treeResponse: TreeResponse) {
        self.init(
            id: treeResponse.idbase,
            name: treeResponse.libellefrancais,
            kind: treeResponse.genre,
            stade: treeResponse.stadedeveloppement,
            address: treeResponse.adresse,
            arrondissement: treeResponse.arrondissement
        )
    }
    
    var fullAddress: String? {
        if let address,
           let arrondissement {
            return address + " " + arrondissement
        } else {
            return "Pas d'adresse renseignée"
        }
    }
}
