//
//  main.swift
//  OrderingSystemInCafe
//
//  Created by Валерия Пономарева on 24.10.2025.
//

import Foundation

print("Ordering System in Cafe")
print("Shopping List Practice")

struct ShoppingProduct { // объяви struct - value type, создаёт копии
    let name: String     // Синтаксис: struct Имя { }
    let price: Double    // Логика: Модель данных для товара
    
    init?(name: String, price: Double) { // 🛡️ FAILEABLE INITIALIZER
        guard !name.isEmpty && price > 0 else { // ранний выход при невалидных данных
            return nil // может вернуть nil при ошибке
        }
        self.name = name
        self.price = price
    } // Логика: Защита от создания объекта с некорректными данными
}

struct ShoppingList { // COMPUTED PROPERTY С REDUCE
    var products: [ShoppingProduct] = []  // ← начинаем с пустого массива
    
    var totalCost: Double { // Логика: Функциональный подход к суммированию
        return products.reduce(0) {$0 + $1.price } // reduce(0) - начальное значение аккумулятора, $0 - текущая сумма, $1 - следующий элемент массива
    }
    
    var productCount: Int {
        return products.count
    }

mutating func addProduct(_ product: ShoppingProduct) { // MUTATING МЕТОДЫ
    products.append(product) // mutating - разрешает изменение свойств структуры + скрывает внешнее имя параметра. Логика: Структуры по умолчанию неизменяемы
}

mutating func removeProduct(at index: Int) -> Bool { // 🛡️ SAFE ARRAY ACCESS
    guard index >= 0 && index < products.count else { return false } // guard - защита от index out of range
    products.remove(at: index)
    return true // Логика: Предотвращение крэша приложения
    }

    mutating func removeAllProducts(named name: String) {
        products.removeAll { $0.name == name }
    }
}

func testShopping() { // ТЕСТИРОВАНИЕ С OPTIONAL BINDING
    print("- Test shopping list -")
    
    var myList = ShoppingList()
    
    if let limon = ShoppingProduct(name: "Limon", price: 265.0), // , - множественное optional binding
       let orange = ShoppingProduct(name: "Orange", price: 325.0),
       let apple = ShoppingProduct(name: "Apple", price: 245.5),
       let banana = ShoppingProduct(name: "Banana", price: 145.0) { // Логика: Продолжение только если ВСЕ объекты созданы успешно
        
        
        myList.addProduct(limon)
        myList.addProduct(orange)
        myList.addProduct(apple)
        myList.addProduct(banana)
        
        
        print("📦 Products in list: \(myList.productCount)")
        print("💰 Total cost: \(myList.totalCost)")
        
        if myList.removeProduct(at: 1) {           // ← ОДИН вызов!
            print("✅ Апельсины удалены")
        } else {
            print("❌ Неверный индекс")
        }
        
        print("🗑️ After removal:")
        print("📦 Products in list: \(myList.productCount)")
        print("💰 Total cost: \(myList.totalCost)")
        
    } else {
        print("❌ Error creating product")
    }
}
    
testShopping()

/* Ordering System in Cafe
 Shopping List Practice
 - Test shopping list -
 📦 Products in list: 4
 💰 Total cost: 980.5
 ✅ Апельсины удалены
 🗑️ After removal:
 📦 Products in list: 3
 💰 Total cost: 655.5 */

/* 💡 КЛЮЧЕВЫЕ СИНТАКСИЧЕСКИЕ КОНСТРУКЦИИ:
 Value Semantics - struct вместо class

 Functional Programming - reduce вместо циклов

 Early Exit - guard вместо вложенных if

 Safe Access - проверка границ массивов

 Optional Chaining - if let для безопасного разворачивания

 Вердикт: Современный Swift с акцентом на безопасность! 🛡️ */
