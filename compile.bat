@echo off
:: ==============================================
:: LaTeX 编译脚本 (支持完整编译和快速编译模式)
:: 用法: 直接双击 或 compile.bat [fast|full]
:: ==============================================

setlocal
cd /d "%~dp0"  :: 确保在脚本所在目录执行

:: 检查参数
if "%1"=="fast" goto FAST_MODE
if "%1"=="full" goto FULL_MODE
if "%1"=="" goto FULL_MODE  :: 默认完整编译
if "%1"=="help" goto SHOW_HELP

echo 错误：未知参数 '%1'
goto SHOW_HELP

:FULL_MODE
echo  正在执行完整编译流程（含参考文献处理）...
echo [1/4] 第一次编译...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo 错误：第一次编译失败！错误代码: %errorlevel%
    goto COMPILE_FAILED
)

echo [2/4] 处理参考文献...
biber main
if %errorlevel% neq 0 (
    echo  错误：参考文献处理失败！错误代码: %errorlevel%
    goto COMPILE_FAILED
)

echo [3/4] 第二次编译...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo 错误：第二次编译失败！错误代码: %errorlevel%
    goto COMPILE_FAILED
)

echo [4/4] 最终编译...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo 错误：最终编译失败！错误代码: %errorlevel%
    goto COMPILE_FAILED
)

goto COMPILE_SUCCESS

:FAST_MODE
echo 正在执行快速编译流程（跳过参考文献）...
echo [1/2] 第一次编译...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo 错误：第一次编译失败！错误代码: %errorlevel%
    goto COMPILE_FAILED
)

echo [2/2] 第二次编译...
xelatex -synctex=1 -interaction=nonstopmode main.tex
if %errorlevel% neq 0 (
    echo 错误：第二次编译失败！错误代码: %errorlevel%
    goto COMPILE_FAILED
)

goto COMPILE_SUCCESS

:COMPILE_SUCCESS
echo ========================================
echo 编译成功！生成文件: main.pdf
echo 编译时间: %date% %time%
echo ========================================
if exist main.pdf (
    if "%2"=="view" start main.pdf
)
endlocal
exit /b 0

:COMPILE_FAILED
echo ========================================
echo 编译过程中断！请检查错误信息
echo ========================================
pause
endlocal
exit /b 1

:SHOW_HELP
echo.
echo compile.bat 使用说明:
echo   直接双击     - 完整编译（含参考文献）
echo   compile.bat full - 完整编译
echo   compile.bat fast - 快速编译（跳过参考文献）
echo   compile.bat help - 显示帮助信息
echo.
pause
endlocal
exit /b 0