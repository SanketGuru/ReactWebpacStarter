
@echo off

Rem location is location of project you want to set up react root example "C:\Users\admin\source\repos\ReactGrid\ReactGrid\"
set location="C:\Users\SESA567022\source\repos\ReactGrid\ReactGrid\"
set entryPointFileName="rdg"
set outputCssFileName=react-grid
set callNPM=1

echo Creating Project from "%location%"

Rem  Copy .babelrc
copy %location%.babelrc .babelrc

Rem  Copy jsconfig.json
copy %location%jsconfig.json jsconfig.json

Rem  Copy package.json
copy %location%package.json package.json

Rem make config folder
mkdir config
Rem  Copy package.json
copy %location%config\webpack.config.js config\webpack.config.js

Rem  Npm install
npm i 
npm audit fix

Rem  Create Scripts\ folder for ourput js file
mkdir Scripts
mkdir Scripts\reactGrid

Rem react-grid css file
type nul >> "Scripts\reactGrid\%outputCssFileName%.css"

Rem  Create src folder for sources
mkdir src 

Rem  Copy Entry point file
copy %location%src\rdg.js src\%entryPointFileName%.js

xcopy %location%public public

echo paste following content in C# View
echo ------------------------------------

type %location%rootSnippet.html