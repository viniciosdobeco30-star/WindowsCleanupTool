@echo off
chcp 65001 >nul
title Windows Cleanup + Performance Tool
color 0A

:: Check admin
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo ================================
    echo  RUN AS ADMINISTRATOR!
    echo Right-click and choose
    echo "Run as administrator".
    echo ================================
    pause
    exit /b
)

:: Language selection
:LANGUAGE_MENU
cls
echo =======================================
echo   WINDOWS CLEANUP + PERFORMANCE TOOL
echo =======================================
echo.
echo  1 - English
echo  2 - Português (Portuguese)
echo  0 - Exit
echo.
set /p LANG=Choose language / Escolha idioma: 

if "%LANG%"=="1" goto ENGLISH_MODE
if "%LANG%"=="2" goto PORTUGUESE_MODE
if "%LANG%"=="0" goto FIM
goto LANGUAGE_MENU

:ENGLISH_MODE
set "LANG_MODE=EN"
goto MAIN_MENU

:PORTUGUESE_MODE
set "LANG_MODE=PT"
goto MAIN_MENU

:MAIN_MENU
cls
if "%LANG_MODE%"=="EN" (
    echo =======================================
    echo   WINDOWS CLEANUP + PERFORMANCE TOOL
    echo =======================================
    echo.
    echo  1 - Quick cleanup (temp + recycle bin)
    echo  2 - Full cleanup (includes prefetch, logs)
    echo  3 - Create restore point
    echo  4 - Optimize drives (defrag/trim)
    echo  5 - Performance mode (power/services tweaks)
    echo  6 - Help (explanation of options)
    echo  7 - Scan malware (Defender - quick scan)
    echo  8 - Hardware info (temperature / external monitor)
    echo  9 - Quick network tools
    echo 10 - Reset tweaks (revert Performance mode)
    echo 11 - Restart (script or PC)
    echo 12 - Quick speed test (download)
    echo 13 - System quick report (.txt)
    echo  0 - Exit
    echo.
    set /p OPCAO=Choose an option: 
) else (
    echo =======================================
    echo   LIMPEZA E PERFORMANCE AVANCADA
    echo =======================================
    echo.
    echo  1 - Limpeza rapida (temp + lixeira)
    echo  2 - Limpeza completa (inclui prefetch, logs)
    echo  3 - Criar ponto de restauracao
    echo  4 - Otimizar unidades (defrag/trim)
    echo  5 - Modo Performance (tweaks de energia/servicos)
    echo  6 - Duvidas (explicacao das opcoes)
    echo  7 - Escanear malware (Defender - scan rapido)
    echo  8 - Info de hardware (temperatura / monitor externo)
    echo  9 - Ferramentas de rede rapidas
    echo 10 - Reset Tweaks (reverter Modo Performance)
    echo 11 - Reiniciar (script ou PC)
    echo 12 - Teste rapido de velocidade (download)
    echo 13 - Relatorio rapido do sistema (.txt)
    echo  0 - Sair
    echo.
    set /p OPCAO=Escolha uma opcao: 
)

if "%OPCAO%"=="1" goto RAPIDA
if "%OPCAO%"=="2" goto COMPLETA
if "%OPCAO%"=="3" goto RESTOREPOINT
if "%OPCAO%"=="4" goto OTIMIZAR
if "%OPCAO%"=="5" goto PERFORMANCE
if "%OPCAO%"=="6" goto DUVIDAS
if "%OPCAO%"=="7" goto MALWARE
if "%OPCAO%"=="8" goto HARDWARE
if "%OPCAO%"=="9" goto REDE
if "%OPCAO%"=="10" goto RESETTWEAKS
if "%OPCAO%"=="11" goto REINICIAR
if "%OPCAO%"=="12" goto SPEEDTEST
if "%OPCAO%"=="13" goto RELATORIO
if "%OPCAO%"=="0" goto FIM
goto MAIN_MENU

