//
//  AddActivitySheet.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 23/09/21.
//

import SwiftUI

struct AddActivitySheet: View {
    let names = ["Holly","Josh","Rhonda","Ted"]
    let category = ["Dancing","Meditation","Running","Learning","Cleaning","Coding","Drawing","Walking Around","Fighting"]
    let sticker = ["Peace","Laugh","Smile","Fear",""]
    @State var angka = ""
    @State private var titleText = ""
    @State private var categoryText = ""
    @State private var datePicker = Date()
    @State private var stickerImage = ""
    
    var searchResults:[String]{
        if angka.isEmpty{
            return names
        }
        else{
            return names.filter{$0.contains(angka)}
        }
    }
    
    var body: some View {
        GeometryReader{ item in
            VStack{
                HStack{
                    Button(action: {}, label: {
                        Text("Cancel").fontWeight(.semibold).foregroundColor(.red)
                        Spacer()
                        Text("Save").fontWeight(.semibold).foregroundColor(.green)
                        
                    })
                }.padding([.horizontal,.top],24)
                
                TextField("Text", text: $titleText).textFieldStyle(.roundedBorder).padding([.horizontal],24).padding([.top],36)
                Picker("", selection: $categoryText, content: {
                    ForEach(category,id:\.self){category in
                        Text(category)
                    }
                }).padding([.horizontal,],24).padding([.vertical],20).pickerStyle(.inline)
                DatePicker("Date", selection: $datePicker).padding([.horizontal],24)
                Picker("Sticker",selection:$stickerImage){
                    ForEach(sticker,id:\.self){emote in
                        Image("")
                    }
                }
                
            }
        }
    }
}

struct AddActivitySheet_Previews: PreviewProvider {
    static var previews: some View {
        AddActivitySheet()
    }
}
