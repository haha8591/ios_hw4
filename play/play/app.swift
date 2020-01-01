//
//  app.swift
//  play
//
//  Created by User09 on 2020/1/1.
//  Copyright © 2020 ibob. All rights reserved.
//

import SwiftUI

struct app: Identifiable, Codable {
    //var imgname:String
    var id = UUID()
    var name:String
    var type: String
    var time:String
}
/*
let apps=[ app(name: "angry_bird", time:"10"),
          app(name: "fruit_ninja", time:"0"),
          app(name: "candy_crush", time:"0"),
]*/

