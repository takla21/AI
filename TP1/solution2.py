import numpy as np
import copy
from queue import Queue
import time 
import heapq

class Solution:
    def __init__(self, places, graph):
        """
        places: a list containing the indices of attractions to visit
        p1 = places[0]
        pm = places[-1]
        """
        self.g = 0 # current cost
        self.graph = graph 
        self.visited = [places[0]] # list of already visited attractions
        self.not_visited = copy.deepcopy(places[1:]) # list of attractions not yet visited
        print(self.not_visited)
        self.last = places[-1]
        self.best = None
        
    def add(self, idx):
        """
        Adds the point in position idx of not_visited list to the solution
        """
        place = self.not_visited[idx]
        self.not_visited = np.delete(self.not_visited, idx)
        self.visited.append(place)
        cur = 0
        cost = 0
        complete = False
        if len(self.not_visited) == 0:
            self.visited.append(self.last)
            complete = True

        for place_index in range(1,len(self.visited)):
            cost += graph[self.visited[cur]][self.visited[place_index]]
            cur = place_index


        self.g = cost
        return complete

def fastest_path_estimation(sol):
    """
    Returns the time spent on the fastest path between 
    the current vertex c and the ending vertex pm
    """
    c = sol.visited[-1]
    pm = sol.not_visited[-1]

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

def read_graph():
    return np.loadtxt("montreal", dtype='i', delimiter=',')


graph = read_graph()


