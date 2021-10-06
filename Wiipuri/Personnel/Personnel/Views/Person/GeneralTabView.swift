//
//  GeneralTabView.swift
//  Personnel
//
//  Created by Владимир Ильин on 13.09.2021.
//

import SwiftUI

struct GeneralTabView: View {
    
    let person: Person
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Image(person.imageName)
                .frame(height: 200, alignment: .center)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.orange, lineWidth: 4))
                .shadow(radius: 15)
            
            Text(person.surname)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Text(person.name + " " + person.middleName)
                .font(.subheadline)
                .fontWeight(.bold)
            
            //            Divider()
            
            Spacer()
            
        }
    }
}

struct GeneralTabView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralTabView(person: PersonList.persons.first!)
    }
}
