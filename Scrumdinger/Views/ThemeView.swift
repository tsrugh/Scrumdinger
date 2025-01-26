//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Lucas Pereira on 23/05/24.
//

import SwiftUI
struct ThemeView: View {
    
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(4)
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
