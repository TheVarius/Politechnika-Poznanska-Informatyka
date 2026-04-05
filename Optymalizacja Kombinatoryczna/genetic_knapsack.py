import json
import random
import os


class Item:
    def __init__(self, item_id, value, weight, packing_time):
        self.id = item_id
        self.value = value
        self.weight = weight
        self.packing_time = packing_time


def create_population(population_size, num_items):
    return [[random.random() < 0.1 for _ in range(num_items)] for _ in range(population_size)]


def fitness_score(genotype, items, max_weight, max_time):
    total_weight = 0
    total_time = 0
    total_value = 0

    for idx, gene in enumerate(genotype):
        if gene:
            total_weight += items[idx].weight
            total_time += items[idx].packing_time
            total_value += items[idx].value

    if total_weight > max_weight or total_time > max_time:
        return 0
    return total_value


def tournament_selection(population, items, max_weight, max_time, tournament_size=7):
    selected = []
    population = [genotype for genotype in population if fitness_score(genotype, items, max_weight, max_time) > 0]
    for _ in range(len(population)):
        if len(population) == 0:
            break
        tournament = random.sample(population, min(tournament_size, len(population)))
        tournament.sort(key=lambda x: fitness_score(x, items, max_weight, max_time), reverse=True)
        selected.append(tournament[0])
    return selected


def crossover(genotype1, genotype2):
    point = random.randint(1, len(genotype1) - 1)
    return genotype1[:point] + genotype2[point:]


def mutate(genotype, mutation_rate=0.005):
    new_genotype = genotype.copy()
    for i in range(len(genotype)):
        if random.random() < mutation_rate:
            new_genotype[i] = not genotype[i]
    return new_genotype


def next_generation(population, items, max_weight, max_time):
    new_population = []
    winners = tournament_selection(population, items, max_weight, max_time)
    best = max(winners, key=lambda x: fitness_score(x, items, max_weight, max_time))
    new_population.append(best)

    while len(new_population) < len(population):
        parent1 = random.choice(winners)
        parent2 = random.choice(winners)
        child = crossover(parent1, parent2)
        child = mutate(child)
        new_population.append(child)
    return new_population


def genetic_algorithm(items, max_weight, max_time, population_size=1000, generations=150):
    population = create_population(population_size, len(items))
    for _ in range(generations):
        population = next_generation(population, items, max_weight, max_time)
    best_genotpe = tournament_selection(population, items, max_weight, max_time)[0]
    total_value = fitness_score(best_genotpe, items, max_weight, max_time)
    print(total_value)


def main():
    with open(os.environ.get("CURRENT_JSON_FILE"), "r") as file:
        data = json.load(file)
    capacity = data["capacity"]
    max_packing_time = data["max_packing_time"]
    items_data = data["items"]
    items = [Item(item["id"], item["value"], item["weight"], item["packing_time"]) for item in items_data]
    genetic_algorithm(items, capacity, max_packing_time)


if __name__ == "__main__":
    main()