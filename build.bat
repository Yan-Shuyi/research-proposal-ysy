@echo off
:: ==============================================
:: LaTeX ���׹����ű�
:: ���ܣ��������� �� �������� �� �Զ���PDF
:: ==============================================

setlocal
cd /d "%~dp0"

echo ��ʼ���׹�������...
echo.

:: 1. �������������ļ�
echo ����1/3: ��������...
call clean.bat all
if %errorlevel% neq 0 (
    echo ������̳��ִ���
    pause
    exit /b 1
)

echo.
echo ����2/3: ��ʼ��������...
echo.

:: 2. �������루���ο����ף�
call compile.bat full
if %errorlevel% neq 0 (
    echo ����ʧ�ܣ����������ж�
    pause
    exit /b 1
)

echo.
echo ����3/3: ׼���鿴�����ĵ�...
echo.

:: 3. ��鲢��PDF
if exist main.pdf (
    echo ���ڴ�: main.pdf
    timeout /t 2 /nobreak >nul
    start "" "main.pdf"
    echo ���׹�����ɣ�PDF���Զ���
) else (
    echo ������ɣ���δ�ҵ� main.pdf �ļ�
)

echo.
echo ���׹������̽�����
pause
exit /b 0