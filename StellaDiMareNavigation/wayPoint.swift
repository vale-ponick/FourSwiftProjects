//
//  wayPoint.swift
//  StellaDiMareNavigation
//
//  Created by Валерия Пономарева on 25.10.2025.
//

import Foundation

// ОСНОВНАЯ МОДЕЛЬ НАВИГАЦИОННОЙ ТОЧКИ
public struct Waypoint {
    public let name: String
    public let latitude: Double
    public let longitude: Double
    
    public init?(name: String, latitude: Double, longitude: Double) {
        guard !name.isEmpty,
              latitude >= -90.0 && latitude <= 90.0,
              longitude >= -180.0 && longitude <= 180.0 else {
            return nil
        }
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
