//
//  FilterViewViewModel.swift
//  BitConnect
//
//  Created by Katharina Reimer on 3/23/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FilterViewViewModel: ObservableObject {
    
    // multi selecter sourced from https://www.fline.dev/multi-selector-in-swiftui/
    @Published var validPronouns: [Option]

    // sourced from the UW website
    @Published var validSchools: [Option]

    // sourced from handshake
    // https://support.joinhandshake.com/hc/en-us/articles/360036981454-Employer-Industry-Name-List
    @Published var validCareers: [Option]

    // sourced from indeed by category
    // https://indeed.com/career-advice/career-development/list-of-hobbies
    @Published var validInterests: [Option]
    
    @Published var pronouns: Selection
    @Published var schools: Selection
    @Published var careers: Selection
    @Published var interests: Selection
    @Published var showAlert: Bool = false
    
    init() {
        validPronouns = [Option(name: "she/her"),
                         Option(name: "he/him"),
                         Option(name: "they/them"),
                         Option(name: "other")]
        validSchools = [Option(name: "College of Arts & Sciences"),
                        Option(name: "College of Built Environments"),
                        Option(name: "Michael G. Foster School of Business"),
                        Option(name: "Paul G. Allen School of Computer Science & Engineering"),
                        Option(name: "School of Dentistry"),
                        Option(name: "College of Education"),
                        Option(name: "College of Engineering"),
                        Option(name: "College of the Environment"),
                        Option(name: "The Graduate School"),
                        Option(name: "Henry M. Jackson School of International Studies"),
                        Option(name: "School of Law"),
                        Option(name: "The Information School"),
                        Option(name: "School of Medicine"),
                        Option(name: "School of Nursing"),
                        Option(name: "School of Pharmacy"),
                        Option(name: "Daniel J. Evans School of Public Policy & Governance"),
                        Option(name: "School of Public Health"),
                        Option(name: "School of Social Work")]
        validCareers = [Option(name: "Accounting"),
                            Option(name: "Advertising, PR & Marketing"),
                            Option(name: "Aerospace"),
                            Option(name: "Agriculture"),
                            Option(name: "Animal & Wildlife"),
                            Option(name: "Architecture and Planning"),
                            Option(name: "Automotive"),
                            Option(name: "Biotech & Life Sciences"),
                            Option(name: "Civil Engineering"),
                            Option(name: "Commercial Banking & Credit"),
                            Option(name: "Computer Networking"),
                            Option(name: "Construction"),
                            Option(name: "CPG - Consumer Packaged Goods"),
                            Option(name: "Defense"),
                            Option(name: "Design"),
                            Option(name: "Electronic & Computer Hardware"),
                            Option(name: "Energy"),
                            Option(name: "etc (to be added)")]
        validInterests = [Option(name: "Creative arts"),
                          Option(name: "Food and drink"),
                          Option(name: "Fun and games"),
                          Option(name: "Indoor"),
                          Option(name: "Outdoor"),
                          Option(name: "Technical"),
                          Option(name: "Physical"),
                          Option(name: "Animal")]
        pronouns = Selection(name: "", selection: [])
        schools = Selection(name: "", selection: [])
        careers = Selection(name: "", selection: [])
        interests = Selection(name: "", selection: [])
    }
    
    func startSearch() {
        guard canStart else {
            return
        }
        // get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        // create model of filter
        let newId = UUID().uuidString
        let publicCurrUser = PublicConnection(id: newId,
                                              user: Auth.auth().currentUser!.uid,
                                              filter: ["pronounSelection": pronouns.getSelect(),
                                                       "schoolSelection": schools.getSelect(),
                                                       "careerSelection": careers.getSelect(),
                                                       "interestSelection": interests.getSelect()])
        // save model to database - subcollection of user
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("currConnections")
            .document(newId)
            .setData(publicCurrUser.asDictionary())
    }
    
    var canStart: Bool {
        guard !pronouns.selection.isEmpty && !schools.selection.isEmpty && !careers.selection.isEmpty && !interests.selection.isEmpty else {
            return false
        }
        return true
    }
}
