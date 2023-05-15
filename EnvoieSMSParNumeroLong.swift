import SwiftUI
import Foundation

// Struct pour la vue "EnvoieSMSParNumeroLong"
struct EnvoieSMSParNumeroLong: View {
    var body: some View {
        NavigationView {
            VStack {
                // Un bouton qui appelle la fonction EnvoieSMSParNumeroLong() lorsqu'il est pressé
                Button(action: {
                    EnvoieSMSParNumeroLong()
                }) {
                    Text("Envoyer SMS")
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
    
    // Fonction pour envoyer un SMS par numéro long
    func EnvoieSMSParNumeroLong() {
        let apiKey = "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX" // Votre clé API
        let destinataire = "33XXXXXXXXX" // Le numéro du destinataire
        let expediteur = "33XXXXXXXXX" // Votre numéro
        let message = "status" // Le message à envoyer

        let url = URL(string: "https://api.smspartner.fr/v1/vn/send")! // URL pour envoyer le SMS
        var requete = URLRequest(url: url)
        requete.httpMethod = "POST"
        requete.addValue("application/json", forHTTPHeaderField: "Content-Type") // Ajout du type de contenu dans l'en-tête de la requête

        // Paramètres pour l'envoi du SMS
        let params: [String: Any] = [
            "apiKey": apiKey,
            "to": destinataire,
            "from": expediteur,
            "message": message
        ]
        
        // Ajout des paramètres dans le corps de la requête
        requete.httpBody = try? JSONSerialization.data(withJSONObject: params)
        
        let session = URLSession.shared
        // Tâche pour envoyer la requête
        let task = session.dataTask(with: requete) { (data, response, error) in
            // Si une erreur survient, on l'affiche
            if let erreur = error {
                print("Erreur : \(erreur.localizedDescription)")
                return
            }
            
            // Sinon, on affiche les données reçues
            if let donnees = data {
                if let resultat = String(data: donnees, encoding: .utf8) {
                    print(resultat) // Impression du résultat
                }
            }
        }
        
        task.resume() // On lance la tâche
    }
}
