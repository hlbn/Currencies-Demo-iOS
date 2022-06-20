//
//  ButtonView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 20/06/2022.
//

import SwiftUI

struct ButtonView: View {
    var image: String
    var text: String
    var body: some View {
            HStack {
                  Image(systemName: image).font(.title)
                Text(text).fontWeight(.semibold).font(.headline)
            }.padding().foregroundColor(.white).background(Color.brown)
            .cornerRadius(40)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(image: "", text: "")
    }
}
