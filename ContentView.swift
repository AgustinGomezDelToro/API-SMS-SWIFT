import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
            VStack {
                Group {
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
                }

                Group {
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

                    NavigationLink(destination: Credits()) {
                        Text("Go to CreditView")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: SondageSMS()) {
                        Text("Go to SondageSMS")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: AnnulerEnvoi()) {
                        Text("Go to AnnulerEnvoi")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    NavigationLink(destination: StatutSmsParID()) {
                        Text("Go to StatutSmsParID")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                
                NavigationLink(destination: StatutSmsParTag()) {
                    Text("Go to StatutSmsParTag")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: StatistiqueDesEnvois()) {
                                    Text("Go to StatistiqueDesEnvois")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .padding()
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                }
                
                NavigationLink(destination: StopSmsAddList()) {
                                    Text("Go to StopSmsAddView")
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                        .padding()
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                                        .cornerRadius(10)
                                        .padding(.horizontal)
                }
                
                NavigationLink(destination: StopSmsDeleteList()) {
                                   Text("Go to StopSmsDeleteView")
                                       .font(.system(size: 20))
                                       .foregroundColor(.white)
                                       .frame(minWidth: 0, maxWidth: .infinity)
                                       .padding()
                                       .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                                       .cornerRadius(10)
                                       .padding(.horizontal)
                    }
                }
            .padding(.top)
            }
            .navigationBarTitle("Menu", displayMode: .inline)
        }
    }
}
