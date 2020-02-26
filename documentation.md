# Återställningsrutin 3.0
Detta program tar bort och skapar ett nytt deltagarkonto samt installerar de program som tidigare gjordes av HelloUnzip.

## Förberedelse (En gång per dator)
 - Ladda ner mappen till ett USB-minne
 - Plugga in USB-minnet i den dator som ska återställas
 - Logga in på admin-kontot (Hello World), du behöver inte logga ut från deltagarkontot
 - Högerklicka på startmenyn och välj "Windows PowerShell (Administratör)"
 - Kör kommandot `Set-ExecutionPolicy Unrestricted` för att tillåta scriptet att köras. (Tab-completion finns).

## Installation (En gång per dator)
 - Högerklicka på startmenyn och välj "Windows PowerShell (Administratör)"
 - Skriv `D:` eller vilken bokstav som USB-minnet sitter på och sedan `.\install`. Errormedelandena ska vara där, och det kommer komma upp en loadingbar i konsolen. När det står "Done" i konsolen är det installerat

## Användning (Vid varje återställning)
 - Logga in på admin-kontot (Hello World), du behöver inte logga ut från deltagarkontot
 - Högerklicka på startmenyn och välj "Windows PowerShell (Administratör)"
 - Skriv `c:\clean`
 - Klar, stäng av datorn och rengör den
 
 För frågor pinga @isak på slack.

*För att ändra vad som ska finns på de nya användarns, byt ut innehållet i documents.zip och/eller desktop.zip och kör ./install igen*