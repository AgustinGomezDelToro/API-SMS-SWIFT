import SwiftUI

// Structure pour la vue "StatutSMS"
struct StatutSMS: View {
   var body: some View {
       // Un bouton qui appelle la fonction StatutSMS() lorsqu'il est pressé
       Button(action: {
           StatutSMS()
       }) {
           Text("Check SMS Status")
               .font(.system(size: 20))
               .foregroundColor(.white)
               .frame(minWidth: 0, maxWidth: .infinity)
               .padding()
               .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
               .cornerRadius(10)
               .padding(.horizontal)
       }
   }
   
   // Fonction pour vérifier le statut d'un SMS
   func StatutSMS() {
       let apiKey = "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX" // Votre clé API
       let messageId = "your msg ID" // ID de votre message
       let phoneNumber = "06XXXXXXXX" // Numéro de téléphone

       // URL pour vérifier le statut du SMS
       let urlString = "https://api.smspartner.fr/v1/message-status?apiKey=\(apiKey)&messageId=\(messageId)&phoneNumber=\(phoneNumber)"

       // On vérifie que l'URL est correctement formée
       guard let url = URL(string: urlString) else {
           print("Erreur : impossible de créer l'URL")
           return
       }

       // Tâche pour récupérer les données de l'URL
       let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           // Si une erreur se produit, on l'affiche
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
struct StatutSMS_Previews: PreviewProvider {
   static var previews: some View {
       StatutSMS()
   }
}

