import Foundation 

func rotpos(message: String) -> String {
  var splittedMessage = Array(message.uppercased())
  var encryptedMessage = ""
  
  for c in 0...splittedMessage.count - 1 {

    var charIndex = alphabet.index(of: String(splittedMessage[c]))! // On récupère la position du caractère dans l'alphabet

    var encryptedCharPos = (charIndex + c + 1) % alphabet.count // Chiffrement : On ajoute la position du caractère dans la chaine à 1 et on utilise modulo 26
    encryptedMessage += alphabet[encryptedCharPos] // On concatène à chaque tour de boucle le nouveau caractère dans le message crypté.
  }

  return encryptedMessage
}

func revertedRotPos(message: String) -> String {
  var splittedMessage = Array(message.uppercased())
  var decipheredMessage = ""

  for c in 0...splittedMessage.count - 1 {
    var charIndex = alphabet.index(of: String(splittedMessage[c]))! 
    var decipheredCharPos = (charIndex - c - 1)
        print(decipheredCharPos)
    if (decipheredCharPos < 0) {
      decipheredCharPos += 26
    }

    decipheredMessage += alphabet[decipheredCharPos]
  }

  return decipheredMessage
}

var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var message = "zimbabwe"
print(rotpos(message: message)) // AKPFFHDM
print(revertedRotPos(message: "akpffhdm"))
