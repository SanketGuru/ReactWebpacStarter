@echo off
Title "Text Replacer Template"
set fileName=Web.config.xml
set outputfileName=targates.xml

REM palceHolder
set connectionString=WB57YK743;Initial Catalog=Ea_New_tagdb;Integrated Security=False;User Id=sa;Password=sql;
set newConnectionString=WB57YK743;Initial Catalog=Ea_New_tagdb;Integrated Security=False;User Id=sa;Password=sql;

set pythonInstallation=WB57YK743;Initial Catalog=Ea_New_tagdb;Integrated Security=False;User Id=sa;Password=sql;
set pythonInstallation=WB57YK743;Initial Catalog=Ea_New_tagdb;Integrated Security=False;User Id=sa;Password=sql;
Rem create replacer String Command
REM set replaceCommand= %replaceCommand% -replace 'FIND_INFILE', 'REPLACE_WITH'
set replaceCommand=
Rem connectionString
set replaceCommand= %replaceCommand% -replace '%connectionString%', '%newConnectionString%'
set replaceCommand= %replaceCommand% -replace '{ASSETEXTRACTOR_PATH}', 'AssetPath'
set replaceCommand= %replaceCommand% -replace '{BASE_PATH}', 'foo'
echo command  %replaceCommand%
echo finding and replacing %fileName%

( powershell -Command "(gc %fileName%) %replaceCommand% | Out-File -encoding ASCII %outputfileName%" )
