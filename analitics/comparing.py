import pandas as pd
import os
from pathlib import Path

# Define paths
original_path = Path('storage/csv_data')
cleaned_path = Path('storage/cleaned_csv_data')

def count_null_values(df):
    """Count rows that contain at least one NULL value"""
    return df.isnull().any(axis=1).sum()

def compare_csv_files():
    # Get list of CSV files in both directories
    original_files = set(f.name.lower() for f in original_path.glob('*.csv'))
    cleaned_files = set(f.name.lower() for f in cleaned_path.glob('*.csv'))
    
    # Compare common files
    common_files = original_files.intersection(cleaned_files)
    print("\nComparison of common files:")
    print("-" * 80)
    print(f"{'File Name':<20} {'Original Rows':<15} {'Cleaned Rows':<15} {'Original Nulls':<15} {'Cleaned Nulls':<15}")
    print("-" * 80)
    
    for file in common_files:
        # Read original file
        orig_df = pd.read_csv(original_path / file, encoding='latin-1')
        # Read cleaned file
        clean_df = pd.read_csv(cleaned_path / file, delimiter=';')
        
        # Get statistics
        orig_rows = len(orig_df)
        clean_rows = len(clean_df)
        orig_nulls = count_null_values(orig_df)
        clean_nulls = count_null_values(clean_df)
        
        # Calculate differences
        rows_diff = clean_rows - orig_rows
        nulls_diff = clean_nulls - orig_nulls
        
        # Print comparison
        print(f"{file:<20} {orig_rows:<15} {clean_rows:<15} {orig_nulls:<15} {clean_nulls:<15}")
        
        if rows_diff != 0:
            print(f"  → Rows difference: {rows_diff:+d} rows in cleaned version")
        if nulls_diff != 0:
            print(f"  → Null rows difference: {nulls_diff:+d} rows with nulls in cleaned version")
        print()
        # Create a comparison summary DataFrame
        comparison_data = {
            'File Name': [file],
            'Original Rows': [orig_rows],
            'Cleaned Rows': [clean_rows], 
            'Original Nulls': [orig_nulls],
            'Cleaned Nulls': [clean_nulls],
            'Rows Difference': [rows_diff],
            'Nulls Difference': [nulls_diff]
        }
        comparison_df = pd.DataFrame(comparison_data)
        
        # Append to CSV if file exists, create new file if it doesn't
        comparison_file = 'analitics/comparison_results.csv'
        if Path(comparison_file).exists():
            comparison_df.to_csv(comparison_file, mode='a', header=False, index=False)
        else:
            comparison_df.to_csv(comparison_file, index=False)

        

if __name__ == "__main__":
    print("Comparing CSV files between original and cleaned data directories...")
    # Remove existing comparison results file if it exists
    comparison_file = 'analitics/comparison_results.csv'
    if Path(comparison_file).exists():
        Path(comparison_file).unlink()
    compare_csv_files()
