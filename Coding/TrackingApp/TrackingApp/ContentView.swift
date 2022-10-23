import SwiftUI

struct ContentView: View {
    @State private var showAddActivity = false
    @StateObject var trackingItems = TrackingItems()
    var body: some View {
        NavigationView {
            List {
                ForEach($trackingItems.items) { $item in
                    NavigationLink {
                        VStack {
                            ScrollView {
                                VStack {
                                    Text(item.description)
                                        .font(.system(size: 42))
                                }
                                .cornerRadius(20)
                            }
                            Spacer()
                            HStack {
                                Text("Task completed: ")
                                Spacer()
                                Text("\(item.completed)")
                                Button {
                                    item.completed += 1
                                    trackingItems.save()
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                            .padding()
                        }
                        .navigationTitle(item.title)
                    } label: {
                        Text(item.title)
                            .font(.headline)
                    }
                    
                    
                }
                .onDelete(perform: deleteRow)
            }
            .navigationTitle("Tracking Items")
            .toolbar {
                Button {
                    showAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }

        }
        .sheet(isPresented: $showAddActivity) {
            AddActivity(trackingitems: trackingItems)
        }

    }
    
    private func deleteRow(at offsets: IndexSet) {
        trackingItems.items.remove(atOffsets: offsets)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(trackingItems: TrackingItems())
    }
}
