//
//  DetailActivityViewPage.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 29/09/21.
//

import SwiftUI

struct DetailActivityViewPage: View {
    var data:Activity
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
                        Button(action: {
                            
                        }, label: {
                            ZStack(alignment:.center){
                                RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color("AccentColor"),lineWidth:4).frame(height:72).padding(.horizontal,24).foregroundColor(.white)
                                Text("Edit").font(.title2).fontWeight(.semibold)
                            }
                        }).padding(.bottom,8)
                        Button(action: {
                            
                        }, label: {
                            ZStack(alignment:.center){
                                RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.red,lineWidth:8).frame(height:72).padding(.horizontal,24).foregroundColor(.white)
                                HStack{
                                    Image(systemName: "trash.fill").foregroundColor(.red).font(.title2)
                                    Text("Hapus").foregroundColor(.red).font(.title2).fontWeight(.semibold)
                                }
                                
                            }
                        }).padding(.bottom,12)
                    }
                    
                    
                    
                }.navigationBarItems(trailing: Button(action: {}, label: {
                    Image(systemName: "love")
                }))
        
        
        }
    }
}

struct DetailActivityViewPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailActivityViewPage(data: Activity())
    }
}
