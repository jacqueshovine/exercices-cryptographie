import Foundation 

var rotors = [[1, 2, 3, 4, 5],[1, 2],[1, 2, 3]]
var rotorCount = 0 // Nombre de fois que les rotors ont été tournés

func encryptMessage(message: String) -> String {
  var splittedMessage = Array(message.uppercased())
  var encryptedMessage = ""
  
  for i in 0...splittedMessage.count - 1 {
    var charIndex = alphabet.index(of: String(splittedMessage[i]))! // On récupère la position du caractère dans l'alphabet
    // print(charIndex, "charIndex")
    var c = crankRotors(rotors: rotors, count: rotorCount)
    // print(c, "c")
    rotorCount += 1 // On incrémente le nombre de tours pour modifier la position des rotors


    var encryptedCharPos = (charIndex + c) % alphabet.count
    // print(encryptedCharPos, "encryptedCharPos")
    // print("___________________")
    encryptedMessage += alphabet[encryptedCharPos]
  }

  return encryptedMessage
}

func crankRotors(rotors: [[Int]], count: Int) -> Int {
 var value = 0 // Cette valeur contiendra le nombre à ajouter à la lettre pour la chiffrer.
 var mult = 1

 for r in 0...rotors.count - 1 {
   // print(rotors[r])
   value += rotors[r][count % rotors[r].count] * mult
   // print(rotors[r][count % rotors[r].count] * mult)
   // rotors est le grand tableau de rotors déclaré en haut.
   // r représente l'indice dans ce grand tableau. Par exemple, quand r = 0 on est sur le premier rotor.
   /* count % rotors[r].count :
      count est le nombre de tours de rotors. 
      Comme chaque rotor a un nombre de dents différent, 
      on effectue un modulo du count global sur le nombre de dents du rotor courant (pour éviter de le dépasser).
   */
   mult *= 10
 }
 return value
}

var alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
var text = "salut"
print(encryptMessage(message: text))