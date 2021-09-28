//
//  ActivityViewPage.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 23/09/21.
//

import SwiftUI

struct ActivityViewPage: View {
    @State var searchActivity:String = ""
    @State var addSheet:Bool = false
    var body: some View {
        NavigationView{
            GeometryReader{ reader in
                VStack{
                    TextField("Search", text: $searchActivity).textFieldStyle(RoundedBorderTextFieldStyle()).padding([.horizontal],24)
                    Button(action: {
                        self.addSheet = true
                    }, label: {
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
                    }).sheet(isPresented: $addSheet, onDismiss: dismiss, content: {
                        AddActivitySheet()
                    })
                    //NoActivity().padding([.top],64)
                    List{
                        ForEach(0..<5){ _ in
                            NavigationLink(destination: Text("Hallo"), label: {Activitytile()})
                            
                        }
                            
                        
                    }.listStyle(.plain)
                    /*ScrollView{
                        ForEach(0..<5){_ in
                            Activitytile()
                        }
                    }.padding(.top,20)*/
                        
                    
                    
                }.navigationTitle("Activity").navigationBarBackButtonHidden(true)
            }
        }
        
        
    }
    func dismiss(){
        
    }
}

struct ActivityViewPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivityViewPage()
    }
}
