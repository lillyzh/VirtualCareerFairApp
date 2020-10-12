import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var recruiters = [Recruiter]()
    @State var participants = [Participant]()
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomTrailing) {
                    mainView(recruiterList: $recruiters, participantList: $participants)
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
            .padding()
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
            recruitersView(recruiterList: $recruiterList, participantList: $participantList)
            Divider()
            Text("Lobby")
                .font(.largeTitle)
            if participantList.isEmpty {
                Text("No participants yet")
            }
            ForEach(participantList, id: \.id) { participant in
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

struct recruitersView : View {
    @Binding var recruiterList: [Recruiter]
    @Binding var participantList: [Participant]
    var body : some View {
        VStack{
            ForEach(recruiterList.indices, id: \.self) { index in
                HStack(alignment: .center, spacing: 20){
                    Image(recruiterList[index].companyName)
                        .frame(width: 10, height: 10)
                        .padding()
                    VStack(alignment: .leading){
                        Text(recruiterList[index].firstName + " " + recruiterList[index].lastName)
                            .font(.title2)
                            .padding()
                        Text((recruiterList[index].candidate != nil) ? "Talking to \(recruiterList[index].candidate ?? "")" : "")
                            .font(.caption)
                    }
                    Spacer()
                    if recruiterList[index].available {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(Color.green)
                            .font(.title2)
                    } else {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(Color.red)
                            .font(.title2)
                    }
                }
                .onTapGesture{
                    for i in 0..<participantList.count {
                        do {
                            if participantList[i].interests & recruiterList[index].interests > 0 {
                                recruiterList[index].candidate = participantList[i].firstName + " " + participantList[i].lastName
                                self.recruiterList[index].available = false
                                participantList.remove(at: i)
                            }
                            break
                        }
                    }
                }
                .padding()
            }
        }
    }
}
