@echo off
:: ==============================================
:: LaTeX 快速构建脚本
:: 功能：常规清理 → 快速编译 → 自动打开PDF
:: ==============================================

setlocal
cd /d "%~dp0"

echo 开始快速构建流程...
echo.

:: 1. 常规清理（保留PDF）
echo 步骤1/3: 常规清理...
call clean.bat normal
if %errorlevel% neq 0 (
    echo 清理过程出现错误
    pause
    exit /b 1
)

echo.
echo 步骤2/3: 开始快速编译...
echo.

:: 2. 快速编译（跳过参考文献）
call compile.bat fast
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
    timeout /t 1 /nobreak >nul
    start "" "main.pdf"
    echo 快速构建完成！PDF已自动打开
) else (
    echo 构建完成，但未找到 main.pdf 文件
)

echo.
echo 快速构建流程结束！
pause
exit /b 0