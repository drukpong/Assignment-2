#!/bin/bash

case "$1" in
    system)
        echo "=========================="
        echo "   SYSTEM DIAGNOSTICS"
        echo "=========================="
        echo "Hostname: $(hostname)"
        echo "Current User: $(whoami)"
        echo "Date/Time: $(date)"
        echo "Operating System: $(uname -s)"
        echo "Kernel Version: $(uname -r)"
        echo "Uptime: $(uptime -p)"
        echo
        echo "CPU Information:"
        lscpu | grep -E "Model name|CPU\(s\)"
        echo
        echo "Memory Information:"
        free -h
        echo
        echo "Current Working Directory: $(pwd)"
        ;;

    network)
        if [ -z "$2" ]; then
            echo "Error: Please provide a hostname or IP address."
            echo "Usage: diagnostic network <host>"
            exit 2
        fi

        echo "=========================="
        echo "   NETWORK DIAGNOSTICS"
        echo "=========================="
        echo "Host: $2"
        echo
        echo "Resolved Address:"
        getent hosts "$2"
        echo
        echo "Connectivity Test:"

        if ping -c 2 -W 3 "$2" > /dev/null 2>&1; then
            echo "Connectivity: OK"
        else
            echo "Connectivity: FAILED"
        fi

        echo
        echo "Network Interfaces:"
        ip addr
        ;;

    disk)
        echo "=========================="
        echo "     DISK DIAGNOSTICS"
        echo "=========================="
        df -h /
        ;;

    help)
        echo "=========================="
        echo "      DIAGNOSTIC CLI"
        echo "=========================="
        echo
        echo "Available commands:"
        echo
        echo "  diagnostic system"
        echo "      Display system information."
        echo
        echo "  diagnostic network <host>"
        echo "      Check network connectivity to a host."
        echo
        echo "  diagnostic disk"
        echo "      Display disk usage information."
        echo
        echo "  diagnostic help"
        echo "      Display this help message."
        ;;

    *)
        echo "Unknown command: $1"
        echo "Run './diagnostic.sh help' for usage."
        exit 1
        ;;
esac
