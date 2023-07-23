#! /bin/bash

# Retrieve command
command=$1

if [[ ("$command" == "") || ("$command" == "--help") || ("$command" == "-h") ]]; then   # Print help
    echo "nvrun - Application runner for NVIDIA GPUs"
    echo
    echo "USAGE:"
    echo
    echo "    nvrun [options] [command]"
    echo "        Run desired command on NVIDIA GPU"
    echo
    echo "OPTIONS:"
    echo
    echo "    --help"
    echo "    -h"
    echo "        Show this help text."
    echo

    exit 0
fi

echo "Offloading to NVIDIA GPU..."
echo

# example of manual launch of google-chrome:
# __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only google-chrome

# Notify offload to the NVIDIA GPU to the script shell environment
export __NV_PRIME_RENDER_OFFLOAD=1
export __VK_LAYER_NV_optimus=NVIDIA_only
export __GLX_VENDOR_LIBRARY_NAME=nvidia

# Run given command in background
nohup $command &