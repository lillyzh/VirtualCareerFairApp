import SwiftUI

class Participant : Hashable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(firstName)
        hasher.combine(lastName)
        hasher.combine(available)
        hasher.combine(orgName)
        hasher.combine(id)
    }
    var firstName: String
    var lastName: String
    var available = true
    var orgName: String
    var id: UUID
    var interests: UInt8 = 0b0
    
    init(firstName: String, lastName: String, orgName: String, interests: UInt8) {
        self.firstName = firstName
        self.lastName = lastName
        self.orgName = orgName
        self.id = UUID()
        self.interests = interests
    }
}

