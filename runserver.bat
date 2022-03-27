@echo OFF
RMDIR /s /q "D:\G-Saad\serveur\cache\files"

echo ----------------------------------
echo -
echo Pour relancer votre serveur, faites CTRL + C puis "runserver"
echo -
echo ----------------------------------
color 09
echo -
echo Appuyez sur une TOUCHE pour lancer votre serveur
echo -
pause > nul
CLS
cd D:\G-Saad\serveur
cmd /k run.cmd +exec server.cfg