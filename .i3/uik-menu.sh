#!/bin/bash

echo -e "https://ui-kit.emisgroup.uk\nhttps://ui-kit-react.emisgroup.uk\nhttps://ui-kit-angular.emisgroup.uk\nhttps://dev.ui-kit.emisgroup.uk\nhttps://dev.ui-kit-react.emisgroup.uk\nhttps://dev.ui-kit-angular.emisgroup.uk" | rofi -dmenu -p "URL" | { read -r url; xdg-open "$url"; }
