//
//  AdmissionsTabView.swift
//  Personnel
//
//  Created by Владимир Ильин on 13.09.2021.
//

import SwiftUI

struct AdmissionsTabView: View {
    
    let person: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Form {
                Section(header: Text("Квалификационные отметки").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.subheadline)) {
                }
                
                Section {
                    Toggle("РП - Руководитель полетов", isOn: .constant(false))
                    Toggle("СД - Старший диспетчер", isOn: .constant(false))
                    Toggle("ДИ - Диспетчер-инструктор", isOn: .constant(false))
                    Toggle("ДИТ - Диспетчер-инструктор ТЦ", isOn: .constant(false))
                }
                
                Section(header: Text("Допуски на сектора").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).font(.subheadline)) {
                }
                
                Section(header: Text("Пензенское направление")) {
                    Toggle("Транзит-1", isOn: .constant(false))
                    Toggle("Пенза-1", isOn: .constant(false))
                    Toggle("Пенза-2", isOn: .constant(false))
                    Toggle("Пенза-3", isOn: .constant(false))
                    Toggle("Пенза-23", isOn: .constant(false))
                    Toggle("Пенза-123", isOn: .constant(false))
                }
                
                Section(header: Text("Воронежское направление")) {
                    Toggle("Воронеж-1", isOn: .constant(false))
                    Toggle("Воронеж-2", isOn: .constant(false))
                    Toggle("Воронеж-3", isOn: .constant(false))
                    Toggle("Воронеж-4", isOn: .constant(false))
                    Toggle("Воронеж-123", isOn: .constant(false))
                    Toggle("Воронеж-23", isOn: .constant(false))
                    Toggle("Воронеж-1234", isOn: .constant(false))
                    
                }
                
                Section(header: Text("Киевское направление")) {
                    Toggle("Киев-1", isOn: .constant(false))
                    Toggle("Киев-2", isOn: .constant(false))
                    Toggle("Киев-3", isOn: .constant(false))
                    Toggle("Киев-4", isOn: .constant(false))
                    Toggle("Киев-12", isOn: .constant(false))
                    Toggle("Киев-34", isOn: .constant(false))
                }
                
                Section(header: Text("Северо-Западное направление")) {
                    Toggle("Запад-1", isOn: .constant(false))
                    Toggle("Запад-2", isOn: .constant(false))
                    Toggle("Запад-12", isOn: .constant(false))
                    Toggle("Север-1", isOn: .constant(false))
                    Toggle("Север-2", isOn: .constant(false))
                    Toggle("Север-3", isOn: .constant(false))
                    Toggle("Север-123", isOn: .constant(false))
                }
                
                Section(header: Text("Горьковское направление")) {
                    Toggle("Горький-1", isOn: .constant(false))
                    Toggle("Горький-2", isOn: .constant(false))
                    Toggle("Горький-3", isOn: .constant(false))
                    Toggle("Горький-4", isOn: .constant(false))
                    Toggle("Горький-12", isOn: .constant(false))
                    Toggle("Горький-45", isOn: .constant(false))
                }
                
                Section(header: Text("Внетрассовые сектора")) {
                    Toggle("Москва-Центр", isOn: .constant(false))
                    Toggle("Саксофон-1", isOn: .constant(false))
                    Toggle("Саксофон-2", isOn: .constant(false))
                    Toggle("Саксофон-3", isOn: .constant(false))
                    Toggle("Саксофон-123", isOn: .constant(false))
                }
            }
        }
    }
}

struct AdmissionsTabView_Previews: PreviewProvider {
    static var previews: some View {
        AdmissionsTabView(person: PersonList.persons.first!)
    }
}
