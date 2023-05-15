import SwiftUI

// Cette requête est utilisée pour envoyer des SMS par lot de 500 en temps réel ou en différé
struct SMSParLotsView: View {
    var body: some View {
        // Un bouton qui appelle la fonction sendSMSParLots() lorsqu'il est pressé
        Button(action: {
            sendSMSParLots()
        }) {
            Text("Send Bulk SMS")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
    

    func sendSMSParLots() {
        // Liste des SMS à envoyer
        let smsList: [[String: String]] = [
            [
                "phoneNumber": "06XXXXXXXX", // Numéro de téléphone du destinataire
                "message": "msg 0 en temps réel" // Message à envoyer
            ],
            [
                "phoneNumber": "06XXXXXXXX", // Un autre numéro de téléphone
                "message": "msg 1 en temps réel" // Un autre message
            ]
        ]

        // Données à envoyer à l'API
        let data: [String: Any] = [
            "apiKey": "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX", // Votre clé API
            "sender": "mycompany", // L'expéditeur du SMS
            // Ces 3 lignes permettent de programmer un envoi différé.
            //"scheduledDeliveryDate": "12/05/2023", // Date de livraison prévue
            //"time": 9, // Heure de livraison
            //"minute": 0, // Minute de livraison
            "SMSList": smsList // La liste des SMS à envoyer
        ]

        // Conversion des données en JSON
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            fatalError("Error converting data to JSON.")
        }

        // Création de la requête HTTP
        let url = URL(string: "https://api.smspartner.fr/v1/bulk-send")! // URL de l'API
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Méthode HTTP
        request.httpBody = jsonData // Corps de la requête
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // Type de contenu
        request.addValue("\(jsonData.count)", forHTTPHeaderField: "Content-Length") // Longueur du contenu
        request.addValue("no-cache", forHTTPHeaderField: "cache-control") // Contrôle du cache

        // Envoi de la requête HTTP
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Vérification de la réponse HTTP
            guard let httpResponse = response as? HTTPURLResponse else {
                fatalError("Error: Invalid HTTP response.")
            }
            print("statusCode: \(httpResponse.statusCode)") // Impression du code d'état HTTP

            // Gestion des erreurs éventuelles
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }

            // Impression de la réponse de l'API
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                }
            }
        }
        task.resume()
    }
}
// Un aperçu de la vue
struct BulkSMSView_Previews: PreviewProvider {
    static var previews: some View {
        SMSParLotsView()
    }
}
