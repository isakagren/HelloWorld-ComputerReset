# Återställningsrutin 3.0
Detta program tar bort och skapar ett nytt deltagarkonto samt installerar de program som tidigare gjordes av HelloUnzip.

## Förberedelse och installation på datorn (En gång per dator)
 - Ladda ner clean.ps1 och de två .zip-filerna till ett USB-minne
 - Plugga in USB-minnet i den dator som ska återställas
 - Logga in på admin-kontot (Hello World), du behöver inte logga ut från deltagarkontot
 - Högerklicka på startmenyn och välj "Windows PowerShell (Administratör)"
 - Kör kommandot `Set-ExecutionPolicy Unrestricted` för att tillåta scriptet att köras. (Tab-completion finns).
 - Koppiera clean.ps1 och .zip-filerna till C: på datorn

## Återställning utan att installera på datorn
 - Ladda ner clean.ps1 och de två .zip-filerna till ett USB-minne
 - Plugga in USB-minnet i den dator som ska återställas
 - Logga in på admin-kontot (Hello World), du behöver inte logga ut från deltagarkontot
 - Högerklicka på startmenyn och välj "Windows PowerShell (Administratör)"
 - Kör kommandot `Set-ExecutionPolicy Unrestricted` för att tillåta scriptet att köras. (Tab-completion finns).
 - Skriv `D:` (Eller vilken bokstav USB-minnet sitter på)
 - Skriv `./clean`
 - Klar, stäng av datorn och rengör den

## Användning (Vid varje installation)
 - Högerklicka på startmenyn och välj "Windows PowerShell (Administratör)"
 - Skriv `cd /`
 - Skriv `./clean` 
 - Klar, stäng av datorn och rengör den
 
 För frågor pinga @isak på slack.
