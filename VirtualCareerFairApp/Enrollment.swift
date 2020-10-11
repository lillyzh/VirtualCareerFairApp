import SwiftUI

struct JoinView : View {
    @Binding var recruiterList: [Recruiter]
    @Binding var participantList: [Participant]
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var orgName: String = ""
    @Binding var showJoinView: Bool
    var body : some View {
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
            Text("Join as")
                .font(.headline)
            HStack {
                Button(action: {
                    withAnimation{
                        self.showJoinView.toggle()
                        self.recruiterList.append(Recruiter(firstName: firstName, lastName: lastName, companyName: orgName))
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
                        self.participantList.append(Participant(firstName: firstName, lastName: lastName, orgName: orgName))
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
        .background(Color.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200)
    }
}
