//
//  Destinations.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import Foundation

// MARK: - Destinations
struct Destinations: Codable {
    let results: [DestinationsResult]?
}

// MARK: - Result
struct DestinationsResult: Codable {
    let type: TypeEnum?
    let name: String?
    let location: Location?
    let address: String?
    let cover: String?
}

// MARK: - Location
struct Location: Codable {
    let latitude, longitude: Double?
}

enum TypeEnum: String, Codable {
    case country = "country"
}
