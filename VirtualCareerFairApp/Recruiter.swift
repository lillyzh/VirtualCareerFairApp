import SwiftUI

class Recruiter : Hashable {
    static func == (lhs: Recruiter, rhs: Recruiter) -> Bool {
        return lhs.id == rhs.id && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.companyName == rhs.companyName && lhs.available == rhs.available
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(firstName)
        hasher.combine(lastName)
        hasher.combine(available)
        hasher.combine(companyName)
        hasher.combine(id)
    }
    var firstName: String
    var lastName: String
    var available = true
    var companyName: String
    var id : UUID
    var interests: UInt8 = 0b0
    var candidate: String?

    
    init(firstName: String, lastName: String, companyName: String, interests: UInt8) {
        self.firstName = firstName
        self.lastName = lastName
        self.companyName = companyName
        self.id = UUID()
        self.interests = interests
    }
}

