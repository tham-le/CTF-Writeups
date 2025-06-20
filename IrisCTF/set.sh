#!/bin/bash

# ==============================================================================
# CTF Write-up Directory Structure Generator
# ==============================================================================
#
# This script creates a directory structure for your CTF write-ups.
# It uses two data blocks:
#   1. SOLVED_CHALLENGES: A list of the challenges you solved.
#   2. ALL_CHALLENGES_INFO: A table with metadata for all challenges.
#
# The script will only create folders for the challenges listed in
# SOLVED_CHALLENGES.
#

# --- Configuration ---
# Name of the root folder for this CTF.
CTF_NAME="MyCTF_Writeups"

# --- Data Section ---

# Paste the list of challenges you solved here.
read -r -d '' SOLVED_CHALLENGES <<'EOF'
Welcome
	Sanity Check (50 Points)
	4 Minutes, 46 Seconds after release (solver #72)
Welcome
	Discord (50 Points)
	3 Minutes, 48 Seconds after release (solver #85)
Welcome
	Exit Survey (50 Points)
	6 Hours, 6 Minutes after release (solver #137)
Binary Exploitation
	sqlate (50 Points)
	1 Day, 12 Hours after release (solver #152)
Cryptography
	KittyCrypt (50 Points)
	1 Day, 13 Hours after release (solver #175)
Forensics
	Tracem 1 (152 Points)
	1 Day, 14 Hours after release (solver #77)
Forensics
	deldeldel (50 Points)
	18 Hours, 52 Minutes after release (solver #172)
Open-Source Intelligence
	Checking Out of Winter (50 Points)
	17 Hours, 40 Minutes after release (solver #255)
Open-Source Intelligence
	Sleuths and Sweets (50 Points)
	14 Hours, 39 Minutes after release (solver #141)
Open-Source Intelligence
	Not Eelaborate (50 Points)
	15 Hours, 44 Minutes after release (solver #119)
Open-Source Intelligence
	Late Night Bite (50 Points)
	17 Hours, 57 Minutes after release (solver #59)
Open-Source Intelligence
	OSINT DISCLAIMER (50 Points)
	25 Minutes, 52 Seconds after release (solver #99)
Open-Source Intelligence
	where's bobby (247 Points)
	21 Hours, 33 Minutes after release (solver #54)
Open-Source Intelligence
	where's bobby 2 (50 Points)
	9 Hours, 0 Minutes after release (solver #43)
Web Exploitation
	Political (50 Points)
	21 Hours, 1 Minute after release (solver #96)
Web Exploitation
	Password Manager (50 Points)
	1 Hour, 52 Minutes after release (solver #61)
EOF

# Paste the table of all challenge info here.
# IMPORTANT: This script assumes the fields are separated by TABS.
# If they are separated by multiple spaces, you may need to adjust the AWK command.
read -r -d '' ALL_CHALLENGES_INFO <<'EOF'
Category	Challenge	Tags	Author	Points	Solves
Binary Exploitation	sqlate	easy	lambda	50	166
Binary Exploitation	Checksumz	medium, kernel	lambda	432	39
Binary Exploitation	MyFiles	medium	nope	442	36
Cryptography	AYES	easy, or not?	sera	448	34
Cryptography	KittyCrypt	easy, ?	User	50	200
Cryptography	knutsacque	medium	sera	316	64
Cryptography	SPHINCS5	hard	sera	500	1
Forensics	deldeldel	easy	skat	50	241
Forensics	Tracem 1	baby	skat	152	88
Forensics	Windy Day	medium	skat	424	41
Forensics	Tracem 2	medium	skat	457	31
Forensics	RIP Art	hard	skat	480	21
Miscellaneous	Cobra's Den	medium, jail	seal	50	116
Miscellaneous	O_WRONLY	easy, kernel	lambda	321	63
Miscellaneous	DΔς	medium	nope	494	12
Miscellaneous	warden	hard, jail	sera	499	4
Miscellaneous	prime5	hard	sera	500	0
Networks	No Shark?	baby	skat	50	194
Networks	Inferno Barrier	easy	skat	304	66
Networks	Shake My Hand	medium	skat	327	62
Networks	NetHog	hard	skat	500	3
Open-Source Intelligence	Checking Out of Winter	easy	Lychi	50	354
Open-Source Intelligence	Sleuths and Sweets	easy	Lychi	50	232
Open-Source Intelligence	Not Eelaborate	easy	Lychi	50	187
Open-Source Intelligence	fuel deal	medium	bobby	50	157
Open-Source Intelligence	Late Night Bite	medium	Lychi	50	116
Open-Source Intelligence	where's bobby 2	medium	bobby	50	104
Open-Source Intelligence	where's bobby	medium	bobby	247	75
Radio Frequency	dotdotdot	baby	skat	50	150
Radio Frequency	RFoIP	easy	skat	359	56
Radio Frequency	SineFM	medium	skat	470	26
Radio Frequency	Spicy Messaging Sinusoids	medium	skat	500	2
Reverse Engineering	Now this will run on my 486?	easy	nope	50	102
Reverse Engineering	Crispy Kelp	medium	User	401	47
Reverse Engineering	bunny jumper!	medium, bunny	nope	472	25
Reverse Engineering	rev lifetime	hard	sera	496	9
Reverse Engineering	???????? (to be added to repo)	medium, ??????	nope	498	7
Web Exploitation	Password Manager	baby	User	50	357
Web Exploitation	Political	easy	sera	50	152
Web Exploitation	Bad Todo	medium	Rph	247	75
Web Exploitation	webwebhookhook	medium	sera	488	16
EOF

# --- Main Script Logic ---

# Create the root directory for the CTF
mkdir -p "$CTF_NAME"
cd "$CTF_NAME" || exit

echo "CTF Root Directory '$CTF_NAME' created."
echo "------------------------------------------"

# Use awk to parse the list of solved challenges.
# It keeps track of the current category and extracts the challenge name.
echo "$SOLVED_CHALLENGES" | awk '
    # If a line does not start with a tab/space, it is a new category.
    /^[A-Z]/ {
        current_cat = $0
        # For multi-word categories like "Binary Exploitation"
        if (NF > 1) {
            current_cat = ""
            for (i=1; i<=NF; i++) {
                current_cat = current_cat (i==1 ? "" : " ") $i
            }
        }
    }
    # If a line contains "(... Points)", it is a challenge line.
    /\(.*\)/ {
        # Extract the challenge name by removing the points part.
        challenge_name = $0
        sub(/^[ \t]+/, "", challenge_name) # Remove leading whitespace
        sub(/ \(.*/, "", challenge_name)   # Remove " (XX Points)"
        print current_cat "\t" challenge_name
    }
' | while IFS=$'\t' read -r category challenge_name; do

    # Sanitize names for folder creation (replace spaces and special chars with _)
    sane_category=$(echo "$category" | sed 's/[^a-zA-Z0-9._-]/_/g')
    sane_challenge=$(echo "$challenge_name" | sed 's/[^a-zA-Z0-9._-]/_/g')

    # Find the corresponding line in the ALL_CHALLENGES_INFO data
    # We use awk for robust, tab-aware searching
    challenge_details=$(echo "$ALL_CHALLENGES_INFO" | awk -F'\t' -v cat="$category" -v chal="$challenge_name" '
        # Match category in first column and challenge name in second column
        $1 == cat && $2 == chal {
            # Print the details we need, separated by a pipe
            print $3 "|" $4 "|" $5 "|" $6
            exit # Stop after finding the match
        }
    ')

    if [ -z "$challenge_details" ]; then
        echo "WARNING: Could not find details for '$challenge_name' in category '$category'. Skipping."
        continue
    fi

    # Parse the details into variables
    IFS='|' read -r tags author points solves <<< "$challenge_details"

    # Create the directory structure
    echo "Creating structure for: [$sane_category] / [$sane_challenge]"
    mkdir -p "./$sane_category/$sane_challenge/resources"

    # Create the writeup.md file with a template
    cat > "./$sane_category/$sane_challenge/writeup.md" << EOF
# ${challenge_name}

| Category | Author | Tags | Points | Solves |
| :--- | :--- | :--- | :--- | :--- |
| ${category} | ${author} | ${tags} | ${points} | ${solves} |

---

## 📖 Description

> TODO: Add the challenge description here.

---

## 🕵️‍♂️ Analysis

My thought process and analysis of the challenge. What did I look at first? What were the dead ends?

---

## ⚙️ Solution

The step-by-step process to solve the challenge.

\`\`\`bash
# Step 1: Do the first thing
# Step 2: Do the second thing
# Step 3: Profit
\`\`\`

---

## 🏁 Flag

\`\`\`
flag{...}
\`\`\`
EOF

done

echo "------------------------------------------"
echo "✅ All done! Your write-up structure is ready in the '$CTF_NAME' folder."