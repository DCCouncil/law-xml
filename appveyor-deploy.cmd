:: deploy if we are on the master/development branch

set deploy=no
if "%appveyor_repo_branch%" == "master" set deploy=yes
if "%appveyor_repo_branch%" == "development" set deploy=yes
if "%appveyor_repo_branch%" == "DCCODE-240" set deploy=yes
if "%deploy%" == "yes" (
  cd ..\dc-law-xml-codified

  echo ----- dc-law-xml ----- >> version.txt
  echo dc-law-xml build: %appveyor_build_version% > version.txt
  echo dc-law-xml commit: %appveyor_repo_commit% >> version.txt
  :: this madness is how we simulate `echo -n`
  <nul (set /p output=dc-law-tools commit:) >> version.txt
  git -C ..\dc-law-tools show -q --format=%%H >> version.txt
  echo xcore-win commit: missing >> version.txt

  git add -A
  git diff --cached --exit-code --shortstat || git commit --quiet -m "deploy codified XML from dc-law-xml build %appveyor_build_version%"
  git push origin %appveyor_repo_branch%
  echo "deployed to %appveyor_repo_branch%"
) else (
  echo "skipping deployment"
)
