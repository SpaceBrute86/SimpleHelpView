# JSONHelpView

JSONHelpView allows developers to author user manuals for their apps using a simple JSON-based format.

The root level object in your JSON file should be an array. The first element of each array should be a string, which will serve as the title of that element. Subsequent elements can either be arrays or string arrays.

Items with an even number of parents will be presented as lists, with each of their immeadiate children forming a seciton. Subsequent lists further down in the hierarchy will receive navigation links.

As an example, the code of the file of an app using JSONHelpView  is provided in Sample.json
