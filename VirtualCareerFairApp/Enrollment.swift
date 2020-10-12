import SwiftUI

struct JoinView : View {
    @Binding var recruiterList: [Recruiter]
    @Binding var participantList: [Participant]
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var orgName: String = ""
    @Binding var showJoinView: Bool
    @State var interests: UInt8 = 0b00000000
    var body : some View {
        ScrollView {
            VStack(alignment: .center) {
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                TextField("First name", text: $firstName)
                .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                TextField("Last name", text: $lastName)
                .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                TextField("Organization name", text: $orgName)
                .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                InterestsView(interests: $interests)
                Text("Join as")
                    .font(.headline)
                HStack {
                    Button(action: {
                        withAnimation{
                            self.showJoinView.toggle()
                            self.recruiterList.append(Recruiter(firstName: firstName, lastName: lastName, companyName: orgName, interests: interests))
                        }
                    }) {
                        Text("Recruiter")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(15.0)
                    }
                    Button(action: {
                        withAnimation{
                            self.showJoinView.toggle()
                            self.participantList.append(Participant(firstName: firstName, lastName: lastName, orgName: orgName, interests: interests))
                        }
                    }) {
                        Text("Participant")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.pink)
                            .cornerRadius(15.0)
                    }

                }
            }
            .padding()
        }
        .background(Color.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
    }
}

struct InterestsView : View {
    @Binding var interests: UInt8
    @State var allInterests = Interests()
    var body: some View {
        VStack {
            Text("I am looking/hiring for")
                .font(.headline)
            jobRoles(interests: $interests)
            Text("My/Their experty level is")
                .font(.headline)
            jobLevels(interests: $interests)
            Text("My/Their job type is")
                .font(.headline)
            jobTypes(interests: $interests)
        }
    }
}

struct jobRoles : View {
    @Binding var interests: UInt8
    @State var allInterests = Interests()
    var body : some View {
        VStack {
            Button(action: {
                interests |= allInterests.softwareEng
            }){
                Text("Software engineer role")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
            Button(action: {
                interests |= allInterests.hardEng
            }){
                Text("Hardware engineer role")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
            Button(action: {
                interests |= allInterests.prodMan
            }){
                Text("Product manager role")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
        }
    }
}

struct jobLevels : View {
    @Binding var interests: UInt8
    @State var allInterests = Interests()
    var body : some View {
        HStack {
            Button(action: {
                interests |= allInterests.entry
            }){
                Text("Entry")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
            Button(action: {
                interests |= allInterests.senior
            }){
                Text("Senior")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
            Button(action: {
                interests |= allInterests.principal
            }){
                Text("Principal")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
        }
    }
}

struct jobTypes : View {
    @Binding var interests: UInt8
    @State var allInterests = Interests()
    var body : some View {
        HStack {
            Button(action: {
                interests |= allInterests.fulltime
            }){
                Text("full time")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
            Button(action: {
                interests |= allInterests.intern
            }){
                Text("intern")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
        }
    }
}

enum UserType {
    case recruiter
    case participant
}


