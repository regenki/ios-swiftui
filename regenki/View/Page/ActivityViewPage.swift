//
//  ActivityViewPage.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 23/09/21.
//

import SwiftUI

struct ActivityViewPage: View {
    @State private var searchActivity:String = ""
    @State private var addSheet:Bool = false
    @State private var isSearchin:Bool = false
    @FetchRequest(entity: Activity.entity(), sortDescriptors: [], predicate: nil, animation: nil)
    private var activity:FetchedResults<Activity>
    var body: some View {
        
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
                    if activity.count == 0{
                        NoActivity().padding(.top,64)
                    }
                    else{
                        List{
                            ForEach(activity){ item in
                                NavigationLink(destination: Text("Hallo"), label: {Activitytile(title: item.title ?? "", category:item.category ?? "", dateData: item.date!)})
                                
                            }
                                
                            
                        }.listStyle(.plain)
                    }
                    
                    /*ScrollView{
                        ForEach(0..<5){_ in
                            Activitytile()
                        }
                    }.padding(.top,20)*/
                        
                    
                    
                }.navigationTitle("Activity").navigationBarBackButtonHidden(true)
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
