import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SMSUnitaire()) {
                    Text("Send SMS")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                NavigationLink(destination: SMSParLotsView()) {
                    Text("Go to SMS par lot view")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: EnvoieSMSParNumeroLong()) {
                    Text("Go to EnvoieSMSParNumeroLong")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: StatutSMS()) {
                    Text("Go to StatutSMS")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: ListStopSMS()) {
                    Text("Go to ListStopSMS")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: CreationSubCompte()) {
                    Text("Go to CreationSubCompte")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
    }
}

