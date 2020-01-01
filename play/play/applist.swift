//
//  applist.swift
//  play
//
//  Created by User09 on 2020/1/1.
//  Copyright © 2020 ibob. All rights reserved.
//
import Foundation
import SwiftUI

struct applist: View {
    @ObservedObject var appData = appdata()
    @State private var showeditapp = false
    var body: some View {
        NavigationView{
            List{
                ForEach(appData.apps) { (app) in
                    NavigationLink(destination: editor(editapp: app, appData: self.appData)){
                        approw(apps: app)
                    }
                }
                .onDelete { (indexSet) in
                self.appData.apps.remove(atOffsets: indexSet)}
                .onMove { (indexSet, index) in
                    self.appData.apps.move(fromOffsets: indexSet, toOffset: index)
                }
                    
            }.navigationBarTitle("使用的app")
            .navigationBarItems(leading: EditButton(),trailing: Button(action: {
              self.showeditapp = true
            }, label: {
                  Image(systemName: "plus.circle.fill")
            }))
            .sheet(isPresented: $showeditapp) {
                NavigationView {
                  editor(appData: self.appData)}
            }
            
        }
        
    }
}

struct applist_Previews: PreviewProvider {
    static var previews: some View {
        applist()
    }
}
