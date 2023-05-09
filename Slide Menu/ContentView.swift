//
//  ContentView.swift
//  Slide Menu
//
//  Created by Arina on 09.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State private var isDark = false
    @State private var isShow = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader {_ in
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                withAnimation(.default){
                                    self.isShow.toggle()
                                }
                            }) {
                                Image(systemName: "line.3.horizontal")
                            }
                            Spacer()
                        }
                        Text("Home")
                    }
                    .padding()
                    .foregroundColor(.primary)
                    // вертикальный разделитель
                    .overlay(Rectangle().stroke (Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3).edgesIgnoringSafeArea(.top))
                    
                    Spacer()
                    
                    Text("Some text here")
                    Spacer()
                }
                HStack {
                    Menu(isDark: $isDark, isShow: $isShow)
                        .offset(x: self.isShow ? 0 : -UIScreen.main.bounds.width / 1.5)
                    
                    Spacer(minLength: 0)
                }
                //для затемнения основного фона, кога выезжает sheet
                .background(Color.primary.opacity(self.isShow ? (self.isDark ? 0.05 : 0.2) : 0) .edgesIgnoringSafeArea(.all))
            }
        }
        //включение темной темы
        .onChange(of: isDark) { newValue in
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = newValue ? .dark : .light
                }
    }
}


struct Menu: View {
    
    @Binding var isDark: Bool
    @Binding var isShow: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.default){
                    self.isShow.toggle()
                        }
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.title)
                        
                }
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
            
            
            Image("me")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            VStack(spacing: 12) {
                Text("Arina")
                Text("iOS developer")
                    .font(.caption)
            }
            .padding(.top, 25)
            // для темной темы
            HStack(spacing: 22){
                Image(systemName:"moon.fill")
                    .font (.title)
                Toggle("Dark Mode", isOn: $isDark)
            }
            
            Group {
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image(systemName:"rectangle.portrait.on.rectangle.portrait.angled")
                            .foregroundColor(.green)
                        Text("Story")
                    }
                }
                .padding(.top, 25)
                
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image(systemName:"message")
                            .foregroundColor(.red)
                        Text("Chats")
                    }
                }
                .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image(systemName:"bookmark")
                            .foregroundColor(.blue)
                        Text("Saved")
                    }
                }
                .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image(systemName:"person.2")
                            .foregroundColor(.yellow)
                        Text("Shared")
                    }
                }
                .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image(systemName:"photo.on.rectangle.angled")
                            .foregroundColor(.purple)
                        Text("Media and Photos")
                    }
                }
                .padding(.top, 25)
                
                Divider()
                    .padding(.top, 25)
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image(systemName:"questionmark.square")
                            .foregroundColor(.orange)
                        Text("Help Centre")
                    }
                }
                .padding(.top, 25)
                
                
                Button(action: {}) {
                    HStack(spacing: 22) {
                        Image(systemName:"gearshape")
                            .foregroundColor(.mint)
                        Text("Settings and Privacy")
                    }
                }
                .padding(.top, 25)
                
            }
            
            
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background ( (self.isDark ? Color.black : Color.white) .edgesIgnoringSafeArea(.all))
        // вертикальный разделитель
        .overlay(Rectangle().stroke (Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea (.all))
    }
}
