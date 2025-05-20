//
//  SwiftUIMapAppApp.swift
//  SwiftUIMapApp
//
//  Created by Arman on 15/5/25.
//

import SwiftUI

@main
struct SwiftUIMapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView().environmentObject(vm)
        }
    }
}
