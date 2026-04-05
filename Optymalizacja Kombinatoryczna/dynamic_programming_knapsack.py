import json
import os
class Item:
    def __init__(self, item_id, value, weight, packing_time):
        self.id = item_id
        self.value = value
        self.weight = weight
        self.packing_time = packing_time

def knapsack_dynamic(items, max_weight, max_time):
    n = len(items)
    dp = [[[0 for _ in range(max_time + 1)] for _ in range(max_weight + 1)] for _ in range(n + 1)]
    chosen_items = [[[[] for _ in range(max_time + 1)] for _ in range(max_weight + 1)] for _ in range(n + 1)]

    for i in range(1, n + 1):
        item = items[i - 1]
        for w in range(max_weight + 1):
            for t in range(max_time + 1):
                if item.weight <= w and item.packing_time <= t:
                    value_with_item = dp[i - 1][w - item.weight][t - item.packing_time] + item.value
                    value_without_item = dp[i - 1][w][t]
                    if value_with_item > value_without_item:
                        dp[i][w][t] = value_with_item
                        chosen_items[i][w][t] = chosen_items[i - 1][w - item.weight][t - item.packing_time] + [item]
                    else:
                        dp[i][w][t] = value_without_item
                        chosen_items[i][w][t] = chosen_items[i - 1][w][t]
                else:
                    dp[i][w][t] = dp[i - 1][w][t]
                    chosen_items[i][w][t] = chosen_items[i - 1][w][t]

    best_value = dp[n][max_weight][max_time]
    best_items = chosen_items[n][max_weight][max_time]
    print(best_value)


def main():
    with open(os.environ.get("CURRENT_JSON_FILE"), "r") as file:
        data = json.load(file)
    capacity = data["capacity"]
    max_packing_time = data["max_packing_time"]
    items_data = data["items"]
    items = [Item(item["id"], item["value"], item["weight"], item["packing_time"]) for item in items_data]
    knapsack_dynamic(items, capacity, max_packing_time)

if __name__ == "__main__":
    main()
