//
//  SearchBar.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 03/10/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText:String
    @Binding var searching:Bool
   
    
   
    var body: some View {
        
            ZStack{
                RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(.gray,lineWidth: 4).foregroundColor(.white)
                HStack{
                    Image(systemName: "magnifyingglass")
                    TextField("Search...", text: $searchText){startEditing in
                        if startEditing{
                            withAnimation{
                                searching = true
                            }
                        }
                    }onCommit: {
                        withAnimation{
                            searching = false
                        }
                    }
                }.foregroundColor(.gray).padding(.leading,12)
            }.frame(height:44).padding()
           
           
        
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""),searching: .constant(false))
    }
}
