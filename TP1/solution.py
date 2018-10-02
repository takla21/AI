import numpy as np
import copy
from queue import Queue
import time 

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
        self.last = places[-1]
        self.best = None
        
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

        return complete


def read_graph():
    return np.loadtxt("montreal", dtype='i', delimiter=',')
    
def bfs(graph, places):
    """
    Returns the best solution which spans over all attractions indicated in 'places'
    """
    solution = Solution(places, graph)
    best_solution = None
    queue = Queue()
    queue.put(solution)
    while not queue.empty():
        cur = queue.get()
        for i in range(len(cur.not_visited)):
            new_solution = copy.deepcopy(cur)
            complete = new_solution.add(i)
            if complete and (best_solution is None or best_solution.g > new_solution.g):
                best_solution = new_solution

            queue.put(new_solution)

    return best_solution


graph = read_graph()

#test 1  --------------  OPT. SOL. = 27
start_time = time.time()
places=[0, 5, 13, 16, 6, 9, 4]
sol = bfs(graph=graph, places=places)
print(sol.g)
print("--- %s seconds ---" % (time.time() - start_time))

#test 2 -------------- OPT. SOL. = 30
start_time = time.time()
places=[0, 1, 4, 9, 20, 18, 16, 5, 13, 19]
sol = bfs(graph=graph, places=places)
print(sol.g)
print("--- %s seconds ---" % (time.time() - start_time))

#test 3 -------------- OPT. SOL. = 26
start_time = time.time()
places=[0, 2, 7, 13, 11, 16, 15, 7, 9, 8, 4]
sol = bfs(graph=graph, places=places)
print(sol.g)
print("--- %s seconds ---" % (time.time() - start_time))
