## Grayce Member-CarePartner Assessment
### Overview

This Ruby application matches members to care partners based on various criteria, including timezone compatibility, specialty needs, and workload balancing. It is designed to facilitate the initial connection between caregivers and care partners within the Grayce platform, ensuring that members receive the appropriate support for their specific use cases.

### Features

Reads member and care partner data from API's.
Matches members to care partners based on predefined criteria.
Outputs the matches to a JSON file for further processing.

### Prerequisites/Requirments
- Ruby 3.2

### Setup

- Clone this repository or downoad the zip to your local machine.
- Ensure Ruby is installed on your system.
- You can check your Ruby version by running `ruby -v` in your terminal.

### Running the Application

To run the application, navigate to the project directory in your terminal and execute:

```
ruby main.rb

```
The script will process the input files, match members to care partners, and output the results to `matches_output.json` in the project directory.

### Running Tests

This project uses MiniTest for its test suite. To run the tests, you will need to navigate to the project directory in your terminal. Then, you can execute the tests using the ruby command followed by the path to the test file you wish to run. If you wish to run all tests, you can use a command like this

```
ruby -Ilib:test -e 'ARGV.each { |f| require f }' ./test/*_test.rb

```

### Project Structure

- `matcher.rb`: Contains the matching logic implemented in the Matcher module.
- `json_loader.rb`: Module for reading json files.
- `main.rb`: The entry point of the application, orchestrating the reading of input data, the matching process, and the output of results.

### How It Works

- `Data Loading`: Member and care partner data are loaded from JSON files.
- `Matching Process`: Each member is matched to a care partner based on the criteria implemented in the Matcher module.
- `Output`: The matches are written to a JSON file, associating members with their respective care partners.
