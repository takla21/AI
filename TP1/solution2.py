import numpy as np
import copy
from queue import Queue
import time
import heapq
import math


class Solution:
    def __init__(self, places, graph):
        """
        places: a list containing the indices of attractions to visit
        p1 = places[0]
        pm = places[-1]
        """
        self.g = 0  # current cost
        self.graph = graph
        self.visited = [places[0]]  # list of already visited attractions
        self.not_visited = copy.deepcopy(places[1:])  # list of attractions not yet visited
        self.last = places[-1]
        self.best = None
        self.h = 0;

    def add(self, idx):
        """
        Adds the point in position idx of not_visited list to the solution
        """
        place = self.not_visited[idx]
        old_place = self.visited[-1]
        self.not_visited = np.delete(self.not_visited, idx)
        self.visited.append(place)
        complete = False
        if len(self.not_visited) == 0:
            self.visited.append(self.last)
            self.g += graph[place][self.last]
            complete = True

        self.g += graph[old_place][place]

        self.h = fastest_path_estimation(self)
        return complete

    def __lt__(self, other):
        return (self.g + self.h) < (other.g + other.h)


def fastest_path_estimation(sol):
    """
    Returns the time spent on the fastest path betweenS
    the current vertex c and the ending vertex pm
    """
    c = sol.visited[-1]
    pm = copy.deepcopy(sol.not_visited)[-1]
    not_visited = copy.deepcopy(sol.not_visited)

    dist = {}

    for index in range(0, len(not_visited)):
        v = not_visited[index]
        dist[v] = math.inf

    dist[c] = 0
    n = 0
    while len(not_visited) > 0:
        c = not_visited[n]
        np.delete(not_visited, n)
        for index in range(0, len(not_visited)):
            v = not_visited[index]
            alt = dist[c] + sol.graph[c][v]
            if alt < dist[v]:
                dist[v] = alt
            if dist[c] > dist[v]:
                n = index
            if pm == v:
                return alt
    return None


def A_star(graph, places):
    """
    Performs the A* algorithm
    """

    # blank solution
    root = Solution(graph=graph, places=places)

    # search tree T
    T = []
    heapq.heapify(T)
    heapq.heappush(T, root)

    while len(T) > 0:
        cur = heapq.heappop(T)
        if len(cur.not_visited) <= 0:
            return cur
        for i in range(len(cur.not_visited)):
            new_solution = copy.deepcopy(cur)
            complete = new_solution.add(i)
            heapq.heappush(T, new_solution)

    return None


def read_graph():
    return np.loadtxt("montreal", dtype='i', delimiter=',')


graph = read_graph()

# test 1  --------------  OPT. SOL. = 27
start_time = time.time()
places = [0, 5, 13, 16, 6, 9, 4]
astar_sol = A_star(graph=graph, places=places)
print(astar_sol.g)
print(astar_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))

# test 2  --------------  OPT. SOL. = 30
start_time = time.time()
places = [0, 1, 4, 9, 20, 18, 16, 5, 13, 19]
astar_sol = A_star(graph=graph, places=places)
print(astar_sol.g)
print(astar_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))

# test 3  --------------  OPT. SOL. = 26
start_time = time.time()
places = [0, 2, 7, 13, 11, 16, 15, 7, 9, 8, 4]
astar_sol = A_star(graph=graph, places=places)
print(astar_sol.g)
print(astar_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))

# test 4  --------------  OPT. SOL. = 40
start_time = time.time()
places = [0, 2, 20, 3, 18, 12, 13, 5, 11, 16, 15, 4, 9, 14, 1]
astar_sol = A_star(graph=graph, places=places)
print(astar_sol.g)
print(astar_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))
