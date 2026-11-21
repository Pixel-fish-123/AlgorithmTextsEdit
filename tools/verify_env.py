"""Verify the project-local toolchain for AlgorithmTextsEdit."""

from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
PANDOC = ROOT / "tools" / "bin" / "pandoc" / "pandoc.exe"


def run(cmd: list[str]) -> str:
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            check=False,
        )
        output = (result.stdout or result.stderr).strip().splitlines()
        return output[0] if output else ""
    except FileNotFoundError:
        return "NOT FOUND"


def main() -> int:
    print(f"Project: {ROOT}")
    print(f"Python:  {sys.version.split()[0]}  ({sys.executable})")

    ok = True
    for module in ("docx", "yaml", "pypdf"):
        try:
            imported = __import__(module)
            version = getattr(imported, "__version__", "installed")
            print(f"  {module:<10} {version}")
        except Exception as exc:  # noqa: BLE001
            ok = False
            print(f"  {module:<10} MISSING ({exc})")

    try:
        imported = __import__("pdfplumber")
        version = getattr(imported, "__version__", "installed")
        print(f"  {'pdfplumber':<10} {version} (optional, P5)")
    except Exception:  # noqa: BLE001
        print(f"  {'pdfplumber':<10} not installed (optional, P5)")

    print(f"pandoc:  {run([str(PANDOC), '--version']) if PANDOC.exists() else 'NOT FOUND'}")
    print(f"git:     {run(['git', '--version'])}")
    print(f"g++:     {run(['g++', '--version'])}")
    print(f"venv:    {'.venv' if (ROOT / '.venv').exists() else 'not created'}")

    if not PANDOC.exists():
        ok = False
    if shutil.which("git") is None:
        ok = False
    if shutil.which("g++") is None:
        ok = False

    print("RESULT:  " + ("OK" if ok else "FAILED"))
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
