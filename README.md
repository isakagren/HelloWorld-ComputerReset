# HelloWorld Datoråterställning

Återställer Hello Worlds datorer genom att logga ut, ta bort och sedan skapa användaren Deltagare. 

### Användning:
 - Ladda ner clean.ps1 på ett USB-minne (gärna samma USB-minne som övriga installationsfiler för datorerna, ex HelloUnzip).
 - Sätt i USB-minnet i den dator som ska återställas.
 - Logga in på HelloWorld kontot (Administratörskontot). Du behöver inte logga ut från deltagarkontot. 
 - Högerklicka på startmenyn och sedan "Windows Powershell (Administratör)"
 - Gå till den mapp som scriptet ligger i, antagligen D:
 - Utför kommandot `Set-ExecutionPolicy Unrestricted` för att tillåta scriptet att köras. (Tab-completion finns). Detta måste endast göras en gång per dator, om detta script använts på datorn tidigare kan detta steg skippas. 
 - kör clean-scriptet genom att skriva `.\clean.ps1`
 - Logga in på användaren Deltagare
 - Kör HelloUnzipStudio som vanligt.
 - Stäng av och rengör datorn
 - Klar
 
 För frågor pinga @isak på slack. 
 
