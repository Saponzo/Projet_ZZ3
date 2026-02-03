#include <stdio.h>
#include <unistd.h>      // Pour la fonction usleep
#include "system.h"      // Définitions des adresses matérielles
#include "io.h"          // Macros d'accès aux registres (IOWR_32DIRECT)

/**
 * Note : Assurez-vous que le nom PIO_0_BASE correspond au nom
 * de votre composant dans Platform Designer.
 */

int main() {
    unsigned int intensite = 0;

    printf("--- Demarrage du Nios V (Architecture RISC-V) ---\n");
    printf("Envoi de valeurs 0-255 au PWM...\n");

    while (1) {
        // Envoi de la valeur brute au registre de donnees du PIO
        // On utilise IOWR_32DIRECT pour eviter les dependances HAL Nios II
        IOWR_32DIRECT(PIO_0_BASE, 0, intensite);

        // Incrementation avec modulo 256 (maintient entre 0 et 255)
        intensite = (intensite + 1) % 256;

        // Delai de 20ms pour une transition fluide
        // (La boucle complete prend environ 5 secondes)
        usleep(20000);
    }

    return 0; // Jamais atteint
}
