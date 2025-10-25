//
//  routeOperation.swift
//
// StellaDiMareNavigation
//
//  Created by Валерия Пономарева on 25.10.2025.

import Foundation

// РАСШИРЕНИЕ ДЛЯ ОПЕРАЦИЙ С МАРШРУТОМ
extension Route {
    // ОПЕРАЦИИ УДАЛЕНИЯ
    public mutating func removeWaypoint(at index: Int) -> Bool {
        guard index >= 0 && index < waypoints.count else { return false }
        waypoints.remove(at: index)
        return true
    }
    
    public mutating func removeWaypoint(named name: String) -> Bool {
        if let index = waypoints.firstIndex(where: { $0.name == name }) {
            return removeWaypoint(at: index)
        }
        return false
    }
    
    public mutating func clearRoute() {
        waypoints.removeAll()
    }
    
    // ДОПОЛНИТЕЛЬНЫЕ ОПЕРАЦИИ
    public mutating func insertWaypoint(_ waypoint: Waypoint, at index: Int) -> Bool {
        guard index >= 0 && index <= waypoints.count else { return false }
        waypoints.insert(waypoint, at: index)
        return true
    }
}
        

