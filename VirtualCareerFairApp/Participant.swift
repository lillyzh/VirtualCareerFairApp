class Participant : Hashable {
    static func == (lhs: Participant, rhs: Participant) -> Bool {
        return lhs.orgName == rhs.orgName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(firstName)
        hasher.combine(lastName)
        hasher.combine(available)
        hasher.combine(orgName)
    }
    var firstName: String
    var lastName: String
    var available = true
    var orgName: String
    
    init(firstName: String, lastName: String, orgName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.orgName = orgName
    }
}

