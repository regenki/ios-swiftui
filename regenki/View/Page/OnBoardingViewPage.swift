//
//  OnBoardingViewPage.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 22/09/21.
//

import SwiftUI

struct OnBoardingViewPage: View {
    @State private var isNavigate:Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Rectangle().foregroundColor(.init(Color("AccentColor"))).ignoresSafeArea()
                VStack{
                    Image("Onboarding").resizable().frame(width: 280, height: 280, alignment: .center)
                    Text("Self Care").fontWeight(.semibold).font(.title2).padding(.top,24).foregroundColor(.white)
                    Text("managin activities is an important \nthing that needs to be done because it\nreally helps in priortizing yourself").multilineTextAlignment(.center).foregroundColor(.white).padding(.top,4)
                    Spacer()
                    NavigationLink(
                        destination: ActivityViewPage(),
                        isActive: $isNavigate,
                        label: {
                            
                        })
                    
                    Button(action: {
                        self.isNavigate = true
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 12, style: .continuous).frame(height:72).padding([.horizontal],24).foregroundColor(.white)
                            Text("Getting Started").font(.title2).fontWeight(.semibold)
                        }
                    })
                }
            }
        }
        
    }
}

struct OnBoardingViewPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingViewPage()
    }
}
