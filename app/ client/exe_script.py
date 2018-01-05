"""Fichier d'installation de notre script salut.py."""

from cx_Freeze import setup, Executable

# On appelle la fonction setup
setup(
    name = "Deploy",
    version = "2.0",
    description = "Ce programme deploie une infrastructure",
    executables = [Executable("interface_finale.py")],
)
