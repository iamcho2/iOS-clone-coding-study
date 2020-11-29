//
//  NavigationView.swift
//  apple-music
//
//  Created by 초이 on 2020/11/28.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        NavigationView {
            List {
                Text("bnlau")
            }
            .navigationBarTitle("hello", displayMode: .large)
        }
        
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
