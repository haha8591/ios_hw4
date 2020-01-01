//
//  approw.swift
//  play
//
//  Created by User09 on 2020/1/1.
//  Copyright © 2020 ibob. All rights reserved.
//

import SwiftUI

struct approw: View {
    var apps:app
    var body: some View {
        HStack{
            
            VStack(alignment:.leading){
                Text(apps.name)
                Text(apps.type)
                Text("\(apps.time)分")
            }
            Spacer()
        }
    }
}

struct approw_Previews: PreviewProvider {
    static var previews: some View {
        approw(apps:app(name:"toast104", type:"aaaaa",time: "104")).previewLayout(.fixed(width: 300, height: 70))
    }
}
