//
//  ActivityViewPage.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 23/09/21.
//

import SwiftUI

struct ActivityViewPage: View {
    @State var searchActivity:String = ""
    var body: some View {
        GeometryReader{ reader in
            VStack{
                TextField("Search", text: $searchActivity).textFieldStyle(RoundedBorderTextFieldStyle()).padding([.horizontal],24)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).frame(height:56).padding([.horizontal,.top],24)
                        HStack{
                            Image(systemName: "plus").font(.title).foregroundColor(.white)
                                .padding([.leading],32)
                            Spacer()
                            Text("Add Activity").fontWeight(.semibold).foregroundColor(.white)
                                .padding([.trailing],128)
                            
                        }.padding([.horizontal,.top],24)
                    }
                })
                NoActivity().padding([.top],64)
                
            }.navigationTitle("Activity").navigationBarBackButtonHidden(true)
        }
        
    }
}

struct ActivityViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivityViewPage()
    }
}
