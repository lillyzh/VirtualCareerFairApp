import SwiftUI

struct JoinView : View {
    @State var showingRecSignUpSheet = false
    @State var showingPartSignUpSheet = false
    @Binding var showJoinView: Bool
    var body : some View {
        VStack {
            Text("Join as")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Button(action: {
                withAnimation{
                    self.showingRecSignUpSheet.toggle()
                }
            }) {
                Text("Recruiter")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
            .sheet(isPresented: $showingRecSignUpSheet) {
                SignUpView(showSignUpView: $showingRecSignUpSheet, showJoinView: $showJoinView)
            }
            Button(action: {
                self.showingPartSignUpSheet.toggle()
            }) {
                Text("Participant")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
            .sheet(isPresented: $showingPartSignUpSheet) {
                Text("Sign up")
            }
        }
        .padding()
        .background(Color.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200, alignment: .center)
    }
}

struct SignUpView : View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var companyName: String = ""
    @Binding var showSignUpView: Bool
    @Binding var showJoinView: Bool
    var body : some View {
        VStack {
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
            TextField("Company name", text: $companyName)
            .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button(action: {
                withAnimation{
                    self.showSignUpView.toggle()
                    self.showJoinView.toggle()
                }
            }) {
                Text("Join")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.pink)
                    .cornerRadius(15.0)
            }
        }
    }
}
