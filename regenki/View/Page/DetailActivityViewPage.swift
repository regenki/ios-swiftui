//
//  DetailActivityViewPage.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 29/09/21.
//

import SwiftUI

struct DetailActivityViewPage: View {
    var data:Activity
    @Environment(\.managedObjectContext) var moc
    @State private var editSheet:Bool = false
    var date:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE,MMMM,d"
        return formatter
    }()
    var body: some View {
        
            GeometryReader{ item in
                VStack(alignment:.center){
                    Image("NoActivity")
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 12, style: .continuous).frame(width: 72, height: 72, alignment: .center).foregroundColor(.purple)
                        Image(data.sticker!).resizable().frame(width: 72, height: 72, alignment: .center)
                    }.position(x: item.size.width - 100, y: -20).frame( height: 20)
                    VStack(alignment:.leading){
                        
                        Text(data.category!).fontWeight(Font.Weight.semibold).multilineTextAlignment(.leading).font(.system(size: 20))
                        Text(data.title!).fontWeight(Font.Weight.semibold).multilineTextAlignment(.leading).font(.system(size: 24))
                        Text(data.date!,formatter: date)
                        
                    }.frame(width:item.size.width - 48,alignment:.leading).padding(.horizontal,24)
                    Spacer()
                    VStack{
                        if data.isDone == false{
                            Button(action: {
                                data.isDone = true
                                
                                    do{
                                        
                                    
                                       try moc.save()
                                    }catch{
                                        
                                    }
                                
                            }, label: {
                                if data.isDone == false{
                                    ZStack(alignment:.center){
                                        RoundedRectangle(cornerRadius: 12, style: .continuous).foregroundColor(Color("AccentColor")).frame(height:72).padding(.horizontal,24).foregroundColor(.white)
                                        Text("Done").font(.title2).fontWeight(.semibold).foregroundColor(.white)
                                    }
                                }else{
                                    ZStack(alignment:.center){
                                        RoundedRectangle(cornerRadius: 12, style: .continuous).foregroundColor(Color("AccentColor")).frame(height:72).padding(.horizontal,24).foregroundColor(.white)
                                        Text("Clear").font(.title2).fontWeight(.semibold).foregroundColor(.white)
                                    }
                                }
                               
                            }).padding(.bottom,12)
                        }
                        else{
                            ZStack(alignment:.center){
                                RoundedRectangle(cornerRadius: 12, style: .continuous).foregroundColor(Color("AccentColor")).frame(height:72).padding(.horizontal,24).foregroundColor(.white)
                                Text("Clear").font(.title2).fontWeight(.semibold).foregroundColor(.white)
                            }.padding(.bottom,12)
                        }
                       
                        
                    }
                    
                    
                    
                }.navigationBarItems(trailing: Button(action: {editSheet.toggle()}, label: {
                    Image("edit").resizable().frame(width: 48, height: 48, alignment: .center)
                }).sheet(isPresented: $editSheet, content: {
                    EditActivitySheet(data: data)
                }))
        
        
        }
    }
}

struct DetailActivityViewPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailActivityViewPage(data: Activity())
    }
}
