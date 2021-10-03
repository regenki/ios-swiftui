//
//  AddActivitySheet.swift
//  regenki
//
//  Created by Chondro Satrio Wibowo on 23/09/21.
//

import SwiftUI

struct AddActivitySheet: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var persentationMode
    @StateObject var coreData = CoreDataService()
    @StateObject var notification = Notification()
   
    let category = ["Dancing","Meditation","Running","Learning","Cleaning","Coding","Drawing","Walking Around","Fighting","Others"]
    let sticker = ["peace","micdrop","fear","smile","happy","gatcha","angry","twink","no","confused"]
    @State var error:Bool = false
    @State private var titleText = ""
    @State private var categoryText = ""
    @State private var categoryInputText = ""
    @State private var datePicker = Date()
    @State private var stickerImage = "peace"
    
    
    
    var body: some View {
        
        NavigationView{
                VStack{
                    HStack{
                        Button(action: {
                            self.persentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Cancel").fontWeight(.semibold).foregroundColor(.red)
                           
                            
                            
                        })
                        Spacer()
                        Button(action: {
                            if titleText.isEmpty || categoryText.isEmpty{
                                self.error.toggle()
                            }else{
                                self.persentationMode.wrappedValue.dismiss()
                                var activity = Activity(context: self.moc)
                                
                                if categoryText == "Others"{
                                    activity = coreData.add(data: activity, title: titleText, category: categoryInputText, sticker: stickerImage, date: datePicker)
                                }else{
                                    activity = coreData.add(data: activity, title: titleText, category: categoryText, sticker: stickerImage, date: datePicker)
                                }
                                notification.schenduled(notification: activity)
                                
                                
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
                                TextField("Input Category", text: $categoryInputText).textFieldStyle(.roundedBorder).padding()
                            }
                            DatePicker("Date", selection: $datePicker)
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
     
                }.navigationBarHidden(true)
            
        }
        
    }
}

struct AddActivitySheet_Previews: PreviewProvider {
    static var previews: some View {
        AddActivitySheet()
    }
}
