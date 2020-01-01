//
//  appdata.swift
//  play
//
//  Created by User09 on 2020/1/1.
//  Copyright © 2020 ibob. All rights reserved.
//

import SwiftUI
import Foundation


class appdata: ObservableObject{
    
    @Published var apps = [app](){
        didSet{
            let encoder = JSONEncoder()
            if let data = try?encoder.encode(apps){
                UserDefaults.standard.set(data, forKey:"apps")
            }
        }
    }
    
    init(){
        if let data =
            UserDefaults.standard.data(forKey:"apps"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([app].self, from:data){
                apps = decodedData
            }
        }
    }
    
    
}
