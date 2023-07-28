//
//  ContentView.swift
//  swift_basic_1
//
//  Created by User on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: swift_basic_1Document

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(swift_basic_1Document()))
    }
}
