//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Renato on 10/02/23.
//

import SwiftUI

struct ContentView: View {

    @State private var isNight = false

    var body: some View {
        ZStack {
            backgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Brasilia-DF")

                MainWeatherSatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)

                .padding(.bottom, 40)
                HStack(spacing: 10){
                    WatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 75)
                    WatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                    WatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55)
                    WatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                    WatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 25)

                } //end HStack
                Spacer()
                Button {
                    isNight.toggle()
                    print("taped")
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .green, backgroundColor: .white)
                }
                Spacer()
            } //end VStack
        } //end ZStack
    } //end var body
} //end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WatherDayView: View {

    var dayOfWeek: String
    var imageName: String
    var temperature: Int

    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            VStack(spacing:8) {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                Text("\(temperature)°")
                    .font(.system(size: 25, weight: .medium))
                    .foregroundColor(.white)
            } //end VStack
        } //end VStack
    } //end var body
} //end struct WatherDayView

struct backgroundView: View {

    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View{

    var cityName: String

    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    } //end var body
} //end struct CityTextView

struct MainWeatherSatusView: View {

    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180 )
            Text("\(temperature)°")
                .font(.system( size: 70, weight: .medium))
                .foregroundColor(.white)
        } //end VStack
    } //end var body
}//end struct MainWeatherStatusView


