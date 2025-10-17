@echo off
:: ==============================================
:: LaTeX 自动清理脚本
:: 参数：clean.bat [mode] 
::   mode 可以是：
::     normal - 常规清理
::     all    - 彻底清理（包括PDF）（默认）
::     help   - 显示帮助
:: ==============================================

setlocal enabledelayedexpansion
cd /d "%~dp0"

:: 设置清理模式
set "MODE=%1"
if "%MODE%"=="" set "MODE=all"
if /i "%MODE%"=="help" goto SHOW_HELP
if not "%MODE%"=="normal" if not "%MODE%"=="all" (
    echo 错误：无效模式 '%MODE%'
    goto SHOW_HELP
)

:: 核心保护文件列表
set "PROTECTED_PATTERNS=main.tex references.bib ecustjournal.cls sections\*.tex figures\*.*"

:: 可删除的文件类型
set "TEMP_FILES=*.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.bcf *.run.xml *.synctex.gz *.fls *.fdb_latexmk"

:: 显示清理信息
echo.
if /i "%MODE%"=="all" (
    echo [INFO] 正在执行彻底清理（包括PDF文件）...
) else (
    echo [INFO] 正在执行常规清理...
)

:: 扫描并删除文件
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
                echo [DEL] 已删除: %%F
            )
        )
    )
)

:: 彻底清理模式额外操作
if /i "%MODE%"=="all" (
    for %%F in (main.pdf main.synctex.gz) do (
        if exist "%%F" (
            del /f /q "%%F" && (
                set /a "DELETED_COUNT+=1"
                echo [DEL] 已彻底删除: %%F
            )
        )
    )
)

:: 显示结果
echo.
if %DELETED_COUNT% gtr 0 (
    echo [OK] 清理完成！共删除 %DELETED_COUNT% 个文件
) else (
    echo [INFO] 未找到可清理的文件
)
goto END

:SHOW_HELP
echo.
echo clean.bat 使用说明:
echo   直接双击     - 常规清理（保留PDF）
echo   clean.bat all - 彻底清理（包括PDF）
echo   clean.bat help - 显示帮助
echo.
pause
goto END

:END
timeout /t 1 /nobreak >nul
exit /b 0