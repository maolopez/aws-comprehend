import pandas as pd

# Load the CSV file
df = pd.read_csv('./app/Train.csv')

# Check if the CSV file has exactly two columns
if len(df.columns) != 2:
    print("The CSV file should have exactly two columns.")
    exit()

# Rename the columns to 'text' and 'label'
df.columns = ['text', 'label']

# Ensure the 'label' column is numeric
df['label'] = pd.to_numeric(df['label'], errors='coerce')

# Drop any rows with missing or non-numeric labels
df = df.dropna(subset=['label'])

# Drop rows where the length of 'text' is over 5000 characters
df = df[df['text'].apply(lambda x: len(str(x)) <= 5000)]

# Save the updated CSV file with quoting to allow special characters
with open('updated_yourfile.csv', 'w') as f:
    f.write('"text","label"\n')
df.to_csv('updated_yourfile.csv', mode='a', index=False, quoting=1, header=False)