:RAPIDA
cls
if "%LANG_MODE%"=="EN" (
    echo ===== QUICK CLEANUP =====
    echo This will delete:
    echo - User temporary files
    echo - System temporary files
    echo - Recycle bin
    echo.
    set /p CONF=Confirm (Y/N)? 
) else (
    echo ===== LIMPEZA RAPIDA =====
    echo Isto vai apagar:
    echo - Arquivos temporarios do usuario
    echo - Arquivos temporarios do sistema
    echo - Lixeira
    echo.
    set /p CONF=Confirmar (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto MAIN_MENU

if "%LANG_MODE%"=="EN" echo Closing browsers (chrome/edge/firefox)...
if "%LANG_MODE%"=="PT" echo Fechando navegadores (chrome/edge/firefox)...

taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1

if "%LANG_MODE%"=="EN" echo Cleaning user TEMP...
if "%LANG_MODE%"=="PT" echo Limpando TEMP do usuario...

del /f /s /q "%temp%\*" >nul 2>&1
for /d %%i in ("%temp%\*") do rd /s /q "%%i" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Cleaning system TEMP...
if "%LANG_MODE%"=="PT" echo Limpando TEMP do sistema...

del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Emptying Recycle Bin...
if "%LANG_MODE%"=="PT" echo Esvaziando Lixeira...

powershell -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Quick cleanup completed.
if "%LANG_MODE%"=="PT" echo Limpeza rapida concluida.

pause
goto MAIN_MENU

:COMPLETA
cls
if "%LANG_MODE%"=="EN" (
    echo ===== FULL CLEANUP =====
    echo This will delete:
    echo - Everything from quick cleanup
    echo - PREFETCH files
    echo - Basic Windows Error Reporting logs
    echo - Additional user temporary files
    echo.
    set /p CONF=Confirm (Y/N)? 
) else (
    echo ===== LIMPEZA COMPLETA =====
    echo Isto vai apagar:
    echo - Tudo da limpeza rapida
    echo - Arquivos PREFETCH
    echo - Logs basicos de Windows Error Reporting
    echo - Temporarios adicionais do usuario
    echo.
    set /p CONF=Confirmar (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto MAIN_MENU

if "%LANG_MODE%"=="EN" echo Closing browsers (chrome/edge/firefox)...
if "%LANG_MODE%"=="PT" echo Fechando navegadores (chrome/edge/firefox)...

taskkill /f /im chrome.exe >nul 2>&1
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im firefox.exe >nul 2>&1

if "%LANG_MODE%"=="EN" echo Cleaning user TEMP...
if "%LANG_MODE%"=="PT" echo Limpando TEMP do usuario...

del /f /s /q "%temp%\*" >nul 2>&1
for /d %%i in ("%temp%\*") do rd /s /q "%%i" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Cleaning extra user TEMP...
if "%LANG_MODE%"=="PT" echo Limpando TEMP extra do usuario...

del /f /s /q "%userprofile%\AppData\Local\Temp\*" >nul 2>&1
for /d %%i in ("%userprofile%\AppData\Local\Temp\*") do rd /s /q "%%i" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Cleaning system TEMP...
if "%LANG_MODE%"=="PT" echo Limpando TEMP do sistema...

del /f /s /q "C:\Windows\Temp\*" >nul 2>&1
for /d %%i in ("C:\Windows\Temp\*") do rd /s /q "%%i" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Cleaning PREFETCH...
if "%LANG_MODE%"=="PT" echo Limpando PREFETCH...

del /f /s /q "C:\Windows\Prefetch\*" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Cleaning Windows Error Reporting...
if "%LANG_MODE%"=="PT" echo Limpando Windows Error Reporting...

del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\ReportArchive\*" >nul 2>&1
del /f /s /q "C:\ProgramData\Microsoft\Windows\WER\ReportQueue\*" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Emptying Recycle Bin...
if "%LANG_MODE%"=="PT" echo Esvaziando Lixeira...

powershell -NoProfile -Command "Clear-RecycleBin -Force" >nul 2>&1

if "%LANG_MODE%"=="EN" echo Running Disk Cleanup (profile 1)...
if "%LANG_MODE%"=="PT" echo Executando Liberador de Espaco em Disco (perfil 1)...

cleanmgr /sagerun:1

if "%LANG_MODE%"=="EN" echo Full cleanup completed.
if "%LANG_MODE%"=="PT" echo Limpeza completa concluida.

pause
goto MAIN_MENU

:RESTOREPOINT
cls
if "%LANG_MODE%"=="EN" (
    echo ===== RESTORE POINT =====
    echo Creates a system restore point.
    echo If any tweak causes problems, you can go back.
    echo.
    echo Creating restore point called "BeforePerformanceTweaks"...
    powershell -NoProfile -Command "Checkpoint-Computer -Description 'BeforePerformanceTweaks' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1

    if %errorlevel% NEQ 0 (
        echo Failed to create restore point (maybe disabled in system).
    ) else (
        echo Restore point created successfully.
    )
) else (
    echo ===== PONTO DE RESTAURACAO =====
    echo Cria um ponto de restauracao do sistema.
    echo Se algum tweak der problema, voce pode voltar atras.
    echo.
    echo Criando um ponto de restauracao chamado "AntesTweaksPerformance"...
    powershell -NoProfile -Command "Checkpoint-Computer -Description 'AntesTweaksPerformance' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1

    if %errorlevel% NEQ 0 (
        echo Falha ao criar ponto de restauracao (talvez desativado no sistema).
    ) else (
        echo Ponto de restauracao criado com sucesso.
    )
)
pause
goto MAIN_MENU

:OTIMIZAR
cls
if "%LANG_MODE%"=="EN" (
    echo ===== OPTIMIZE DRIVES =====
    echo - On HDDs, runs defragmentation.
    echo - On SSDs, runs optimization/TRIM (via Windows tool).
    echo.
    set /p CONF=Confirm (Y/N)? 
) else (
    echo ===== OTIMIZAR UNIDADES =====
    echo - Em HDs, roda desfragmentacao.
    echo - Em SSDs, executa otimizacao/TRIM (via ferramenta do Windows).
    echo.
    set /p CONF=Confirmar (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto MAIN_MENU

if "%LANG_MODE%"=="EN" echo Opening Windows drive optimizer...
if "%LANG_MODE%"=="PT" echo Abrindo otimizador de unidades do Windows...

dfrgui
echo.
if "%LANG_MODE%"=="EN" echo Use the window that opened to optimize/defrag drives.
if "%LANG_MODE%"=="PT" echo Use a janela que abriu para otimizar/defrag as unidades.

pause
goto MAIN_MENU

:PERFORMANCE
cls
if "%LANG_MODE%"=="EN" (
    echo ===== PERFORMANCE MODE =====
    echo This mode applies tweaks for better performance:
    echo - Activates High Performance power plan
    echo - Adjusts priority for foreground programs
    echo - Reduces service termination timeout
    echo - Disables some telemetry/diagnostic/offline maps services
    echo.
    echo RECOMMENDED TO CREATE RESTORE POINT FIRST (option 3).
    echo.
    set /p CONF=Apply performance tweaks (Y/N)? 
) else (
    echo ===== MODO PERFORMANCE =====
    echo Este modo aplica tweaks para maior desempenho:
    echo - Ativa plano de energia Alto Desempenho
    echo - Ajusta prioridade para programas em primeiro plano
    echo - Diminui tempo de encerramento de servicos
    echo - Desativa alguns servicos de telemetria/diagnostico/mapas offline
    echo.
    echo RECOMENDADO CRIAR PONTO DE RESTAURACAO ANTES (opcao 3).
    echo.
    set /p CONF=Aplicar tweaks de performance (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto MAIN_MENU

if "%LANG_MODE%"=="EN" echo Activating High Performance power plan...
if "%LANG_MODE%"=="PT" echo Ativando plano de energia Alto Desempenho...

powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1

if "%LANG_MODE%"=="EN" echo Adjusting priority for foreground programs...
if "%LANG_MODE%"=="PT" echo Ajustando prioridade para programas em primeiro plano...

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f >nul 2>&1

if "%LANG_MODE%"=="EN" echo Speeding up service termination...
if "%LANG_MODE%"=="PT" echo Acelerando encerramento de servicos...

reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 1000 /f >nul 2>&1

if "%LANG_MODE%"=="EN" echo Disabling some less useful services for performance...
if "%LANG_MODE%"=="PT" echo Desativando alguns servicos menos uteis para desempenho...

:: Connected User Experiences and Telemetry (diagtrack)
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1

:: MAPS (Offline Maps)
sc stop MapsBroker >nul 2>&1
sc config MapsBroker start= disabled >nul 2>&1

:: Fax
sc stop Fax >nul 2>&1
sc config Fax start= disabled >nul 2>&1

:: PrintWorkflowUserSvc (modern printing service)
for /f "tokens=1" %%s in ('sc query state^=all ^| findstr /I "PrintWorkflowUserSvc"') do (
    sc stop "%%s" >nul 2>&1
    sc config "%%s" start= disabled >nul 2>&1
)

if "%LANG_MODE%"=="EN" echo Performance tweaks applied. Restart PC for full effect.
if "%LANG_MODE%"=="PT" echo Tweaks de performance aplicados. Reinicie o PC para efeito total.

pause
goto MAIN_MENU

:MALWARE
cls
if "%LANG_MODE%"=="EN" (
    echo ===== SCAN MALWARE (DEFENDER) =====
    echo Will run a QUICK scan using Microsoft Defender.
    echo (Scans critical system areas, may take a few minutes.)
    echo.
    set /p CONF=Confirm (Y/N)? 
) else (
    echo ===== ESCANEAR MALWARE (DEFENDER) =====
    echo Vai rodar um scan RAPIDO usando o Microsoft Defender.
    echo (Scaneia areas criticas do sistema, pode demorar alguns minutos.)
    echo.
    set /p CONF=Confirmar (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto MAIN_MENU

if "%LANG_MODE%"=="EN" echo Starting Defender quick scan...
if "%LANG_MODE%"=="PT" echo Iniciando scan rapido do Defender...

cd /d "%ProgramFiles%\Windows Defender"
MpCmdRun.exe -Scan -ScanType 1

echo.
if "%LANG_MODE%"=="EN" echo If anything is found, Defender will show notification in Windows.
if "%LANG_MODE%"=="PT" echo Se algo for encontrado, o Defender vai mostrar notificacao no Windows.

pause
goto MAIN_MENU

:HARDWARE
cls
if "%LANG_MODE%"=="EN" (
    echo ===== HARDWARE INFO / TEMPERATURE =====
    echo CMD doesn't show temperature by itself.
    echo This option tries to open an external hardware monitor.
    echo.
    echo Common options:
    echo - OpenHardwareMonitor.exe
    echo - HWiNFO64.exe
    echo.
    echo Adjust the path below for the program you use.
    echo.
    set MONITOR_HW="C:\Program Files\OpenHardwareMonitor\OpenHardwareMonitor.exe"
    if exist %MONITOR_HW% (
        echo Opening hardware monitor...
        start "" %MONITOR_HW%
    ) else (
        echo I didn't find the hardware monitor at:
        echo %MONITOR_HW%
        echo Edit the script and change MONITOR_HW variable to your program.
    )
) else (
    echo ===== INFO DE HARDWARE / TEMPERATURA =====
    echo O CMD nao mostra temperatura sozinho.
    echo Esta opcao tenta abrir um monitor de hardware externo.
    echo.
    echo Opcoes comuns:
    echo - OpenHardwareMonitor.exe
    echo - HWiNFO64.exe
    echo.
    echo Ajuste o caminho abaixo para o programa que voce usa.
    echo.
    set MONITOR_HW="C:\Program Files\OpenHardwareMonitor\OpenHardwareMonitor.exe"
    if exist %MONITOR_HW% (
        echo Abrindo monitor de hardware...
        start "" %MONITOR_HW%
    ) else (
        echo Nao encontrei o monitor de hardware no caminho:
        echo %MONITOR_HW%
        echo Edite o script e mude a variavel MONITOR_HW para o seu programa.
    )
)
pause
goto MAIN_MENU

:REDE
cls
if "%LANG_MODE%"=="EN" (
    echo ===== QUICK NETWORK TOOLS =====
    echo 1 - Test ping to 8.8.8.8 (Google DNS)
    echo 2 - Show IP and adapters (ipconfig /all)
    echo 3 - Clear DNS cache (ipconfig /flushdns)
    echo 0 - Go back
    echo.
    set /p ROP=Choose an option: 
) else (
    echo ===== FERRAMENTAS DE REDE RAPIDAS =====
    echo 1 - Testar ping em 8.8.8.8 (Google DNS)
    echo 2 - Mostrar IP e adaptadores (ipconfig /all)
    echo 3 - Limpar cache DNS (ipconfig /flushdns)
    echo 0 - Voltar
    echo.
    set /p ROP=Escolha uma opcao: 
)

if "%ROP%"=="1" goto REDE_PING
if "%ROP%"=="2" goto REDE_IPCONFIG
if "%ROP%"=="3" goto REDE_FLUSHDNS
if "%ROP%"=="0" goto MAIN_MENU
goto REDE

:REDE_PING
cls
if "%LANG_MODE%"=="EN" echo Testing ping to 8.8.8.8 ...
if "%LANG_MODE%"=="PT" echo Testando ping em 8.8.8.8 ...

ping 8.8.8.8
echo.
if "%LANG_MODE%"=="EN" echo If there's loss or no TTL, your connection may have problems.
if "%LANG_MODE%"=="PT" echo Se tiver perda ou nenhum TTL, sua conexao pode estar com problema.

pause
goto REDE

:REDE_IPCONFIG
cls
if "%LANG_MODE%"=="EN" echo Showing network info (ipconfig /all)...
if "%LANG_MODE%"=="PT" echo Mostrando informacoes de rede (ipconfig /all)...

echo.
ipconfig /all
pause
goto REDE

:REDE_FLUSHDNS
cls
if "%LANG_MODE%"=="EN" echo Clearing DNS cache (ipconfig /flushdns)...
if "%LANG_MODE%"=="PT" echo Limpando cache DNS (ipconfig /flushdns)...

ipconfig /flushdns
echo.
if "%LANG_MODE%"=="EN" echo DNS cache cleared. This can help with sites not opening.
if "%LANG_MODE%"=="PT" echo Cache DNS limpo. Isso pode ajudar em problemas de sites nao abrindo.

pause
goto REDE

:RESETTWEAKS
cls
if "%LANG_MODE%"=="EN" (
    echo ===== RESET TWEAKS (REVERT PERFORMANCE MODE) =====
    echo This option tries to:
    echo - Return power plan to Balanced.
    echo - Reactivate services disabled in Performance Mode.
    echo.
    set /p CONF=Confirm reset (Y/N)? 
) else (
    echo ===== RESET TWEAKS (REVERTER MODO PERFORMANCE) =====
    echo Esta opcao tenta:
    echo - Voltar plano de energia para Equilibrado.
    echo - Reativar servicos desativados no Modo Performance.
    echo.
    set /p CONF=Confirmar reset (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto MAIN_MENU

if "%LANG_MODE%"=="EN" echo Restoring default power plans...
if "%LANG_MODE%"=="PT" echo Restaurando planos de energia padrao...

powercfg -restoredefaultschemes >nul 2>&1

if "%LANG_MODE%"=="EN" echo Activating Balanced plan (if exists)...
if "%LANG_MODE%"=="PT" echo Ativando plano Equilibrado (se existir)...

powercfg -s 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1

if "%LANG_MODE%"=="EN" echo Reactivating services...
if "%LANG_MODE%"=="PT" echo Reativando servicos...

sc config DiagTrack start= auto >nul 2>&1
sc config MapsBroker start= demand >nul 2>&1
sc config Fax start= demand >nul 2>&1

for /f "tokens=1" %%s in ('sc query state^=all ^| findstr /I "PrintWorkflowUserSvc"') do (
    sc config "%%s" start= demand >nul 2>&1
)

if "%LANG_MODE%"=="EN" echo Basic reset completed. Restart PC to apply everything.
if "%LANG_MODE%"=="PT" echo Reset basico concluido. Reinicie o PC para aplicar tudo.

pause
goto MAIN_MENU

:REINICIAR
cls
if "%LANG_MODE%"=="EN" (
    echo ===== RESTART =====
    echo 1 - Restart script only
    echo 2 - Restart computer
    echo 0 - Go back
    echo.
    set /p RREINI=Choose an option: 
) else (
    echo ===== REINICIAR =====
    echo 1 - Reiniciar apenas o script
    echo 2 - Reiniciar o computador
    echo 0 - Voltar
    echo.
    set /p RREINI=Escolha uma opcao: 
)

if "%RREINI%"=="1" goto REINICIAR_SCRIPT
if "%RREINI%"=="2" goto REINICIAR_PC
if "%RREINI%"=="0" goto MAIN_MENU
goto REINICIAR

:REINICIAR_SCRIPT
cls
if "%LANG_MODE%"=="EN" echo Restarting script...
if "%LANG_MODE%"=="PT" echo Reiniciando o script...

timeout /t 1 >nul
goto MAIN_MENU

:REINICIAR_PC
cls
if "%LANG_MODE%"=="EN" (
    echo This will restart the computer NOW.
    echo Make sure to save your files first.
    echo.
    set /p CONF=Confirm PC restart (Y/N)? 
) else (
    echo Isto vai reiniciar o computador AGORA.
    echo Certifique-se de salvar seus arquivos antes.
    echo.
    set /p CONF=Confirmar reinicio do PC (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto REINICIAR

if "%LANG_MODE%"=="EN" echo Restarting PC...
if "%LANG_MODE%"=="PT" echo Reiniciando o PC...

shutdown /r /t 5
if "%LANG_MODE%"=="EN" echo The computer will restart in a few seconds.
if "%LANG_MODE%"=="PT" echo O computador sera reiniciado em alguns segundos.

pause
goto MAIN_MENU

:SPEEDTEST
cls
if "%LANG_MODE%"=="EN" (
    echo ===== QUICK SPEED TEST (DOWNLOAD) =====
    echo This test downloads a test file from the internet
    echo and calculates an approximate speed in Mbps.
    echo.
    echo IMPORTANT:
    echo - Results are approximate.
    echo - Avoid downloads/streams while testing.
    echo.
    set /p CONF=Confirm test (Y/N)? 
) else (
    echo ===== TESTE RAPIDO DE VELOCIDADE (DOWNLOAD) =====
    echo Este teste baixa um arquivo de teste da internet
    echo e calcula uma velocidade aproximada em Mbps.
    echo.
    echo IMPORTANTE:
    echo - Os resultados sao aproximados.
    echo - Evite fazer downloads/streams enquanto testa.
    echo.
    set /p CONF=Confirmar teste (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto MAIN_MENU

echo.
if "%LANG_MODE%"=="EN" echo Starting test... This may take a few seconds.
if "%LANG_MODE%"=="PT" echo Iniciando teste... Isso pode levar alguns segundos.

:: Test URL (100 MB on Hetzner test server)
set TEST_URL=https://hel1-speed.hetzner.com/100MB.bin
set TEST_FILE=%TEMP%\speed_test.bin

powershell -NoProfile -Command ^
  "$url='%TEST_URL%'; $dest='%TEST_FILE%';" ^
  "try{" ^
  "  $wc = New-Object System.Net.WebClient;" ^
  "  $sw = [System.Diagnostics.Stopwatch]::StartNew();" ^
  "  $wc.DownloadFile($url, $dest);" ^
  "  $sw.Stop();" ^
  "  $bytes = (Get-Item $dest).Length;" ^
  "  $seg = [math]::Max(0.001, $sw.Elapsed.TotalSeconds);" ^
  "  $mb = [math]::Round($bytes/1MB,2);" ^
  "  $mbps = [math]::Round((($bytes*8)/($seg*1024*1024)),2);" ^
  "  Write-Output ('SIZE: ' + $mb + ' MB');" ^
  "  Write-Output ('TIME: ' + [math]::Round($seg,2) + ' s');" ^
  "  Write-Output ('APPROX. SPEED: ' + $mbps + ' Mbps');" ^
  "}catch{" ^
  "  Write-Output 'Error performing test. Check your connection.';" ^
  "}finally{" ^
  "  if (Test-Path $dest) { Remove-Item $dest -Force }" ^
  "}"

echo.
if "%LANG_MODE%"=="EN" echo Test completed (approximate values).
if "%LANG_MODE%"=="PT" echo Teste concluido (valores aproximados).

pause
goto MAIN_MENU

:RELATORIO
cls
if "%LANG_MODE%"=="EN" (
    echo ===== SYSTEM QUICK REPORT =====
    echo A .txt file will be created on Desktop
    echo with basic system information.
    echo.
    set /p CONF=Confirm (Y/N)? 
) else (
    echo ===== RELATORIO RAPIDO DO SISTEMA =====
    echo Sera criado um arquivo .txt na Area de Trabalho
    echo com informacoes basicas do seu sistema.
    echo.
    set /p CONF=Confirmar (S/N)? 
)
if /I not "%CONF%"=="S" if /I not "%CONF%"=="Y" goto MAIN_MENU

set "DESKTOP=%USERPROFILE%\Desktop"
if "%LANG_MODE%"=="EN" set "ARQ_REL=%DESKTOP%\System_Report.txt"
if "%LANG_MODE%"=="PT" set "ARQ_REL=%DESKTOP%\Relatorio_Sistema.txt"

if "%LANG_MODE%"=="EN" echo Generating report at:
if "%LANG_MODE%"=="PT" echo Gerando relatorio em:

echo %ARQ_REL%
echo.

if "%LANG_MODE%"=="EN" (
    > "%ARQ_REL%" echo ============================================
    >> "%ARQ_REL%" echo   SYSTEM QUICK REPORT
    >> "%ARQ_REL%" echo   %DATE% %TIME%
    >> "%ARQ_REL%" echo ============================================
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== SYSTEMINFO ====
    systeminfo >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== CPU ====
    wmic cpu get name,NumberOfCores,NumberOfLogicalProcessors /format:list >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== GPU ====
    wmic path win32_videocontroller get name /format:list >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== RAM MEMORY (SUMMARY) ====
    wmic memorychip get capacity,manufacturer,partnumber,speed /format:list >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== NETWORK (IPCONFIG /ALL) ====
    ipconfig /all >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== END OF REPORT ====
) else (
    > "%ARQ_REL%" echo ============================================
    >> "%ARQ_REL%" echo   RELATORIO RAPIDO DO SISTEMA
    >> "%ARQ_REL%" echo   %DATE% %TIME%
    >> "%ARQ_REL%" echo ============================================
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== SYSTEMINFO ====
    systeminfo >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== CPU ====
    wmic cpu get name,NumberOfCores,NumberOfLogicalProcessors /format:list >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== GPU ====
    wmic path win32_videocontroller get name /format:list >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== MEMORIA RAM (RESUMO) ====
    wmic memorychip get capacity,manufacturer,partnumber,speed /format:list >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== REDE (IPCONFIG /ALL) ====
    ipconfig /all >> "%ARQ_REL%"
    >> "%ARQ_REL%" echo.
    >> "%ARQ_REL%" echo ==== FIM DO RELATORIO ====
)

if "%LANG_MODE%"=="EN" echo Report generated at:
if "%LANG_MODE%"=="PT" echo Relatorio gerado em:

echo %ARQ_REL%
echo.
if "%LANG_MODE%"=="EN" echo Open the file to see details (may take a while to open).
if "%LANG_MODE%"=="PT" echo Abra o arquivo para ver os detalhes (pode demorar um pouco pra abrir).

pause
goto MAIN_MENU

:DUVIDAS
cls
if "%LANG_MODE%"=="EN" (
    echo ============ HELP ============
    echo.
    echo [1 - Quick cleanup]
    echo - Cleans user and system temporary files + Recycle Bin.
    echo.
    echo [2 - Full cleanup]
    echo - Does everything from quick cleanup and cleans PREFETCH + some error logs.
    echo.
    echo [3 - Create restore point]
    echo - Creates a point so you can go back if something goes wrong.
    echo.
    echo [4 - Optimize drives]
    echo - Opens Windows tool to defragment/optimize HDD/SSD.
    echo.
    echo [5 - Performance mode]
    echo - Enables High Performance, prioritizes foreground apps and disables some services.
    echo.
    echo [7 - Scan malware]
    echo - Uses Microsoft Defender in quick scan on critical areas.
    echo.
    echo [8 - Hardware info]
    echo - Tries to open an external monitoring program (temperature, etc.).
    echo.
    echo [9 - Network tools]
    echo - Ping, show IP and clear DNS cache.
    echo.
    echo [10 - Reset tweaks]
    echo - Tries to undo Performance mode (energy + services).
    echo.
    echo [11 - Restart]
    echo - Can restart only the script or the entire PC.
    echo.
    echo [12 - Quick speed test]
    echo - Downloads a test file and calculates approximate Mbps.
    echo.
    echo [13 - System quick report]
    echo - Generates a .txt on Desktop with Windows, CPU, GPU, RAM and network info.
    echo.
    echo [0 - Exit]
    echo - Closes the script.
    echo.
    echo Press any key to return to menu.
) else (
    echo ============ DUVIDAS ============
    echo.
    echo [1 - Limpeza rapida]
    echo - Limpa temporarios do usuario e do sistema + Lixeira.
    echo.
    echo [2 - Limpeza completa]
    echo - Faz tudo da rapida e limpa PREFETCH + alguns logs de erro.
    echo.
    echo [3 - Criar ponto de restauracao]
    echo - Cria um ponto para voce voltar se algo der problema.
    echo.
    echo [4 - Otimizar unidades]
    echo - Abre a ferramenta do Windows para desfragmentar/otimizar HD/SSD.
    echo.
    echo [5 - Modo Performance]
    echo - Liga Alto Desempenho, prioriza apps em primeiro plano e desativa alguns servicos.
    echo.
    echo [7 - Escanear malware]
    echo - Usa o Microsoft Defender em scan rapido nas areas criticas.
    echo.
    echo [8 - Info de hardware]
    echo - Tenta abrir um programa externo de monitoramento (temperatura, etc.).
    echo.
    echo [9 - Ferramentas de rede]
    echo - Ping, ver IP e limpar cache DNS.
    echo.
    echo [10 - Reset Tweaks]
    echo - Tenta desfazer o Modo Performance (energia + servicos).
    echo.
    echo [11 - Reiniciar]
    echo - Pode reiniciar so o script ou o PC inteiro.
    echo.
    echo [12 - Teste rapido de velocidade]
    echo - Baixa um arquivo de teste e calcula Mbps aproximado.
    echo.
    echo [13 - Relatorio rapido do sistema]
    echo - Gera um .txt na Area de Trabalho com infos de Windows, CPU, GPU, RAM e rede.
    echo.
    echo [0 - Sair]
    echo - Fecha o script.
    echo.
    echo Aperte qualquer tecla para voltar ao menu.
)

pause >nul
goto MAIN_MENU

:FIM
if "%LANG_MODE%"=="EN" echo Exiting...
if "%LANG_MODE%"=="PT" echo Saindo...

timeout /t 1 >nul
exit /b
