# JSONHelpView

JSONHelpView allows developers to author user manuals for their apps using a simple JSON-based format.

The root level object in your JSON file should be an array. The first element of each array should be a string, which will serve as the title of that element. Subsequent elements can either be arrays or string arrays.

Items with an even number of parents will be presented as lists, with each of their immeadiate children forming a seciton. Subsequent lists further down in the hierarchy will receive navigation links.

As an example, the code of the file of an app using JSONHelpView  is provided below:

[
"Help",
["Settings",
    ["Registration: Divisions",
        ["Handicapping",
            "Regatta Score includes built in support for One Design, Portsmouth Yardstick, PHRF, IRC, and ORC PCS Handicapping",
            "Custom handicapping formulas are also possible, as long as corrected time (in seconds) is a function of elapsed time (in seconds), rating, and course length",
            "Don't forget to enter course and wind information when using ORC scoring"
        ],["Deleting a Division",
            "Go to the Registration Page",
            "Press the edit button",
            "Press the red circle next to the division you wish to delete",
            "Press 'Delete' to confirm deletion"
        ]
    ],
    ["Registration: Boats",
        ["Registration Info",
            "A boat's sail number is her primary identifier. Letters and Numbers are allowed",
            "Boat name is to identify the boat in the absence of a sail number. Unnamed boats are identified by skipper, then by crew, etc.",
            "Use of RRS Appendix G for country identificaiton is strongly encouraged (for regattas where this is improtant",
            "Country codes are required (and must conform to Appendix G) when using ORC Scoring, regardless of event level."
        ],["Primary and Alternate Ratings",
            "Each boat can be provided with Primary and Alternate Ratings",
            "When checking boats in, press the 'Ratings' Button to select which boats are using alternate ratings for that race",
            "Useful for races where boats have the option of competing using an NFS rating, among other uses",
            "Additional Ratings can be provided for use in Mirror Groups"
        ],["Rescoring Races",
            "To rescore several races, enter the new rating as the primary rating, and select the date range",
            "Races which start any time in the selected window, including both the start and end dates, will be rescoredy"
        ],["ORC PCS Scoring",
            "Enter the certificate number. All boats MUST have a valid certificate, which must be listed in the central ORC database",
            "ORC Certificate data will be downloaded and used (along with course information) to calculate corrected times"
        ],["Deleting a Boat",
            "Go to the division page for the boat",
            "Press the edit button",
            "Press the red circle next to the boat you wish to delete",
            "Press 'Delete' to confirm deletion",
            "Races will be rescored as if the boat was never there"
        ]
    ],["Scoring Group Types",
        ["Divisions",
            "Divisions are the most fundamental scoring type in Regatta Score",
            "Every boat is assigned to exactly one division",
            "All boats in the same division start together",
            "Races are scored only if one or more boats finish"
        ],["Overall Group",
            "An Overall Group is a collection of Divisions",
            "Divisions do not need to be in the same starting group",
            "Each boat is scored based the corrected times calculated calculated within her own division. See Mirror Group for other options"
        ],["Classification Group",
            "An Classification Group is a collection of boats, identified by their skippers",
            "Scored similarly to an overall group, except that individual boats are selected instead of entire divisions",
            "Great if your event has a womens/juniors/masters award, among other uses",
            "Note that Classification Groups identify boats based on skipper name"
        ],["Mirror Group",
            "A Mirror Group rescores another scoring group under a different handicap system",
            "Mirror Groups can be created for Divisions, Overall Groups, and Classificaiton Groups",
            "While other scoring groups use the primary/alternate ratings for each boat, Mirror Groups use the ratings table found under 'Additional Ratings'",
            "Boats without an appropriate entry in the ratings table are omitted from the Mirror Group"
        ]
    ],["Start/Finish Settings",
       ["Basic Start Settings",
            "Select the duration of your start sequence",
            "Select the flag for the prepatory signal. If Z, U, or Black flag is selected, penalties will be automatically calculated according to RRS 30.2, 30.3, and 30.4",
            "Set the desired number of starting groups"
        ],["Automatic Starts",
            "When this setting is enabled, you will be presented with an option to select the time for your first warning signal",
            "Each group's starting signal will simultaneously be the next group's warning signal "
        ],["Finish Settings",
            "Significant Digits: sort sail numbers by the last N digits, where N is the smallest number required to distinguish boats",
            "Time Limit: if no boat finishes within this time limit, an alert will be presented with an option to abandon the race",
            "Finishing Window: the amount of time a boat has to finish once the first boat in her division finishes. Once this window passes, an alert will be presented with an option to score all remaining boats in that division TLE"
        ]
    ],[ "Scoring Settings",
        ["About Scoring Offsets",
            "'Did Not Finish' adjusts the score for boats which did not finish (DNF), did not sail the course (NSC), or retired (RET)",
            "'Did Not Start'  adjusts the score for boats which were did not start (DNS, OCS) or were disqualified (UFD, BFD, DSQ, DNE), but still came to the starting area.",
            "To assign a point value, select the reference point to be the number of boats finishing, checked in, or registered. Then use the stepper tool to adjust the score relative to the chosen offset",
            "'Checked In' is calculated as any boat with any scoring code other than DNC or AVG",
            "Note that these settings will be the same for all divisions"
        ]
    ]
],["Scoring Races",
    ["Checkin",
        ["Checking Boats In and Out",
            "From the main Regatta page, tap the 'Checkin' Button",
            "A list of boats not checked in will appear at the top",
            "After the list of boats not checked in, boats already checked in will be listed by division.",
            "Tap on a boat in one of the above lists to check in / out"
        ],["Using Alternate Ratings",
            "Enter alternate ratings for each boat on the registration page",
            "From the main Regatta page, tap the 'Checkin' Button",
            "Tap the 'Ratings' Button in the top corner",
            "Select the boats using alternate ratings. The currently used rating will be displayed along with the sail number"
        ]
    ], ["Starting and Finishing Races",
        ["Managing the Sequence",
            "Before a warning singal, press the 'start' button",
            "A list of starting groups will be presented",
            "At the warning signal, select the group you wish to start",
            "If any of the selected divisions are currently racing, this will end their current race",
            "During the sequence, the start button is replaced with an 'AP' button, which allows you to cancel the sequence"
        ],["Calling the Start Line",
            "If boats are on the course side or in the triangle, tap on their sail number to mark them as such. That boat's square sill turn orange",
            "Penalties aren't applied until the starting signal, so if you make a mistake, just tap the boat again to remove the marking",
            "Boats can also be marked as OCS during the first four minutes after their start",
            "Boats can also be marked as OCS during the first four minutes after their start",
            "In the event of a general recall, press the 'recall' button to cancel the previous start."
        ],["Finishing Boats",
            "Tap the 'Finish' Button to record the current time. The button will also display the current number of unassigned finish times",
            "Tap a boat's number to finish her with the earliest unassigned finish time",
            "If at least four minutes have passed since her start and there are no unassigned finish times, a boat can be finished without tapping the finish button",
            "If a boat has already finished, tap her sail number to mark her as displaying a flag. Tap again to remove the flag"
        ],["Using Voice Control"
            "Voice Control is currently provided by the iOS Accessibility API",
            "In the 'Settings' App, find accessibility settings",
            "Turn on 'Voice Control' and configure to your liking",
            "Most buttons can be tapped by saying 'Tap <Button Name>'",
            "The finish button is named 'Finish' even if a number is also displayed",
            "Be advised that voice control may encounter difficulty on windy days"
        ],["Abandoning a racce",
            "Tap the abandon button",
            "Select the starting group you wish to abandon"
        ]
    ], ["Fixing Mistakes",
        ["",
            "Tap the button labelled 'Edit' or 'Race Results'",
            "To change the start time or course length, adjust the value shown at the top of each divison",
            "Select the boat you wish to edit results for",
            "Finish times may be entered as HHMMSS or HH:MM:SS"
        ]
    ], ["Entering Results Manually",
        ["Entering a race manually",
            "In settings, select a 5 second start sequence",
            "Start the race you wish to score",
            "Tap the button labelled 'Edit' or 'Race Results'",
            "Select each boat and enter the results for that boat"
        ],["Editing results for a preivious race",
            "Tap the 'Series' or 'Series Results' button",
            "Tap the 'Edit' or 'Edit Races' button",
            "Select the race you wish to edit",
            "Edit results accordingly"
        ],["Redress Options",
            "Manual: gives a boat a specified place. Other boats' scores are not adjusted",
            "Average (all races): average score of all races. Other boats' scores are not adjusted",
            "Average (prior races): average score of all races prior to the selected race. Other boats' scores are not adjusted",
            "Time Edited: Use this option to display the RDG scoring code when you have edited a finish time in response to a redress hearing. Other boats scores ARE adjusted."
        ]
    ]
]
]


