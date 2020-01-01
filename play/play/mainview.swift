//
//  mainview.swift
//  play
//
//  Created by User09 on 2020/1/1.
//  Copyright © 2020 ibob. All rights reserved.
//
import Foundation
import SwiftUI

struct mainview: View {
    var body: some View {
        
        
        TabView {
            applist()
                .tabItem{
                    Image(systemName:"house.fill")
                    Text("遊戲")
                }
            chart(appData: appdata())
                .tabItem{//chart
                    Image(systemName:"info.circle.fill")
                    Text("遊玩比例")
            }
        }
        .accentColor(.green)
    }
}

struct mainview_Previews: PreviewProvider {
    static var previews: some View {
        mainview()
    }
}
