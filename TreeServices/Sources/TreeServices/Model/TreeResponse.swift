//
//  Tree.swift
//  TreeServices
//
//  Created by Yonael Tordjman on 16/09/2024.
//

import Foundation

public struct ResultResponse: Codable {
    public let results: [TreeResponse]
}

public struct TreeResponse: Codable {
    public let idbase: Int?
    public let typeemplacement, domanialite, arrondissement: String?
    public let complementadresse: String?
    public let numero: Int?
    public let adresse, idemplacement, libellefrancais, genre: String?
    public let espece: String?
    public let varieteoucultivar: String?
    public let circonferenceencm, hauteurenm: Int?
    public let stadedeveloppement, remarquable: String?
    public let geoPoint2D: GeoPoint2D?
    
    enum CodingKeys: String, CodingKey {
        case idbase, typeemplacement, domanialite, arrondissement, complementadresse, numero, adresse, idemplacement, libellefrancais, genre, espece, varieteoucultivar, circonferenceencm, hauteurenm, stadedeveloppement, remarquable
        case geoPoint2D = "geo_point_2d"
    }
}

public struct GeoPoint2D: Codable {
    public let lon, lat: Double
}
