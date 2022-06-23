//
//  SwiftUIView.swift
//  CurrencyChanger-Demo
//
//  Created by Adam Hlubina on 22/06/2022.
//

import SwiftUI

struct NoConnection: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            VStack{
                Image(systemName: "wifi.slash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.white)
                Text("No internet connection")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
               Text("Check your internet connection and reload app")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
    }
}

struct NoConnection_Previews: PreviewProvider {
    static var previews: some View {
        NoConnection()
    }
}
