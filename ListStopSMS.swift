import SwiftUI

// Structure pour la vue "ListStopSMS"
struct ListStopSMS: View {
    var body: some View {
        // Un bouton qui appelle la fonction ListStopSMS() lorsqu'il est pressé
        Button(action: {
            ListStopSMS()
        }) {
            Text("Check Stop SMS List")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }

    // Fonction pour récupérer la liste des SMS stoppés
    func ListStopSMS() {
        let apiKey = "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX" // Votre clé API
        let urlString = "https://api.smspartner.fr/v1/stop-sms/list?apiKey=\(apiKey)" // URL pour récupérer la liste des SMS stoppés

        // On vérifie que l'URL est correctement formée
        guard let url = URL(string: urlString) else {
            print("URL invalide")
            return
        }

        // Tâche pour récupérer les données de l'URL
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Si une erreur survient, on l'affiche
            if let error = error {
                print("Erreur : \(error)")
            }
            // Sinon, on affiche les données reçues
            else if let data = data {
                let str = String(data: data, encoding: .utf8)
                print("Données reçues :\n\(str ?? "")")
            }
        }

        task.resume() // On lance la tâche
    }
}

// Aperçu de la vue
struct StopSMSList_Previews: PreviewProvider {
    static var previews: some View {
        ListStopSMS()
    }
}

