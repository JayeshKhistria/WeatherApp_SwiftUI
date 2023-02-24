//
//  ContentView.swift
//  SwiftUI_WeatherApp
//
//  Created by Jayesh Khistria on 2023-02-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = true
    
    var body: some View {
        ZStack {
            backGroundView(isNight: $isNight)
            VStack {
                cityNameText(isNight: $isNight, cityName: "Toronto, ON")
                
                imageWithTempView(isNight: $isNight, imageName: isNight ? "moon.fill" :"sun.max.fill", temp: -12)
                    
                    HStack(spacing: 20) {
                    
                        weatherDayView(isNight: $isNight, dayOfWeek: "Mon", imageName: "wind.snow", temperature: -5)
                        
                        weatherDayView(isNight: $isNight, dayOfWeek: "Tus", imageName: "snowflake", temperature: -1)
                        
                        weatherDayView(isNight: $isNight, dayOfWeek: "Wed", imageName: "cloud.fill", temperature: 2)
                        
                        weatherDayView(isNight: $isNight, dayOfWeek: "Thu", imageName: "cloud.sun.fill", temperature: 4)
                        
                        weatherDayView(isNight: $isNight, dayOfWeek: "Fri", imageName: "sun.max.fill", temperature: 7)
                        
                    }.padding(.bottom, 60)
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    buttonLable(buttonTitle: "Change Date/Time")
                }.padding(.bottom, 90)
                
                Text("By Jayesh_Khistria")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(isNight ? .white: Color(.black) )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct weatherDayView: View {
    
    @Binding var isNight:Bool
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor( isNight ? Color(.white): Color(.black))
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60,height: 60)
            
            Text("\(temperature)°")
                .font(.system(size: 32, weight: .medium))
                .foregroundColor( isNight ? Color(.white): Color(.black))
            
        }
    }
}

struct backGroundView: View {
    
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black: .blue, isNight ?  Color("lightBlack"): .white]),
                       startPoint:.topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct cityNameText: View {
    
    @Binding var isNight:Bool
    
    var cityName: String
        
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium,design: .default))
            .foregroundColor(isNight ? Color(.white): Color(.black))
            .padding(20)
        
    }
}

struct imageWithTempView: View {
     
    @Binding var isNight:Bool
    
    var imageName: String
    var temp: Int
    
    var body: some View{
        VStack(spacing: 30) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160,height: 160)
            
            Text("\(temp)°")
                .font(.system(size: 64, weight: .medium))
                .foregroundColor(isNight ? Color(.white): Color(.black))
        }
        .padding(.bottom, 30)
    }
}


struct buttonLable: View {
    
    var buttonTitle: String
    
    var body: some View {
        Text(buttonTitle)
            .frame(width: 280, height: 50)
            .foregroundColor(.white).background(Color(.orange))
            .font(.system(size: 26, weight: .medium, design: .default))
            .cornerRadius(10)
        
    }
}
