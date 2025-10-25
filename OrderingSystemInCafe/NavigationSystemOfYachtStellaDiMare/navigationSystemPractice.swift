//
//  navigationSystemPractice.swift
//  OrderingSystemInCafe
//
//  Created by Валерия Пономарева on 25.10.2025.
//

import Foundation

// 🎯 TASK 1: SAFE WAYPOINT"

struct SafeMapPoint {
    let name: String
    let latitude: Double
    let longitude: Double
    
    init?(name: String, latitude: Double, longitude: Double) {
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
// tests
func testPoints() {
    print("🧪 Testing SafeMapPoint...")
    
    if let point = SafeMapPoint(name: "Paranagua", latitude: -25.51, longitude: -48.33) {
        print("📍 Point created: \(point.name)")
        print("   Latitude: \(point.latitude)")
        print("   Longitude: \(point.longitude)")
    }
    if SafeMapPoint(name: "", latitude: -25.51, longitude: -48.33) == nil {
        print("✅ Correctly rejected empty name")
    }
    if SafeMapPoint(name: "Test", latitude: 95.0, longitude: -48.33) == nil {
        print("✅ Correctly rejected invalid longitude")
    }
}

// testPoints()

/* 🎯 TASK 1: SAFE WAYPOINT
 🧪 Testing SafeMapPoint...
 📍 Point created: Paranagua
    Latitude: -25.51
    Longitude: -48.33
 ✅ Correctly rejected empty name
 ✅ Correctly rejected invalid longitude */
