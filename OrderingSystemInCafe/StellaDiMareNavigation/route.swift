//
//  route.swift
//  StellaDiMareNavigation
//
//  Created by Валерия Пономарева on 25.10.2025.
//

import Foundation

// ОСНОВНАЯ МОДЕЛЬ МАРШРУТА
public struct Route {
    private var waypoints: [Waypoint] = []
    
    public var count: Int { return waypoints.count }
    public var isEmpty: Bool { return waypoints.isEmpty }
    public var allWaypoints: [Waypoint] { return waypoints }
    
    public init() {}
    
    // ОСНОВНЫЕ ОПЕРАЦИИ
    public mutating func addWaypoint(_ waypoint: Waypoint) {
        waypoints.append(waypoint)
    }
    
    public func getWaypoint(at index: Int) -> Waypoint? {
        guard index >= 0 && index < waypoints.count else { return nil }
        return waypoints[index]
    }
    
    public func containsWaypoint(named name: String) -> Bool {
        return waypoints.contains { $0.name == name }
    }
}
