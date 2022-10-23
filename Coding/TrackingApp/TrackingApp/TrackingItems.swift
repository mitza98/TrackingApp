//
//  TrackingItems.swift
//  TrackingApp
//
//  Created by Mihai Cerneanu on 23.10.2022.
//

import Foundation

class TrackingItems: ObservableObject {
    @Published var items = [TrackItem]()
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "TrackingItems") {
            if let decoded = try? JSONDecoder().decode([TrackItem].self, from: data) {
                items = decoded
                return
            }
        }

        items = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "TrackingItems")
        }
    }
}
