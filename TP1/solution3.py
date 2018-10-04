import numpy as np
import copy
from queue import Queue
import time
import heapq
import math
from random import shuffle, randint


class Solution:
    def __init__(self, graph, places):
        """
        places: a list containing the indices of attractions to visit
        p1 = places[0]
        pm = places[-1]
        """
        self.g = 0
        self.visited = None
        self.graph = graph
        self.first = [places[0]]  # list of already visited attractions
        self.center = copy.deepcopy(places[1:(len(places) -1)]) # list of attractions not yet visited
        self.last = [places[-1]]
        self.visited = self.first + self.center + self.last
        self.h = 0






def initial_sol(graph, places):
    return Solution(graph, places)

def dfs(sol):
    old_sol = sol.center
    new_sol = []

    while old_sol:
        index = randint(0, len(old_sol) - 1)
        new_sol.append(old_sol.pop(index))

    sol.center = new_sol


def shaking(sol, k):
    """
    Returns a solution on the k-th neighrboohood of sol
    """

def local_search_2opt(sol):
    """
    Apply 2-opt local search over sol
    """

def vns(sol, k_max, t_max):
    """
    Performs the VNS algorithm
    """

def read_graph():
    return np.loadtxt("montreal", dtype='i', delimiter=',')


graph = read_graph()


# test 1  --------------  OPT. SOL. = 27
places=[0, 5, 13, 16, 6, 9, 4]
sol = initial_sol(graph=graph, places=places)

print(sol.center)
print(sol.visited)
dfs(sol)
print(sol.center)



start_time = time.time()
vns_sol = vns(sol=sol, k_max=10, t_max=1)
print(vns_sol.g)
print(vns_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))

#test 2  --------------  OPT. SOL. = 30
places=[0, 1, 4, 9, 20, 18, 16, 5, 13, 19]
sol = initial_sol(graph=graph, places=places)

start_time = time.time()
vns_sol = vns(sol=sol, k_max=10, t_max=1)
print(vns_sol.g)
print(vns_sol.visited)

print("--- %s seconds ---" % (time.time() - start_time))

# test 3  --------------  OPT. SOL. = 26
places=[0, 2, 7, 13, 11, 16, 15, 7, 9, 8, 4]
sol = initial_sol(graph=graph, places=places)

start_time = time.time()
vns_sol = vns(sol=sol, k_max=10, t_max=1)
print(vns_sol.g)
print(vns_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))

# test 4  --------------  OPT. SOL. = 40
places=[0, 2, 20, 3, 18, 12, 13, 5, 11, 16, 15, 4, 9, 14, 1]
sol = initial_sol(graph=graph, places=places)

start_time = time.time()
vns_sol = vns(sol=sol, k_max=10, t_max=1)
print(vns_sol.g)
print(vns_sol.visited)
print("--- %s seconds ---" % (time.time() - start_time))