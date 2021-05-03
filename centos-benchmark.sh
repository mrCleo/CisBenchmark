#!/bin/bash

#Total issues for Initial Setup section of CIS Benchmark
total_marks_initial=0
total_unmarks_initial=0

#Total issues for Services section of CIS Benchmark
total_marks_services=0
total_unmarks_services=0

#Total issues for Network Configuration section of CIS Benchmark
total_marks_network=0
total_unmarks_network=0

#Total issues for Logging and Auditing section of CIS Benchmark
total_marks_logging=0
total_unmarks_logging=0

#Total issues for Access, Authentication and Authorization section of CIS Benchmark
total_marks_access=0
total_unmarks_access=0

#Total issues for System Maintenance section of CIS Benchmark
total_marks_system=0
total_unmarks_system=0

#Auditing score for Initial Setup section of CIS Benchmark
marks_initial_score=0
unmarks_initial_score=0

#Auditing score issues for Services section of CIS Benchmark
marks_services_score=0
unmarks_services_score=0

#Auditing score for Network Configuration section of CIS Benchmark
marks_network_score=0
unmarks_network_score=0

#Auditing score for Logging and Auditing section of CIS Benchmark
marks_logging_score=0
unmarks_logging_score=0

#Auditing score for Access, Authentication and Authorization section of CIS Benchmark
marks_access_score=0
unmarks_access_score=0

#Auditing score for System Maintenance section of CIS Benchmark
marks_system_score=0
unmarks_system_score=0

#Main function for auditing and scoring.

run_audit () {

	issue=$1
	desc=$2
	mark=$3
	pass=0

	#Determine which section the issue is located within the benchmark, 1 to 6, the function is called upon to audit
	#and tally total possible marks and separate scored/unscored
	if [[ $mark == unmarked1 ]];
		then
		((total_marks_initial+=1))
	fi
	if [[ $mark == unmarked1 ]];
		then
		((total_unmarks_initial+=1))
	fi

	if [[ $mark == marked2 ]];
		then
		((total_marks_services+=1))
	fi
	if [[ $mark == unmarked2 ]];
		then
		((total_unmarks_services+=1))
	fi
	if [[ $mark == marked3 ]];
		then
		((total_marks_network+=1))
	fi
	if [[ $mark == unmarked3 ]];
		then
		((total_unmarks_network+=1))
	fi
	if [[ $mark == marked4 ]];
		then
		((total_marks_logging+=1))
	fi
	if [[ $mark == unmarked4 ]];
		then
		((total_unmarks_logging+=1))
	fi
	if [[ $mark == marked5 ]];
		then
		((total_marks_access+=1))
	fi
	if [[ $mark == unmarked5 ]];
		then
		((total_unmarks_access+=1))
	fi
	if [[ $mark == marked6 ]];
		then
		((total_marks_system+=1))
	fi
	if [[ $mark == unmarked6 ]];
		then
		((total_unmarks_system+=1))
	fi
	if [[ $mark == unmarked7 ]];
                then
                ((total_unmarks_system+=1))
        fi


	
	#If the $issue.sh run does not return an exit code of 1, the relevant issue should be tagged as having PASS, else FAIL, if there is no relevant .sh, SKIPPED/UNAVAILABLE
	if [[ -f issues/$issue.sh ]]
		then
		sh ./issues/$issue.sh > /dev/null 2>/dev/null
		if [[ "$?" -ne 0 ]]
		then	
			pass=FAIL
		else
			pass=PASS
			
			#Add a +1 score for compliance to an issue of the benchmark, 
			#categorized on section and score/unscored
			if [[ $mark == marked1 ]];
				then
				((marks_initial_score+=1))
			fi
			if [[ $mark == unmarked1 ]];
				then
				((unmarks_initial_score+=1))
			fi
			if [[ $mark == marked2 ]];
				then
				((marks_services_score+=1))
			fi
			if [[ $mark == unmarked2 ]];
				then
				((unmarks_services_score+=1))
			fi
			if [[ $mark == marked3 ]];
				then
				((marks_network_score+=1))
			fi
			if [[ $mark == unmarked3 ]];
				then
				((unmarks_network_score+=1))
			fi
			if [[ $mark == marked4 ]];
				then
				((marks_logging_score+=1))
			fi
			if [[ $mark == unmarked4 ]];
				then
				((unmarks_logging_score+=1))
			fi
			if [[ $mark == marked5 ]];
				then
				((marks_access_score+=1))
			fi
			if [[ $mark == unmarked5 ]];
				then
				((unmarks_access_score+=1))
			fi
			if [[ $mark == marked6 ]];
				then
				((marks_system_score+=1))
			fi
			if [[ $mark == unmarked6 ]];
				then
				((unmarks_system_score+=1))
			fi
                        if [[ $mark == unmarked7 ]];
                                then
                                ((unmarks_system_score+=1))
                        fi
                        if [[ $mark == unmarked8 ]];
                                then
                                ((unmarks_system_score+=1))
                        fi
			
		fi
	else
		pass=SKIPPED/UNAVAILABLE		
	fi
	echo $issue $desc $pass
}
clear
run_audit 5.1.1 "Ensure cron daemon is enabled (Scored)" marked5
run_audit 5.1.2 "Ensure permissions on /etc/crontab are configured (Scored)" marked5
run_audit 5.1.3 "Ensure permissions on /etc/cron.hourly are configured (Scored)" marked5
run_audit 5.1.4 "Ensure permissions on /etc/cron.daily are configured (Scored)" marked5
run_audit 5.1.5 "Ensure permissions on /etc/cron.weekly are configured (Scored)" marked5
run_audit 5.1.6 "Ensure permissions on /etc/cron.monthly are configured (Scored)" marked5
run_audit 5.1.7 "Ensure permissions on /etc/cron.d are configured (Scored)" marked5
run_audit 5.1.8 "Ensure at/cron is restricted to authorized users (Scored) " marked5

