//
//  chart.swift
//  play
//
//  Created by User09 on 2020/1/1.
//  Copyright © 2020 ibob. All rights reserved.
//
import Foundation
import SwiftUI

struct chart: View {
      var appData : appdata
      var percents : [Double]
      var angles : [Angle]
      var types = ["angry_bird", "candy_crush", "fruit_ninja", "休息"]
      var colors :[Color]
      var totalCount : Int = 0
      
      init(appData : appdata){
          self.appData  = appData
          if appData.apps.count == 0{
              self.colors = [Color.white,Color.white,Color.white,Color.white]
              self.percents = [1.0]
              self.angles = [.degrees(0),.degrees(0),.degrees(0),.degrees(0)]
          }
          else{
              percents = [0.0,0.0,0.0,0.0]
              angles = [Angle]()
              colors = [Color.yellow,Color.green,Color.orange,Color.purple]

              for appdata in self.appData.apps{
                  totalCount += 1;
                  for index in 0...3{
                      if(types[index] == appdata.type){
                        //let num=Double(appdata.time)
                        percents[index]+=1
                      }
                  }
              }
              var startDegree : Double = 0
              for index in 0...3{
                  percents[index] /= Double(totalCount)
                  angles.append(.degrees(startDegree))
                  startDegree += 360 * percents[index]
              }
          }
      }
    
    
      var body: some View {
        ZStack{
              ForEach(angles.indices){ (index) in
                  ExtractedView(index:index,angles:self.angles,colors: self.colors)
              }
            
            VStack{
                HStack{
                    Text("黃色：angry_bird").foregroundColor(.yellow).fontWeight(.bold)
                }.position(x: 150, y: 30)
                HStack{
                    Text("綠色：candy_crush").foregroundColor(.green).fontWeight(.bold)
                }.position(x: 150, y: 35)
                HStack{
                    Text("橘色：fruit_ninja").foregroundColor(.orange).fontWeight(.bold)
                }.position(x: 150, y: 40)
                HStack{
                    Text("休息：紫色").foregroundColor(.purple).fontWeight(.bold)
                }.position(x: 150, y: 45)
            }.frame(width:250, height:250)
            .position(x: 150, y: 150)
      }
}
}


struct chart_Previews: PreviewProvider {
    static var previews: some View {
        chart(appData: appdata())
    }
}

    struct ExtractedView: View {
        var index : Int
        var angles : [Angle]
        var colors : [Color]
        var body: some View {
            ZStack{
                if index == (angles.count-1){
                    MyChart(startAngle: angles[index], endAngle: .degrees(360)).fill(colors[index])
                }
                else{
                    MyChart(startAngle: angles[index], endAngle: angles[index+1]).fill(colors[index])
                }
                }.frame(width :250,height: 250).position(x: 220, y: 500)
        }
    }

    struct MyChart : Shape{
        var startAngle : Angle
        var endAngle : Angle

        func path(in rect :CGRect)-> Path{
            Path{(path) in
                let center = CGPoint(x:rect.midX,y:rect.midY)
                path.move(to:center)
                path.addArc(center:center,radius:rect.midX,startAngle: startAngle,endAngle: endAngle,clockwise: false)
            }
        }
    }
