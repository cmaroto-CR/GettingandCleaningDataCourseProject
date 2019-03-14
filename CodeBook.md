CodeBook
================

Source Data
----------------

The source data is downloaded as a compressed file, then stored as ./data/UCI_HAR_Dataset.zip

Once uncompressed, a folder structure with the input data is available at ./data/UCI HAR Dataset/

Output Data
--------------

Two files are produced by the script:

* ./data/tidydata/merged_data.csv: Contains all observations for for every subject and activity combination

* ./data/tidydata/avg_merged_data.csv: Summarizes all observations by calculating the average for each variable grouped by subject and activity (6 activities per each of the 30 subjects)