run_audit 5.2.1 "Ensure permissions on /etc/ssh/sshd_config are configured
(Scored)" marked5
run_audit 5.2.2 "Ensure SSH access is limited (Scored)" marked5
run_audit 5.2.3 "Ensure permissions on SSH private host key files are
configured (Scored) " marked5
run_audit 5.2.4 "Ensure permissions on SSH public host key files are
configured (Scored)" marked5
run_audit 5.2.5 "Ensure SSH LogLevel is appropriate (Scored) " marked5
run_audit 5.2.6 "Ensure SSH X11 forwarding is disabled (Scored)" marked5
run_audit 5.2.7 "Ensure SSH MaxAuthTries is set to 4 or less (Scored)" marked5
run_audit 5.2.8 "Ensure SSH IgnoreRhosts is enabled (Scored)" marked5
run_audit 5.2.9 "Ensure SSH HostbasedAuthentication is disabled (Scored)" marked5
run_audit 5.2.10 "Ensure SSH root login is disabled (Scored)" marked5
run_audit 5.2.11 "Ensure SSH PermitEmptyPasswords is disabled (Scored)" marked5
run_audit 5.2.12 "Ensure SSH PermitUserEnvironment is disabled (Scored)" marked5
run_audit 5.2.13 "Ensure SSH Idle Timeout Interval is configured (Scored)" marked5
run_audit 5.2.14 "Ensure SSH LoginGraceTime is set to one minute or less
(Scored)" marked5
run_audit 5.2.15 "Ensure SSH warning banner is configured (Scored) " marked5
run_audit 5.2.16 "Ensure SSH PAM is enabled (Scored)" marked5
run_audit 5.2.17 "Ensure SSH AllowTcpForwarding is disabled (Scored)" marked5
run_audit 5.2.18 "Ensure SSH MaxStartups is configured (Scored)" marked5
run_audit 5.2.19 "Ensure SSH MaxSessions is set to 4 or less (Scored)" marked5
run_audit 5.2.20 "Ensure SSH MaxAuthTries is set to 4 or less (Scored)" marked5

run_audit 5.3.1 "Create custom authselect profile (Scored)" marked5
run_audit 5.3.2 "Select authselect profile (Scored)" marked5
run_audit 5.3.3 "Ensure authselect includes with-faillock (Scored)" marked5

run_audit 5.4.1 "Ensure password creation requirements are configured (Scored) " marked5
run_audit 5.4.2 "Ensure lockout for failed password attempts is configured (Scored) " marked5
run_audit 5.4.3 "Ensure password reuse is limited (Scored) " marked5
run_audit 5.4.4 "Ensure password hashing algorithm is SHA-512 (Scored) " marked5

run_audit 5.5.1.1 "Ensure password expiration is 365 days or less (Scored)" marked5
run_audit 5.5.1.2 "Ensure minimum days between password changes is 7 or
more (Scored) " marked5
run_audit 5.5.1.3 "Ensure password expiration warning days is 7 or more
(Scored) " marked5
run_audit 5.5.1.4 "Ensure inactive password lock is 30 days or less (Scored)" marked5
run_audit 5.5.1.5 "Ensure all users last password change date is in the past
(Scored)" marked5
run_audit 5.5.2 "Ensure system accounts are secured (Scored) " marked5
run_audit 5.5.3 "Ensure default user shell timeout is 900 seconds or less
(Scored)" marked5
run_audit 5.5.4 "Ensure default group for the root account is GID 0 (Scored)" marked5
run_audit 5.5.5 "Ensure default user umask is 027 or more restrictive
(Scored)" marked5
run_audit 5.6 "Ensure root login is restricted to system console (Not Scored)" marked5
run_audit 5.7 "run_audit 5.5.1.5 "marked5
echo ===============================================
echo ===============================================

echo "Marks for Initial Setup"
echo -----------------------------------------------
echo "Scored: $marks_initial_score/$total_marks_initial" 
echo "Unscored: $unmarks_initial_score/$total_unmarks_initial"

echo -----------------------------------------------
echo "Marks for Services"
echo "Scored: $marks_services_score/$total_unmarks_services"
echo "Unscored: $unmarks_services_score/$total_unmarks_services"

echo -----------------------------------------------
echo "Marks for Network Configuration" 
echo "Scored: $marks_network_score/$total_marks_network"
echo "Unscored: $unmarks_network_score/$total_unmarks_network" 

echo -----------------------------------------------
echo "Marks for Logging and Auditing"
echo "Scored: $marks_logging_score/$total_marks_logging" 
echo "Unscored: $unmarks_logging_score/$total_unmarks_logging"

echo -----------------------------------------------
echo "Marks for Access, Authentication and Authorization"
echo "Scored: $marks_access_score/$total_marks_access" 
echo "Unscored: $unmarks_access_score/$total_unmarks_access"

echo -----------------------------------------------
echo "Marks for System Maintenance"
echo "Scored: $marks_system_score/$total_marks_system"
echo "Unscored: $unmarks_system_score/$total_unmarks_system" 

echo -----------------------------------------------
