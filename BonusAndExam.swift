//
//  BonusAndExam.swift
//
//  Created by Van
//  Created on 2024-03-15
//  Version 1.0
//  Copyright (c) 2024 Van Nguyen. All rights reserved.
//
//  Calculates a worker's bonus OR if a student can attend their exam

import Foundation

// Function to calculate salary bonus based on years of service
func salaryBonusCalculator(years: Float, salary: Float) -> Float {
	var salaryBonus: Float = -1

	// Check if years of service is more than 5
	if years > 5 {
		// Calculates bonus
		return salary * 0.05
	} else {
		// If not eligible for bonus, return -1
		return salaryBonus
	}
}

// Function to check if attendance percentage is greater than 75%
func examAttendance(classes: Float, classesAttended: Float) -> Bool {
	// Calculate attendance percentage
	let attendancePercentage = classesAttended / classes
	// Check if attendance percentage is greater than 75%
	return attendancePercentage > 0.75
}

// Initialize Variable
var userQuit = ""

// Loop until user quits
while userQuit != "quit" {
	// Asks user to pick which program
	print("Enter 1 to use the work bonus check program OR Enter 2 to use the exam program: ", terminator: "")

	// Gets user input
	if let programChoice = Float(readLine() ?? "") {
		// If user picks program 1
		switch programChoice {
			case 1:
				print("Enter your salary: ", terminator: "")
				// Checks for valid input
				guard let userSalary = Float(readLine() ?? ""), userSalary >= 0 else {
					print("You cannot enter negative numbers!")
					continue
				}
	
				// Gets years of work
				print("Enter the number of years you have worked here: ", terminator: "")
				// Ensures valid input
				guard let userYears = Float(readLine() ?? ""), userYears >= 0 else {
					print("You cannot enter negative numbers!")
					continue
				}
	
				// Calculate salary bonus (function call)
				let userBonus = salaryBonusCalculator(years: userYears, salary: userSalary)
	
				// Display result based on the bonus received
				if userBonus != -1 {
					print("You have earned a salary bonus because you have worked here for more than 5 years.")
					print("Your salary bonus is \(userBonus)$.")
				} else {
					print("You have not earned a salary bonus. You have not worked more than 5 years here.")
				}
	
			case 2:
				// Gets number of classes held
				print("Enter the number of classes held: ", terminator: "")
				// Ensures valid input
				guard let numClasses = Float(readLine() ?? ""), numClasses >= 0 else {
					print("You cannot enter negative numbers!")
					continue
				}
	
				// Gets number of classes attended
				print("Enter the number of classes attended: ", terminator: "")
				// Ensures valid input
				guard let numClassesAttended = Float(readLine() ?? ""), numClassesAttended >= 0 else {
					print("You cannot enter negative numbers!")
					continue
				}
	
				// Calls function to see if user can attend exam
				let userAttend = examAttendance(classes: numClasses, classesAttended: numClassesAttended)
	
				// Display result based on attendance percentage
				if userAttend {
					print("You can attend the exam.")
				} else {
					print("You cannot attend the exam.")
				}

		default:
			// Handling invalid input
			print("Invalid input.")
		}
	} else {
		// Handling invalid input
		print("Invalid input.")
	}

	// Ask user if they want to quit the program
	print("If you want to quit the program, type 'quit'. Otherwise, press any key to continue.")
	userQuit = readLine() ?? ""
}
