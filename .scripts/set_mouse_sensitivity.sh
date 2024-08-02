#!/bin/bash

defaults write -g com.apple.mouse.scaling $1

echo "Mouse sensitivity set to $(defaults read -g com.apple.mouse.scaling)"
