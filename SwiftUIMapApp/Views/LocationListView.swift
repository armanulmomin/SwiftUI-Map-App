//
//  LocationListView.swift
//  SwiftUIMapApp
//
//  Created by Arman on 20/5/25.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    var body: some View {
        List {
            ForEach(vm.locations)
            { location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                        .padding(.vertical, 4)
                }

                
               
            
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    LocationListView()
            .environmentObject(LocationsViewModel())
}

extension LocationListView{
    private func listRowView(location: Location) -> some View{
        HStack{
            if let imagename = location.imageNames.first {
                Image(imagename)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45,height: 45)
                    .cornerRadius(10)
                
            }
            VStack(alignment: .leading){
                Text(location.name)
                Text(location.cityName)
            }
        }
    }
    
}
