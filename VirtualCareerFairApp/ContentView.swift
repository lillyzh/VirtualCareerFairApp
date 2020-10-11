import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomTrailing) {
                NavigationView {
                    List(0..<5, id: \.self) {_ in
                        HStack {
                            Image(systemName: "xmark")
                                .frame(width: 50, height: 50)
                            Text("Hello")
                        }
                    }
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
                        JoinView(showJoinView: $show)
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
