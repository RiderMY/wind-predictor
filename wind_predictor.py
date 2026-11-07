import sys
import os
import pandas as pd

# Check number of arguments
if len(sys.argv) != 2:
    print('Usage: python3 wind_predictor.py [wind_data.csv]')
    sys.exit()

# Check that CSV file exists as CSV file
if not os.path.isfile(sys.argv[1]):
    print(f'Error: file {sys.argv[1]} does not exist!')
    sys.exit()
if os.path.splitext(sys.argv[1])[1].lower() != '.csv':
    print(f'Error: file {sys.argv[1]} is not a CSV file!')
    sys.exit()

# Load CSV file with pandas
df = pd.read_csv(sys.argv[1])

# TEST: Print out first 5 entries of CSV file
print(df.head())
