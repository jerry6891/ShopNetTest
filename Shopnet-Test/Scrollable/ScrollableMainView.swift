//
//  ScrollableMainView.swift
//  Shopnet-Test
//
//  Created by Rex Karnufex on 12/3/21.
//

import SwiftUI

struct ScrollableMainView: View {
    @StateObject var data = ScrollableViewModel()
    @State var isNavigationBarHidden: Bool = true
    var body: some View {
        NavigationView {
            CharacterList(data: data)
                .navigationTitle("Scrollable View")
        }
    }
}

struct ScrollableMainView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollableMainView().preferredColorScheme(.dark)
    }
}
