//
//  CenterModifier.swift
//  AfricaAnimal
//
//  Created by Gurjinder Singh on 23/12/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content)-> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
