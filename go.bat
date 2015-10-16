@echo off

if not "%OS%"=="Windows_NT" goto win9xStart
:winNTStart
@setlocal

rem Need to check if we are using the 4NT shell...
if "%eval[2+2]" == "4" goto setup4NT

:winNT1
rem On NT/2K grab all arguments at once
set CMD_LINE_ARGS=%*
goto doneStart

:setup4NT
set CMD_LINE_ARGS=%$
goto doneStart

:win9xStart
rem Slurp the command line arguments.  This loop allows for an unlimited number of 
rem arguments (up to the command line limit, anyway).

set CMD_LINE_ARGS=

:setupArgs
if %1a==a goto doneStart
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto setupArgs

:doneStart

java -cp "bin\perfRunHarness\*" com.tableausoftware.test.tools.perfRunHarness.Main --rootPath=%CD% %CMD_LINE_ARGS%