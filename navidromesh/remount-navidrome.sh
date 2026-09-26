#!/bin/bash

# ============================================================
# Navidrome USB Music SSD Recovery Script
# ============================================================
#
# Mounts the external music SSD and reconnects it to Navidrome.
#
# SSD:          /dev/sdb1
# Mount point:  /mnt/music-ssd
# Music:        /mnt/music-ssd/Media Time Capsule
# Docker stack: /srv/stacks/navidrome
#
# ============================================================

echo ""
echo "============================================================"
echo " Navidrome USB Music SSD Recovery"
echo "============================================================"

# ------------------------------------------------------------
# 1. Make sure the SSD mount point exists
# ------------------------------------------------------------
echo ""
echo "=== 1. Preparing the SSD mount point ==="

sudo mkdir -p /mnt/music-ssd

if [ $? -ne 0 ]; then
    echo "ERROR: Could not create /mnt/music-ssd."
    exit 1
fi

echo "Mount point is ready."

# ------------------------------------------------------------
# 2. Mount the USB SSD
# ------------------------------------------------------------
echo ""
echo "=== 2. Mounting the USB music SSD ==="

if findmnt /mnt/music-ssd > /dev/null; then
    echo "The SSD is already mounted."
else
    echo "Mounting /dev/sdb1..."

    sudo mount /dev/sdb1 /mnt/music-ssd

    if [ $? -ne 0 ]; then
        echo "ERROR: Could not mount /dev/sdb1."
        exit 1
    fi

    echo "SSD mounted successfully."
fi

# ------------------------------------------------------------
# 3. Verify the SSD mount
# ------------------------------------------------------------
echo ""
echo "=== 3. Verifying the SSD mount ==="

if ! findmnt /mnt/music-ssd > /dev/null; then
    echo "ERROR: /mnt/music-ssd is not mounted."
    exit 1
fi

echo "SSD mount confirmed."

# ------------------------------------------------------------
# 4. Check that the music library exists
# ------------------------------------------------------------
echo ""
echo "=== 4. Checking the music library ==="

MUSIC_PATH="/mnt/music-ssd/Media Time Capsule"

if [ ! -d "$MUSIC_PATH" ]; then
    echo "ERROR: Music library not found:"
    echo "$MUSIC_PATH"
    exit 1
fi

echo "Music library found."
echo ""
echo "Music folders:"
ls -lah "$MUSIC_PATH"

# ------------------------------------------------------------
# 5. Move into the Navidrome Docker Compose directory
# ------------------------------------------------------------
echo ""
echo "=== 5. Opening the Navidrome Docker directory ==="

cd /srv/stacks/navidrome || {
    echo "ERROR: Could not access /srv/stacks/navidrome."
    exit 1
}

echo "Current directory:"
pwd

# ------------------------------------------------------------
# 6. Restart Navidrome
# ------------------------------------------------------------
echo ""
echo "=== 6. Restarting Navidrome ==="

echo "Stopping Navidrome..."
sudo docker compose down

if [ $? -ne 0 ]; then
    echo "ERROR: Docker Compose could not stop Navidrome."
    exit 1
fi

echo "Starting Navidrome..."
sudo docker compose up -d

if [ $? -ne 0 ]; then
    echo "ERROR: Docker Compose could not start Navidrome."
    exit 1
fi

echo "Navidrome started."

# ------------------------------------------------------------
# 7. Give Navidrome a moment to start
# ------------------------------------------------------------
echo ""
echo "=== 7. Waiting for Navidrome ==="

sleep 3

# ------------------------------------------------------------
# 8. Verify that Navidrome can see the music
# ------------------------------------------------------------
echo ""
echo "=== 8. Checking Navidrome's /music directory ==="

if ! sudo docker exec navidrome ls -lah /music; then
    echo "ERROR: Navidrome cannot access /music."
    exit 1
fi

# ------------------------------------------------------------
# Finished
# ------------------------------------------------------------
echo ""
echo "============================================================"
echo " SUCCESS!"
echo "============================================================"
echo ""
echo "The SSD is mounted and Navidrome can access the music."
echo ""
echo "SSD:        /dev/sdb1"
echo "Mount:      /mnt/music-ssd"
echo "Music:      /mnt/music-ssd/Media Time Capsule"
echo "Container:  navidrome"
echo "Music path: /music"
echo ""
