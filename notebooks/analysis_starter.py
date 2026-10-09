"""Starter exploratory analysis for the synthetic sales dataset."""
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parents[1]
data_path = ROOT / "data" / "sales_data.csv"
df = pd.read_csv(data_path, parse_dates=["OrderDate"])

print("Shape:", df.shape)
print("\nMissing values:\n", df.isna().sum())
print("\nDuplicate rows:", df.duplicated().sum())
print("\nKPI summary:")
print(df[["Sales", "Profit", "Quantity", "Discount"]].agg(["sum", "mean", "min", "max"]).round(2))

monthly = df.assign(Month=df["OrderDate"].dt.to_period("M").astype(str)).groupby("Month")[["Sales", "Profit"]].sum()
monthly.plot(kind="line", marker="o", figsize=(12, 5), title="Monthly Sales and Profit (Synthetic Data)")
plt.xlabel("Month")
plt.ylabel("Amount")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.show()

print("\nCategory summary:\n", df.groupby("Category")[["Sales", "Profit"]].sum().round(2))
print("\nDiscount summary:\n", df.groupby("Discount")[["Sales", "Profit"]].sum().round(2))
