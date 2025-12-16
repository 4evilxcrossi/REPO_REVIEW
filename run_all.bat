@echo off
setlocal

rem Ports
set BACKEND_PORT=3001
set FRONTEND_PORT=3000
set NEXT_PUBLIC_BACKEND_URL=http://localhost:%BACKEND_PORT%/api/analyze

echo Installing backend deps...
pushd backend
npm install
start "backend-dev" cmd /k "set PORT=%BACKEND_PORT% && npm run dev"
popd

echo Installing frontend deps...
pushd frontend
npm install
start "frontend-dev" cmd /k "set NEXT_PUBLIC_BACKEND_URL=%NEXT_PUBLIC_BACKEND_URL% && npm run dev -- -p %FRONTEND_PORT%"
popd

echo Backend on port %BACKEND_PORT%, frontend on port %FRONTEND_PORT%.
endlocal
