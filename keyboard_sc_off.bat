@echo off
:: Desativa a troca do layout do teclado no Windows via atalhos de teclas
echo Desativando a troca de layout do teclado por atalhos de teclas...

:: Verifica se o script está sendo executado como administrador
whoami /groups | find "S-1-16-12288" >nul
if not %errorlevel%==0 (
    echo Este script deve ser executado como administrador.
    pause
    exit /b
)

:: Caminho no registro para as configurações de idioma e teclado
set regKey="HKCU\Keyboard Layout\Toggle"

:: Define os valores para desativar as combinações de teclas Alt+Shift e Ctrl+Shift
reg add %regKey% /v Hotkey /t REG_SZ /d 3 /f

:: Finalização
echo Operação concluída. Reinicie o computador para aplicar as mudanças.
pause
