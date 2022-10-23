//
//  AddActivity.swift
//  TrackingApp
//
//  Created by Mihai Cerneanu on 23.10.2022.
//

import SwiftUI

struct AddActivity: View {
    @State private var title = ""
    @State private var description = ""
    @Environment(\.dismiss) var dismiss
    @ObservedObject var trackingitems: TrackingItems
    var body: some View {
        NavigationView {
            Form {
                TextField("Name of activity", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    
                    let item = TrackItem(title: title, description: description, completed: 0)
                    trackingitems.items.append(item)
                    trackingitems.save()
                    dismiss()
                    
                }
            }
        }
    }
    
    
}
struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(trackingitems: TrackingItems())
    }
}
