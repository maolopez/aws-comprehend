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

# Select the 1000 most frequent unique labels
top_labels = df['label'].value_counts().index[:1000]
df = df[df['label'].isin(top_labels)]

# Reorder columns to put label first
df = df[['label', 'text']]

# Save the updated CSV file with quoting to allow special characters
df.to_csv('updated_yourfile.csv', index=False, quoting=1, header=False)