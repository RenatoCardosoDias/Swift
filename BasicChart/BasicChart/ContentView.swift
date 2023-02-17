//
//  ContentView.swift
//  BasicChart
//
//  Created by Renato on 17/02/23.
//

import SwiftUI
//importando Charts - Gráfico
import Charts

struct ContentView: View {

    //criando um array com os meses do ano e vamos iniciar com os dados, como ano, mes e dia e com a quantidade de visualizações
    let viewMonths: [ViewMonth] = [
        .init(date: Date.from(year: 2023, month: 1, day: 1), viewCount: 55000),
        .init(date: Date.from(year: 2023, month: 2, day: 1), viewCount: 89000),
        .init(date: Date.from(year: 2023, month: 3, day: 1), viewCount: 64000),
        .init(date: Date.from(year: 2023, month: 4, day: 1), viewCount: 79000),
        .init(date: Date.from(year: 2023, month: 5, day: 1), viewCount: 130000),
        .init(date: Date.from(year: 2023, month: 6, day: 1), viewCount: 90000),
        .init(date: Date.from(year: 2023, month: 7, day: 1), viewCount: 88000),
        .init(date: Date.from(year: 2023, month: 8, day: 1), viewCount: 64000),
        .init(date: Date.from(year: 2023, month: 9, day: 1), viewCount: 74000),
        .init(date: Date.from(year: 2023, month: 10, day: 1), viewCount: 99000),
        .init(date: Date.from(year: 2023, month: 11, day: 1), viewCount: 110000),
        .init(date: Date.from(year: 2023, month: 12, day: 1), viewCount: 94000),
    ]

    var body: some View {
        VStack{
            Chart{
                ForEach(viewMonths) { viewMonth in //criando um for para cada mes do array da viewMonths e para cada mes apresentado criar um grafico em linha para o mes e para a quantidade de visualizações
                    BarMark(x: .value("Mounth", viewMonth.date, unit: .month),
                            y: .value("Views", viewMonth.viewCount))
                }
            } //end Chart
        } //end VStack
    } //end var body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ViewMonth: Identifiable {
    let id = UUID()
    let date: Date
    let viewCount: Int

}

//criando dados ficticios
//esta extensão nos permite criar uma Data para a ViewMonth, passando os dodos como ano, mes e dia
extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
} //extension
