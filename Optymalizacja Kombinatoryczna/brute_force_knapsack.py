import json
from itertools import combinations
import os
class Item:
    def __init__(self, item_id, value, weight, packing_time):
        self.id = item_id
        self.value = value
        self.weight = weight
        self.packing_time = packing_time
def knapsack_brute_force(items, max_weight, max_time):
    n = len(items)
    max_value = 0
    best_subset = []

    for r in range(1, n + 1):
        for subset in combinations(items, r):
            total_value = sum(item.value for item in subset)
            total_weight = sum(item.weight for item in subset)
            total_time = sum(item.packing_time for item in subset)

            if total_weight <= max_weight and total_time <= max_time and total_value > max_value:
                max_value = total_value
                best_subset = subset

    print(f"Najlepsza wartość: {max_value}")
    for item in best_subset:
        print(f"  ID: {item.id}, Wartość: {item.value}, Waga: {item.weight}, Czas pakowania: {item.packing_time}")


def main():
    with open(os.environ.get("CURRENT_JSON_FILE"), "r") as file:
        data = json.load(file)

    capacity = data["capacity"]
    max_packing_time = data["max_packing_time"]
    items_data = data["items"]
    items = [Item(item["id"], item["value"], item["weight"], item["packing_time"]) for item in items_data]

    knapsack_brute_force(items, capacity, max_packing_time)


if __name__ == "__main__":
    main()