//
//  LocationsView.swift
//  SwiftUIMapApp
//
//  Created by Arman on 15/5/25.
//

import SwiftUI
import MapKit


struct LocationsView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
                MapMarker(coordinate: location.coordinates, tint: .red)
            })
                .ignoresSafeArea()
            
            VStack(spacing:0)
            {
                header.padding()
                Spacer()
                
                ZStack{
                    ForEach(vm.locations)
                    {
                        location in
                        if vm.mapLocation == location {
                            LocationPreviewView(location: location)
                        }
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    LocationsView().environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                vm.toggleLocationsList()
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment : .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }

            if vm.showLocationsList{
                LocationListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding()
    }
}
