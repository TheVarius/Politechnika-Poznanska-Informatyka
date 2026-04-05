import json
import os
class Item:
    def __init__(self, item_id, value, weight, packing_time):
        self.id = item_id
        self.value = value
        self.weight = weight
        self.packing_time = packing_time

def greedy_knapsack(items, max_weight, max_time):
    items.sort(key=lambda item: item.value / (item.weight + item.packing_time), reverse=True)
    total_value = 0
    total_weight = 0
    total_time = 0
    selected_items = []

    for item in items:
        if total_weight + item.weight <= max_weight and total_time + item.packing_time <= max_time:
            selected_items.append(item)
            total_value += item.value
            total_weight += item.weight
            total_time += item.packing_time

    print(total_value)



def main():
    with open(os.environ.get("CURRENT_JSON_FILE"), "r") as file:
        data = json.load(file)

    capacity = data["capacity"]
    max_packing_time = data["max_packing_time"]
    items_data = data["items"]
    items = [Item(item["id"], item["value"], item["weight"], item["packing_time"]) for item in items_data]
    greedy_knapsack(items, capacity, max_packing_time)


if __name__ == "__main__":
    main()
