//
//  TrackItem.swift
//  TrackingApp
//
//  Created by Mihai Cerneanu on 23.10.2022.
//

import Foundation

struct TrackItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var completed: Int
}
