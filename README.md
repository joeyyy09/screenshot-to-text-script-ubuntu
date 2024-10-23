
# Screenshot to Text Converter

This script monitors a specific directory (e.g., `~/Pictures/Screenshots`) for new screenshots (PNG files) and automatically converts them to text using **Tesseract OCR**.

## Prerequisites

Ensure that the following tools are installed on your Linux system:

1. **Tesseract OCR** – an open-source Optical Character Recognition (OCR) engine.
2. **inotify-tools** – a command-line tool to monitor filesystem events.

### Install Dependencies

To install the required packages, run:

```bash
sudo apt update
sudo apt install tesseract-ocr inotify-tools
```

## How to Use

### 1. Clone the repository or download the script.

```bash
git clone https://github.com/your-repository/screenshot-to-text.git
cd screenshot-to-text
```

### 2. Modify the Script (Optional)

By default, the script monitors the `~/Pictures/Screenshots` directory. If your screenshots are saved elsewhere, edit the script:

```bash
nano convert_screenshot_to_text.sh
```

Change the `WATCH_DIR` variable to your preferred directory.

### 3. Make the Script Executable

```bash
chmod +x convert_screenshot_to_text.sh
```

### 4. Run the Script

You can run the script manually or in the background:

```bash
./convert_screenshot_to_text.sh &
```

This will start monitoring the screenshot directory and automatically convert any new `.png` screenshots to text files.

### 5. Optional: Automatically Run on Startup

If you want the script to run automatically when you log in, you can add it to your **Startup Applications**:

1. Open **Startup Applications** from your system's menu.
2. Add a new entry with the following command:
   ```bash
   /path/to/your/script/convert_screenshot_to_text.sh
   ```

This will ensure the script runs on boot and starts monitoring your screenshot directory automatically.

## Output

After a screenshot is saved in the watched directory, the script will use Tesseract to convert the image into a text file. The text file will be saved in the same directory with the following naming format:

```
<filename>_output.txt
```

For example, if the screenshot is named `screenshot1.png`, the text file will be saved as `screenshot1_output.txt`.
