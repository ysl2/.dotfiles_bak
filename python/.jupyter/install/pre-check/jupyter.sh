#!/bin/bash
if ! type jupyter &>/dev/null; then
  echo "Not in a jupyter environment."
  exit 1
fi

