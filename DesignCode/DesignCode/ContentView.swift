//
//  ContentView.swift
//  DesignCode
//
//  Created by xueming liu on 2020/8/24.
//  Copyright © 2020 xueming liu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            BlurView(stype: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
            .blur(radius: show ? 20 : 0)
                .animation(.easeInOut(duration: 0.3))
            
            
            CardView()
                .background(show ? Color.red : Color.green)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400: -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.easeInOut(duration: 0.5))
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
            CardView()
                .background(show ? Color.yellow : Color.blue)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.90)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.spring())
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.easeInOut(duration: 0.5))
                .blendMode(.hardLight)
                .onTapGesture {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            //value 接收手势拖拽的位置
                            self.viewState = value.translation
                            self.show = true
                        })
                        .onEnded({ value in
                            self.viewState = CGSize.zero
                            self.show = false
                        })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("")
        }
        .frame(width: 340.0, height: 220.0)
//        .background(Color.blue)
//        .cornerRadius(10)
//        .shadow(radius: 20)
    }
}

struct CertificateView: View {
    var item = Certificate(title: "", image: "", width: 0, height: 0)
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(.blue)
                        .padding(.top)
                    Text("Certificate")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                Spacer()
                Image(systemName:item.image)
                    .resizable()
                    .foregroundColor(.primary)
                    .frame(width:CGFloat(item.width), height: CGFloat(item.height))
            }
            .padding(.horizontal)
            Spacer()
            Image("community_banner_02")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: 340, height: 220)
        .background(BlurView(stype: .systemThickMaterial))
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            Image("discovery_activity_coffee")
            Spacer()
        }
        .padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3)
                .opacity(0.2)
            
            Text("In addition to the standard dynamic type sizes, the system offers a number of even larger sizes for users with accessibility needs. ")
                .font(.subheadline)
            Spacer()
        }
        .frame(minWidth:0 , maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(BlurView(stype: .systemMaterial))
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
        
    }
}
