//
//  TreeDetail.swift
//  TreeVIP
//
//  Created by Yonael Tordjman on 17/09/2024.
//

import SwiftUI

struct TreeDetail: View {
    
    // IN MORE COMPLEXE CASE WE NEED TO LOOP OVER OUR VIEWMODEL LIKE BEFORE.
    // BECAUSE IT IS AN EXAMPLE WE DON'T GO AS FAR
    let tree: Tree
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Nom: \(tree.name ?? "No name")")
            Text("Genre: \(tree.kind ?? "No kind")")
            Text("Developement: \(tree.stade ?? "No information about development of the tree")")
            Text("Adresse \(tree.fullAddress ?? "No address")")
        }
    }
}

#Preview {
    TreeDetail(tree: Tree(id: 1, name: "name", kind: "kind", stade: "stade", address: "address", arrondissement: "arrondissement"))
}
