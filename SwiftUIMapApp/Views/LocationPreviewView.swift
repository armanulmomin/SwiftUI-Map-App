import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    @State private var showAlert = false

    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                if let imageName = location.imageNames.first {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .cornerRadius(10)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(location.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(location.cityName)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            VStack(spacing: 8) {
                Button("Learn more") {
                            showAlert = true
                        }
                        .alert("Details", isPresented: $showAlert) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text(location.description)
                        }
                .font(.headline)
                .frame(width: 125, height: 35)
                .buttonStyle(.borderedProminent)

                Button("Next") {
                    vm.nextButtonPressed()
                    // Action
                }
                .font(.headline)
                .frame(width: 125, height: 35)
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
        .fixedSize(horizontal: false, vertical: true) // 👈 Only takes needed vertical space
    }
}
#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
        .padding()
        .background(Color.gray.opacity(0.3)) // Helps you see spacing
}
