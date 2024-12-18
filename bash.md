# Bash basics

Start all files with:

```sh
#!/bin/bash
```

```sh
echo "Hello" > file.txt # saves as new file
echo "Hello" >> file.txt # appends
```

## Variables

By defining it:

```sh
RECIPIENT_NAME="Charles"
```

By asking the user:

```sh
read -p "Enter the recipient's name: " RECIPIENT_NAME
```

Using the variable:

```sh
echo "Hello $RECIPIENT_NAME"
```

## Functions

```sh
function withoutParams () {
    echo "lol"
}

withoutParams


function withParams () {
    echo "$1"
}

withParams "lol"
```

## Miscelaneous

### Clipboard

```sh
# Check if xclip or pbcopy is installed
if ! command -v pbcopy &> /dev/null && ! command -v xclip &> /dev/null
then
    echo "Please install pbcopy (macOS) or xclip (Linux) to use this script."
    exit 1
fi

# Function to copy to clipboard
copy_to_clipboard() {
    if command -v pbcopy &> /dev/null; then
        echo "$1" | pbcopy
    elif command -v xclip &> /dev/null; then
        echo "$1" | xclip -selection clipboard
    fi
}


copy_to_clipboard "$RECIPIENT_NAME"
```
