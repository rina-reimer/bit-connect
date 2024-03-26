//
//  MultiSelector.swift
//  BitConnect
//
// Copyright © 2020 Flinesoft. All rights reserved.

import SwiftUI

struct Option: Identifiable, Hashable, Codable, Equatable {
    let name: String?
    let id: String?
    
    init(name: String) {
        self.name = name
        self.id = UUID().uuidString
    }
    
    enum CodingKeys: CodingKey {
        case name
        case id
    }
}

struct Selection: Hashable, Identifiable {
    var name: String
    var selection: Set<Option>
    let id = UUID()
    
    func getSelect() -> Set<Option> {
        return selection
    }
}

struct MultiSelector<LabelView: Equatable & View, Option: Identifiable & Hashable>: Hashable, Identifiable, View {
    static func == (lhs: MultiSelector<LabelView, Option>, rhs: MultiSelector<LabelView, Option>) -> Bool {
        return lhs.id == rhs.id && lhs.label == rhs.label && lhs.options == rhs.options
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String
    let label: LabelView
    let options: [Option]
    let optionToString: (Option) -> String

    @Binding var selected: Set<Option>

    private var formattedSelectedListString: String {
        ListFormatter.localizedString(byJoining: $selected.wrappedValue.map { optionToString($0) })
    }

    var body: some View {
        NavigationLink(destination: multiSelectionView()) {
            HStack {
                label
                Spacer()
                Text(formattedSelectedListString)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.trailing)
            }
        }
    }

    private func multiSelectionView() -> some View {
        MultiSelectionView(
            options: options,
            optionToString: optionToString,
            selected: $selected
        )
    }
}
/*
struct MultiSelector_Previews: PreviewProvider {
    struct IdentifiableString: Identifiable, Hashable {
        let string: String
        var id: String { string }
    }

    @State static var selected: Set<IdentifiableString> = Set(["A", "C"].map { IdentifiableString(string: $0) })

    static var previews: some View {
        NavigationView {
            Form {
                MultiSelector<Text, IdentifiableString>(
                    id: UUID().uuidString,
                    label: Text("Multiselect"),
                    options: ["A", "B", "C", "D"].map { IdentifiableString(string: $0) },
                    optionToString: { $0.string },
                    selected: $selected
                )
            }.navigationTitle("Title")
        }
    }
}*/
