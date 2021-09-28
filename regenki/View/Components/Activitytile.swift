//
//  Activitytile.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 28/09/21.
//

import SwiftUI

struct Activitytile: View {
    
    var timeFormat:DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    var date:DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE,MMM,d"
        return formatter
    }()
    var reader = UIScreen.main.bounds
    var body: some View {
        
           
               
                HStack{
                    Image("fear").resizable().frame(width: 96, height: 96, alignment: .center)
                    
                    
                    VStack(alignment:.leading){
                        Text("Dancing").fontWeight(.semibold).font(.system( size: 20)).padding(.top,4)
                        
                        Text("Dancing BTS").fontWeight(.regular).font(.system(size: 16))
                        Spacer()
                        Text(Date(),formatter: date).fontWeight(.semibold).padding(.bottom)
                    }
                    Spacer()
                    Text(Date(),formatter: timeFormat).font(.system(size: 16)).fontWeight(.semibold).padding(.trailing)
                    
                }
                .background( RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.blue,lineWidth: 4))
                
        
        
    }
    
}

struct Activitytile_Previews: PreviewProvider {
    static var previews: some View {
        Activitytile()
    }
}
