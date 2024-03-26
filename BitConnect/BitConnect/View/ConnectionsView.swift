//
//  ConnectionsView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//
import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct ConnectionsView: View {
    @StateObject var viewModel = ConnectionsViewViewModel()
    @FirestoreQuery var items: [PublicConnection]
    
    init(userId: String) {
        // data lives at users/id/currConnections/ITEMS
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/currConnections")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    PublicConnectionView(item: item)
                        .swipeActions {
                            Button {
                                // dismiss
                            } label: {
                                Text("Dismiss")
                                    .background(.mint)
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Connections")
            .toolbar {
                Toggle(
                    "Vibrate on Ring",
                    systemImage: "dot.radiowaves.left.and.right",
                    isOn: $viewModel.searchModeOn
                )
                .toggleStyle(.switch)
                Button {
                    viewModel.showingFilterView = true
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
            }
            .sheet(isPresented: $viewModel.showingFilterView) {
                viewModel.searchModeOn = true
            } content: {
                FilterView(searchModeOn: $viewModel.showingFilterView) }
            }
        }
    }

       

#Preview {
    ConnectionsView(userId: "Ak2FASx2gKdtQLEeSgyrScAzChA3")
}
