@echo off
:: ==============================================
:: LaTeX ����ű� (֧����������Ϳ��ٱ���ģʽ)
:: �÷�: ֱ��˫�� �� compile.bat [fast|full]
:: ==============================================

setlocal
cd /d "%~dp0"  :: ȷ���ڽű�����Ŀ¼ִ��

:: ������
if "%1"=="fast" goto FAST_MODE
if "%1"=="full" goto FULL_MODE
if "%1"=="" goto FULL_MODE  :: Ĭ����������
if "%1"=="help" goto SHOW_HELP

echo ����δ֪���� '%1'
goto SHOW_HELP

:FULL_MODE
echo  ����ִ�������������̣����ο����״���...
echo [1/4] ��һ�α���...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo ���󣺵�һ�α���ʧ�ܣ��������: %errorlevel%
    goto COMPILE_FAILED
)

echo [2/4] ����ο�����...
biber main
if %errorlevel% neq 0 (
    echo  ���󣺲ο����״���ʧ�ܣ��������: %errorlevel%
    goto COMPILE_FAILED
)

echo [3/4] �ڶ��α���...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo ���󣺵ڶ��α���ʧ�ܣ��������: %errorlevel%
    goto COMPILE_FAILED
)

echo [4/4] ���ձ���...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo �������ձ���ʧ�ܣ��������: %errorlevel%
    goto COMPILE_FAILED
)

goto COMPILE_SUCCESS

:FAST_MODE
echo ����ִ�п��ٱ������̣������ο����ף�...
echo [1/2] ��һ�α���...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo ���󣺵�һ�α���ʧ�ܣ��������: %errorlevel%
    goto COMPILE_FAILED
)

echo [2/2] �ڶ��α���...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo ���󣺵ڶ��α���ʧ�ܣ��������: %errorlevel%
    goto COMPILE_FAILED
)

goto COMPILE_SUCCESS

:COMPILE_SUCCESS
echo ========================================
echo ����ɹ��������ļ�: main.pdf
echo ����ʱ��: %date% %time%
echo ========================================
if exist main.pdf (
    if "%2"=="view" start main.pdf
)
endlocal
exit /b 0

:COMPILE_FAILED
echo ========================================
echo ��������жϣ����������Ϣ
echo ========================================
pause
endlocal
exit /b 1

:SHOW_HELP
echo.
echo compile.bat ʹ��˵��:
echo   ֱ��˫��     - �������루���ο����ף�
echo   compile.bat full - ��������
echo   compile.bat fast - ���ٱ��루�����ο����ף�
echo   compile.bat help - ��ʾ������Ϣ
echo.
pause
endlocal
exit /b 0