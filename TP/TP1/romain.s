.data
msgEntree:
  .string "Veuillez entrer un nombre romain : "
  .align 2

# Définir le tampon buffer et allouer de l'espace pour 10 caractères
buffer:
  .space 10

.text
main:
  # Afficher le message d'invite
  la   a0, msgEntree    # Adresse de la chaîne de caractères à afficher
  li   a7, 4         # Appel système pour afficher le message
  ecall

  # Lire l'entrée de l'utilisateur
  la   a0, buffer    # Adresse du tampon de lecture
  li   a1, 10        # Taille maximale de la saisie
  li   a7, 8         # Appel système pour lire (read)
  ecall
  
  # Appeler une fonction pour convertir le nombre romain en décimal
  la   a0, buffer       # Passer l'adresse du tampon de saisie comme argument
  jal  convertRomanToDecimal

  # Afficher le résultat
  la   a0, buffer    # Adresse du tampon contenant le résultat en décimal
  li   a7, 4         # Appel système pour afficher la conversion
  ecall

  # Terminer le programme
  li   a7, 10        # Appel système pour terminer (exit)
  ecall


convertRomanToDecimal:
