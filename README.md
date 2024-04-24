# Paperoga

Firmware per la scheda minion del sistema tavolo da stiro Rotondi

## Compilazione

Il firmware dovrebbe essere compilato con i seguenti strumenti:
 - XC16 v1.36
 - MPLAB X IDE v6.05

## TODO

 - Attiva la pagina di errore ram
 - Rimuovi `create_page`
 - Spezzare i salvataggi di parametri macchina e ciclo perche' e' troppo lenta
 - Spostare la lettura dei gettoni in interrupt
 - Inserire una segnalazione dettagliata degli errori (per esempio sul controllo CRC della ram)
 - Lima i font
 - Controlla il wearleveling
