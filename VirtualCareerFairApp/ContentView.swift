//
//  ContentView.swift
//  VirtualCareerFairApp
//
//  Created by Lilly Zhou on 10/11/20.
//

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
                        SignUpSheet()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SignUpSheet : View {
    @State var showingRecSignUpSheet = false
    @State var showingPartSignUpSheet = false
    var body : some View {
        VStack {
            Text("Join as")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Button(action: {
                self.showingRecSignUpSheet.toggle()
            }) {
                Text("Recruiter")
            }.sheet(isPresented: $showingRecSignUpSheet) {
                Text("Sign up")
            }
            .padding(.top, 25)
            Button(action: {
                self.showingPartSignUpSheet.toggle()
            }) {
                Text("Participant")
            }.sheet(isPresented: $showingPartSignUpSheet) {
                Text("Sign up")
            }
            .padding(.top, 25)
        }
        .padding()
        .background(Color.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200, alignment: .center)
    }
}
