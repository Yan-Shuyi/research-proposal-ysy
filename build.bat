@echo off
:: ==============================================
:: LaTeX 彻底构建脚本
:: 功能：彻底清理 → 完整编译 → 自动打开PDF
:: ==============================================

setlocal
cd /d "%~dp0"

echo 开始彻底构建流程...
echo.

:: 1. 彻底清理所有文件
echo 步骤1/3: 彻底清理...
call clean.bat all
if %errorlevel% neq 0 (
    echo 清理过程出现错误
    pause
    exit /b 1
)

echo.
echo 步骤2/3: 开始完整编译...
echo.

:: 2. 完整编译（含参考文献）
call compile.bat full
if %errorlevel% neq 0 (
    echo 编译失败，构建过程中断
    pause
    exit /b 1
)

echo.
echo 步骤3/3: 准备查看生成文档...
echo.

:: 3. 检查并打开PDF
if exist main.pdf (
    echo 正在打开: main.pdf
    timeout /t 2 /nobreak >nul
    start "" "main.pdf"
    echo 彻底构建完成！PDF已自动打开
) else (
    echo 构建完成，但未找到 main.pdf 文件
)

echo.
echo 彻底构建流程结束！
pause
exit /b 0