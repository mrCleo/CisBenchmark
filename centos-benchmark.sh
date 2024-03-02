#!/bin/bash

# Function to run audit for a specific issue
run_audit() {
    local issue=$1
    local desc=$2
    local mark=$3
    local section=$4
    local pass

    # Determine which section the issue belongs to
    local total_marks="total_marks_$section"
    local total_unmarks="total_unmarks_$section"
    local marks_score="marks_${section}_score"
    local unmarks_score="unmarks_${section}_score"

    # Update total marks and unmarks based on mark status
    if [[ $mark == marked* ]]; then
        ((total_marks++))
    elif [[ $mark == unmarked* ]]; then
        ((total_unmarks++))
    fi

    # Run the audit check and update scores
    if [[ -f issues/$issue.sh ]]; then
        if sh ./issues/$issue.sh > /dev/null 2>/dev/null; then
            pass="PASS"
            ((marks_score++))
        else
            pass="FAIL"
            ((unmarks_score++))
        fi
    else
        pass="SKIPPED/UNAVAILABLE"
    fi

    # Display the audit result
    echo "$issue $desc $pass"
    
    # Update the total marks and unmarks for the section
    eval "$total_marks=$total_marks"
    eval "$total_unmarks=$total_unmarks"
    eval "$marks_score=$marks_score"
    eval "$unmarks_score=$unmarks_score"
}

# Clear variables
clear_variables() {
    for var in total_marks total_unmarks marks_score unmarks_score; do
        for section in initial services network logging access system; do
            eval "${var}_${section}=0"
        done
    done
}

# Run audits
run_audits() {
    run_audit 5.1.1 "Ensure cron daemon is enabled (Scored)" marked5 initial
    run_audit 5.1.2 "Ensure permissions on /etc/crontab are configured (Scored)" marked5 initial
    # Add more audits here...
}

# Display results
display_results() {
    echo "==============================================="
    echo "Marks for Initial Setup"
    echo "-----------------------------------------------"
    echo "Scored: $marks_initial_score/$total_marks_initial"
    echo "Unscored: $unmarks_initial_score/$total_unmarks_initial"

    # Display results for other sections...
}

# Main function
main() {
    clear_variables
    run_audits
    display_results
}

# Run the script
main
