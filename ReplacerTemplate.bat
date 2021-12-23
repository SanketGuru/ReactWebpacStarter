@echo off
Title "Text Replacer Template"
set fileName=Replacertargate.xml
set outputfileName=targates.xml


Rem create replacer String Command
REM set replaceCommand= %replaceCommand% -replace 'FIND_INFILE', 'REPLACE_WITH'
set replaceCommand=
set replaceCommand= %replaceCommand% -replace '{PYTHON_PATH}', 'python_path'
set replaceCommand= %replaceCommand% -replace '{ASSETEXTRACTOR_PATH}', 'AssetPath'
set replaceCommand= %replaceCommand% -replace '{BASE_PATH}', 'foo'
echo command  %replaceCommand%
echo finding and replacing %fileName%

( powershell -Command "(gc %fileName%) %replaceCommand% | Out-File -encoding ASCII %outputfileName%" )
