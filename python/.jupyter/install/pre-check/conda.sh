#!/bin/bash
if ! type conda &>/dev/null; then
  echo "Not in a conda environment."
  exit 1
fi
