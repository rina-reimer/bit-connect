//
//  FilterView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct FilterView: View {
    @StateObject var viewModel = FilterViewViewModel()
    @Binding var searchModeOn: Bool
    
    var body: some View {
        NavigationView {
            Form {
                // Pronouns
                Section(header: Text("those who use")) {
                    MultiSelector(
                        id: UUID().uuidString,
                        label: Text("Pronouns"),
                        options: viewModel.validPronouns,
                        optionToString: { $0.name! },
                        selected: $viewModel.pronouns.selection
                    )
                }
                // School
                Section(header: Text("those who are in")) {
                    MultiSelector(
                        id: UUID().uuidString,
                        label: Text("School"),
                        options: viewModel.validSchools,
                        optionToString: { $0.name! },
                        selected: $viewModel.schools.selection
                    )
                }
                
                // Career Path
                Section(header: Text("those who want to go into")) {
                    MultiSelector(
                        id: UUID().uuidString,
                        label: Text("Career Path"),
                        options: viewModel.validCareers,
                        optionToString: { $0.name! },
                        selected: $viewModel.careers.selection
                    )
                }
                // Interests/Hobbies
                Section(header: Text("those who are into")) {
                    MultiSelector(
                        id: UUID().uuidString,
                        label: Text("Interests/Hobbies"),
                        options: viewModel.validInterests,
                        optionToString: { $0.name! },
                        selected: $viewModel.interests.selection
                    )
                }
                Section {
                    // Button
                    BCButton(title: "Start searching!", background: .green) {
                        if viewModel.canStart {
                            viewModel.startSearch()
                            searchModeOn = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }
                }
            }
            .navigationTitle("I want to connect with")
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Please select at least one item per field.")
                )
            })
        }
    }
}

#Preview {
    FilterView(searchModeOn: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
