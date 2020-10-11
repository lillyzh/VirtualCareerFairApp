class Recruiter : Hashable {
    static func == (lhs: Recruiter, rhs: Recruiter) -> Bool {
        return lhs.companyName == rhs.companyName
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(firstName)
        hasher.combine(lastName)
        hasher.combine(available)
        hasher.combine(companyName)
    }
    var firstName: String
    var lastName: String
    var available = true
    var companyName: String
    
    init(firstName: String, lastName: String, companyName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.companyName = companyName
    }
}

