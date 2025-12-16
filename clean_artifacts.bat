@echo off
setlocal

echo Removing install/build artifacts...
for %%D in ("backend\node_modules" "frontend\node_modules" "frontend\.next" "frontend\out" "backend\dist") do (
  if exist %%D (
    echo Deleting %%D
    rmdir /s /q "%%D"
  )
)

echo Done. Safe to rerun npm install afterward.
endlocal
