//
//  EditActivitySheet.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 02/10/21.
//

import SwiftUI

struct EditActivitySheet: View {
    var data:Activity
    @Environment(\.managedObjectContext) var moc
    @StateObject var coreData = CoreDataService()
    let category = ["Dancing","Meditation","Running","Learning","Cleaning","Coding","Drawing","Walking Around","Fighting"]
    let sticker = ["peace","micdrop","fear","smile","happy","gatcha","angry","twink","no","confused"]
    
    @State private var error:Bool = false
    @State private var titleText:String = ""
    @State private var categoryText:String = ""
    @State private var dateData:Date = Date()
    @State private var stickerImage:String = "peace"
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {}, label: {
                    Text("Cancel").fontWeight(.semibold).foregroundColor(.red)
                   
                    
                    
                })
                Spacer()
                Button(action: {
                    if titleText.isEmpty || categoryText.isEmpty{
                        self.error.toggle()
                    }else{
                        
                        coreData.add(data: data, title: titleText, category: categoryText, sticker: stickerImage, date: dateData)
                        do{
                            try moc.save()
                        }
                        catch{
                            print("Error Sorry about saving data")
                        }
                    }
                   
                    
                }, label: {
                    Text("Save").fontWeight(.semibold).foregroundColor(.green)
                })
            }.alert(isPresented: $error, content: {Alert(title: Text("Error"), message:Text("Please dont empty field"), dismissButton: .destructive(Text("Close")))}).padding([.horizontal,.top],24)
            Form{
                Section(header:Text("Add Data")){
                    TextField("Input Title", text: $titleText).textFieldStyle(.roundedBorder).padding()
                    Picker("Category", selection: $categoryText, content: {
                        ForEach(category,id:\.self){category in
                            Text(category)
                        }
                    }).pickerStyle(.menu)
                    if categoryText == "Others"{
                        TextField("Input Category", text: $categoryText).textFieldStyle(.roundedBorder).padding()
                    }
                    DatePicker("Date", selection: $dateData)
                    Picker("Choose Sticker",selection:$stickerImage){
                        ForEach(sticker,id:\.self){emote in
                            HStack{
                               Text("\(emote)").bold()
                            }
                        }
                    }
                    Image("\(stickerImage)").resizable().frame(width:100,height:100)
                }
                
            }

        }
    }
}

struct EditActivitySheet_Previews: PreviewProvider {
    static var previews: some View {
        EditActivitySheet(data: Activity())
    }
}
