//
//  editor.swift
//  play
//
//  Created by User09 on 2020/1/1.
//  Copyright © 2020 ibob. All rights reserved.
//

import SwiftUI

struct editor: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var time = ""
    @State private var type = ""
    var editapp: app?
    var appData: appdata
    //var appData: appdata
    //var activity = ["angry_bird","candy_ctush","fruit_ninja", "休息"]
    
    
    var body: some View {
        VStack{
            Form {
                profileType(selectedType: self.$type)
                TextField("遊玩時間", text: $time)
                .keyboardType(.numberPad)
            }
            .navigationBarTitle(editapp == nil ? "增加玩耍紀錄":"編輯")
               .navigationBarItems(trailing: Button("save") {
                let apps = app(name: self.name, type:self.type, time: self.time)
                
               if let editApp = self.editapp {
                   let index = self.appData.apps.firstIndex {
                   return $0.id == editApp.id
               }!
                self.appData.apps[index] = apps
               }
               else {
                   self.appData.apps.insert(apps, at: 0)
               }
               self.presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                    if let editapp = self.editapp{
                        self.name = editapp.name
                        self.type = editapp.type
                        self.time = editapp.time
                    }
                }
            }
            .padding(.top)
        }
        
}

struct editor_Previews: PreviewProvider {
    static var previews: some View {
        editor(appData:appdata())
    }
}

struct profileType: View
{
    @Binding var selectedType: String
    var types = ["angry_bird","candy_ctush","fruit_ninja", "休息"]
    var body: some View
    {
        Picker(selection: $selectedType, label: Text("類型"))
        {
            ForEach(types, id: \.self)
            {
                (type) in
                Text(type)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

