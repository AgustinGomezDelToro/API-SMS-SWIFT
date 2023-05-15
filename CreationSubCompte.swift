import SwiftUI

// Structure pour la vue "CreationSubCompte"
struct CreationSubCompte: View {
    var body: some View {
        // Un bouton qui appelle la fonction createSubaccount() lorsqu'il est pressé
        Button(action: {
            createSubaccount()
        }) {
            Text("Créer sous-compte")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }

    // Fonction pour créer un sous-compte
    func createSubaccount() {
        let url = URL(string: "https://api.smspartner.fr/v1/subaccount/create")! // URL pour créer un sous-compte

        // Paramètres pour la requête
        let parameters: [String: Any] = [
            "apiKey": "TU_CLAVE_API", // Votre clé API
            "type": "advanced",
            "parameters": [
                "email": "aaaa@bbb.ccc", // Adresse e-mail du sous-compte
                "creditToAttribute": 10, // Crédit à attribuer
                "isBuyer": 0, // Indique si le sous-compte est un acheteur
                "firstname": "prenom", // Prénom de l'utilisateur du sous-compte
                "lastname": "nom" // Nom de l'utilisateur du sous-compte
            ] as [String : Any]
        ]

        // Création de la requête
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")

        // Ajout du corps de la requête
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }

        // Tâche pour envoyer la requête et recevoir la réponse
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Si une erreur survient, on l'affiche
            if let error = error {
                print("Erreur : \(error)")
            }
            // Sinon, on traite les données reçues
            else if let data = data {
                do {
                    // On tente de convertir les données reçues en JSON
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json) // On affiche le JSON obtenu
                    }
                } catch let error {
                    print("Erreur : \(error)")
                }
            }
        }

        task.resume() // On lance la tâche
    }
}

