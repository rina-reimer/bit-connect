//
//  MultiSelectorView.swift
//  BitConnect
//
// Copyright © 2020 Flinesoft. All rights reserved.
//

import SwiftUI

struct MultiSelectionView<Option: Identifiable & Hashable>: View {
    let options: [Option]
    let optionToString: (Option) -> String

    @Binding var selected: Set<Option>

    var body: some View {
        List {
            ForEach(options) { option in
                Button(action: { toggleSelection(option: option) }) {
                    HStack {
                        Text(optionToString(option)).foregroundColor(.black)
                        Spacer()
                        if selected.contains(where: { $0.id == option.id }) {
                            Image(systemName: "checkmark").foregroundColor(.accentColor)
                        }
                    }
                }.tag(option.id)
            }
        }.listStyle(GroupedListStyle())
    }

    private func toggleSelection(option: Option) {
        if let existingIndex = selected.firstIndex(where: { $0.id == option.id }) {
            selected.remove(at: existingIndex)
        } else {
            selected.insert(option)
        }
    }
}

struct MultiSelectionView_Previews: PreviewProvider {
    struct IdentifiableString: Identifiable, Hashable {
        let string: String
        var id: String { string }
    }

    @State static var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })

    static var previews: some View {
        NavigationView {
            MultiSelectionView(
                options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                optionToString: { $0.string },
                selected: $selected
            )
        }
    }
}
