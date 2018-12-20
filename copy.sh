#!/usr/bin/env bash
rm -rf android/packflutter/flutter/
rm -rf android/aartest/libs/
mkdir android/aartest/libs
cp -i build/packflutter/outputs/aar/packflutter-release.aar android/aartest/libs/packflutter.aar