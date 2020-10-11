import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var recruiters = [Recruiter]()
    @State var participants = [Participant]()
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomTrailing) {
                NavigationView {
                    mainView(recruiterList: $recruiters, participantList: $participants)
                }
                .navigationBarTitle("Home")
                Button(action: {
                    withAnimation {
                        self.show.toggle()
                    }
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.white)
                        .padding(20)
                }
                .background(Color.pink)
                .clipShape(Circle())
                .padding()
            }
            .opacity(self.show ? 0: 1)
            if self.show {
                GeometryReader {_ in
                    VStack {
                        JoinView(recruiterList: $recruiters, participantList: $participants, showJoinView: $show)
                        Button(action: {
                            withAnimation {
                                self.show.toggle()
                            }
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(.black)
                                .padding(20)
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding(.top, 25)
                    }
                }
                .background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
            }
        }
    }
}

struct mainView : View {
    @Binding var recruiterList: [Recruiter]
    @Binding var participantList: [Participant]
    var body: some View {
        ScrollView(.vertical ,showsIndicators: false) {
            Text("Career Fair")
                .font(.largeTitle)
            if recruiterList.isEmpty {
                Text("No recruiters yet")
            }
            ForEach(recruiterList, id: \.self) { recruiter in
                HStack(alignment: .center, spacing: 20){
                    Image(recruiter.companyName)
                        .frame(width: 10, height: 10)
                        .padding()
                    Text(recruiter.firstName + " " + recruiter.lastName)
                        .font(.title2)
                        .padding()
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(recruiter.available ? Color.green : Color.red)
                        .font(.title2)
                }
                .padding()
            }
            Divider()
            Text("Lobby")
                .font(.largeTitle)
            if participantList.isEmpty {
                Text("No participants yet")
            }
            ForEach(participantList, id: \.self) { participant in
                HStack{
                    Image(participant.orgName)
                        .frame(width: 10, height: 10)
                        .padding()
                    Text(participant.firstName + " " + participant.lastName)
                        .font(.title2)
                        .padding()
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(participant.available ? Color.green : Color.red)
                        .font(.title2)
                }
                .padding()
            }
        }
    }
}
