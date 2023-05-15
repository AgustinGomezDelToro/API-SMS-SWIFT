import SwiftUI

struct SMSUnitaire: View {
    var body: some View {
        // Un bouton qui appelle la fonction sendSMS() lorsqu'il est pressé
        Button(action: {
            sendSMS()
        }) {
            Text("Envoyer SMS unitaire")
                .font(.system(size: 20)) // Taille du texte
                .foregroundColor(.white) // Couleur du texte
                .frame(minWidth: 0, maxWidth: .infinity) // Taille du bouton, qui s'ajuste automatiquement
                .padding() // Padding autour du texte
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom)) // Fond du bouton, un dégradé de bleu
                .cornerRadius(10) // Coins arrondis du bouton
                .padding(.horizontal) // Espacement horizontal autour du bouton
        }
    }

    func sendSMS() {
        // Objet JSON contenant les informations nécessaires pour envoyer le SMS
        let data = [
            "apiKey": "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", // remplacez par votre clé API
            "phoneNumbers": "+336XXXXXXXX", // remplacez par votre numéro de téléphone
            "sender": "Swift",
            "gamme": 1,
            "message": "C'est un message test Swift" // remplacez par votre message
        ] as [String : Any]
        
        // Conversion de l'objet JSON en données
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            fatalError("Erreur lors de la conversion des données en JSON.")
        }
        
        // Définition des options pour la requête HTTP POST à l'API SMS Partner
        let url = URL(string: "https://api.smspartner.fr/v1/send")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Méthode HTTP
        request.httpBody = jsonData // Corps de la requête
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // Type de contenu
        request.addValue("\(jsonData.count)", forHTTPHeaderField: "Content-Length") // Longueur du contenu
        request.addValue("no-cache", forHTTPHeaderField: "cache-control") // Contrôle du cache
        request.addValue("https://webhook.site/TOKEN", forHTTPHeaderField: "webhookUrl") // URL du webhook *cette ligne est facultative*
        
        // Exécution de la requête HTTP POST avec les options et données définies précédemment
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                fatalError("Erreur : réponse HTTP non valide.")
            }
            print("statusCode: \(httpResponse.statusCode)") // Impression du statut HTTP
            
            if let error = error {
                print("Error: \(error.localizedDescription)") // Impression de l'erreur, si elle existe
            }
            
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Réponse : \(responseString)") // Impression de la réponse, si elle existe
                }
            }
        }
        task.resume() // Démarrage de la tâche
    }
}
