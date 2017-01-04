:: deploy if we are on the master/development branch

set deploy=no
if "%appveyor_repo_branch%" == "master" set deploy=yes
if "%appveyor_repo_branch%" == "development" set deploy=yes
if "%deploy%" == "yes" (
  cd ..\dc-law-xml-codified
  git add -A
  git diff --cached --exit-code --shortstat || git commit --quiet -m "deploy codified XML from dc-law-xml build %appveyor_build_version%"
  git push origin %appveyor_repo_branch%
  echo "deployed to %appveyor_repo_branch%"
) else (
  echo "skipping deployment"
)
