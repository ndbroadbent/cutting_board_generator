#!/bin/bash

# Generates and displays the cutting board image.

set -e
./cutting_board_generator.rb

echo "Opening cutting_board.jpg..."
open cutting_board.jpg
