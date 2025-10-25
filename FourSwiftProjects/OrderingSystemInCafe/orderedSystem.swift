//
//  orderedSystem.swift
//
//  Created by Валерия Пономарева on 24.10.2025.
//

import Foundation

enum MenuCategory {
    case drinks, hotDishes, desserts
}

struct MenuItem {
    let dish: String
    let price: Double
    let id: UUID
    let category: MenuCategory
    }

enum StatusOrder {
    case pending, preparing, ready, completed
}

struct Order {
    let items: [MenuItem]
    let status: StatusOrder
    let customer: Customer
    
    var total: Double {
        return items.reduce(0) { $0 + $1.price }
    }
    
    var itemsCount: Int
}

struct Customer {
    let name: String
    let id: UUID
    
    var orderHistory: [Order] = []
}
