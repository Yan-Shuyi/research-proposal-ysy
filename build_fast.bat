@echo off
:: ==============================================
:: LaTeX ���ٹ����ű�
:: ���ܣ��������� �� ���ٱ��� �� �Զ���PDF
:: ==============================================

setlocal
cd /d "%~dp0"

echo ��ʼ���ٹ�������...
echo.

:: 1. ������������PDF��
echo ����1/3: ��������...
call clean.bat normal
if %errorlevel% neq 0 (
    echo ������̳��ִ���
    pause
    exit /b 1
)

echo.
echo ����2/3: ��ʼ���ٱ���...
echo.

:: 2. ���ٱ��루�����ο����ף�
call compile.bat fast
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
    timeout /t 1 /nobreak >nul
    start "" "main.pdf"
    echo ���ٹ�����ɣ�PDF���Զ���
) else (
    echo ������ɣ���δ�ҵ� main.pdf �ļ�
)

echo.
echo ���ٹ������̽�����
pause
exit /b 0