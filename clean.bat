@echo off
:: ==============================================
:: LaTeX �Զ�����ű�
:: ������clean.bat [mode] 
::   mode �����ǣ�
::     normal - ��������
::     all    - ������������PDF����Ĭ�ϣ�
::     help   - ��ʾ����
:: ==============================================

setlocal enabledelayedexpansion
cd /d "%~dp0"

:: ��������ģʽ
set "MODE=%1"
if "%MODE%"=="" set "MODE=all"
if /i "%MODE%"=="help" goto SHOW_HELP
if not "%MODE%"=="normal" if not "%MODE%"=="all" (
    echo ������Чģʽ '%MODE%'
    goto SHOW_HELP
)

:: ���ı����ļ��б�
set "PROTECTED_PATTERNS=main.tex references.bib ecustjournal.cls sections\*.tex figures\*.*"

:: ��ɾ�����ļ�����
set "TEMP_FILES=*.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.bcf *.run.xml *.synctex.gz *.fls *.fdb_latexmk"

:: ��ʾ������Ϣ
echo.
if /i "%MODE%"=="all" (
    echo [INFO] ����ִ�г�����������PDF�ļ���...
) else (
    echo [INFO] ����ִ�г�������...
)

:: ɨ�貢ɾ���ļ�
set "DELETED_COUNT=0"
for %%G in (%TEMP_FILES%) do (
    for /f "delims=" %%F in ('dir /b %%G 2^>nul') do (
        set "SAFE=0"
        for %%P in (%PROTECTED_PATTERNS%) do (
            if "%%F"=="%%P" set "SAFE=1"
            echo "%%F" | findstr /C:"%%P" >nul && set "SAFE=1"
        )
        if !SAFE!==0 (
            del /f /q "%%F" 2>nul && (
                set /a "DELETED_COUNT+=1"
                echo [DEL] ��ɾ��: %%F
            )
        )
    )
)

:: ��������ģʽ�������
if /i "%MODE%"=="all" (
    for %%F in (main.pdf main.synctex.gz) do (
        if exist "%%F" (
            del /f /q "%%F" && (
                set /a "DELETED_COUNT+=1"
                echo [DEL] �ѳ���ɾ��: %%F
            )
        )
    )
)

:: ��ʾ���
echo.
if %DELETED_COUNT% gtr 0 (
    echo [OK] ������ɣ���ɾ�� %DELETED_COUNT% ���ļ�
) else (
    echo [INFO] δ�ҵ���������ļ�
)
goto END

:SHOW_HELP
echo.
echo clean.bat ʹ��˵��:
echo   ֱ��˫��     - ������������PDF��
echo   clean.bat all - ������������PDF��
echo   clean.bat help - ��ʾ����
echo.
pause
goto END

:END
timeout /t 1 /nobreak >nul
exit /b 0