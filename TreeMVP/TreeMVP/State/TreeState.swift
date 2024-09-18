//
//  TreeStore.swift
//  TreeMVP
//
//  Created by Yonael Tordjman on 18/09/2024.
//

import Foundation

enum TreeState {
    case loading
    case error(message: String)
    case loaded(trees: [Tree])
}
