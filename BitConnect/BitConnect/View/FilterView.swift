//
//  FilterView.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import SwiftUI

struct Pronoun: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

struct PronounSelection: Hashable, Identifiable {
    var name: String
    var selection: Set<Pronoun>
    let id = UUID()
}

let validPronouns: [Pronoun] = [Pronoun(name: "she/her"),
                                Pronoun(name: "he/him"),
                                Pronoun(name: "they/them"),
                                Pronoun(name: "other")]



struct FilterView: View {
    //@State private var pronounSelection = Set<Pronoun>()
    @State var pronouns = PronounSelection(name: "", selection: [])
    
    var body: some View {
        NavigationView {
            Form {
                // Pronouns
                Section(header: Text("Pronouns")) {
                    MultiSelector(
                        label: Text("Serving Goals"),
                        options: validPronouns,
                        optionToString: { $0.name },
                        selected: $pronouns.selection
                    )
                            }
                // School
                
                // Career Path
                
                // Interests/Hobbies
                
            }
            // Pronouns
            // Text("Connect with people who use the pronouns:")
            /*List(pronouns, id: \.self, selection: $pronounSelection) {
                Text($0.name)
                }*/
            .navigationTitle("Your Preferences")
            }
            // Button
            Spacer()
    }
}

#Preview {
    FilterView()
}
