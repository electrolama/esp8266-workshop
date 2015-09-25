@echo off

javaw -version >nul 2>&1 && (
  echo "Launching ESPlorer..."
  javaw -jar "ESPlorer.jar" 
) || (
  echo "ERROR: java is not in your PATH. You need to fix that."
  pause
)
