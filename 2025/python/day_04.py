def part_one():
    with open("./input/day_04.txt") as input:
        grid = [line.rstrip('\n') for line in input]
    
    rows = len(grid)
    cols = len(grid[0]) if rows > 0 else 0
    accessible_count = 0
    directions = [(-1, 0),  (1, 0),  (0, 1),  (0, -1),  (-1, 1),  (-1, -1),  (1, 1),  (1, -1)]
    
    for i in range(rows):
        for j in range(cols):
            if grid[i][j] == '@':
                neighbor_count = 0
                for di, dj in directions:
                    ni, nj = i + di, j + dj
                    if (0 <= ni < rows and 0 <= nj < cols and grid[ni][nj] == '@'):
                        neighbor_count += 1
                
                if neighbor_count < 4:
                    accessible_count += 1
    
    return accessible_count

def part_two():
    with open("./input/day_04.txt") as input:
        grid = [list(line.rstrip('\n')) for line in input]

    rows = len(grid)
    cols = len(grid[0]) if rows > 0 else 0
    total_removed = 0
    
    directions = [(-1, 0),  (1, 0),  (0, 1),  (0, -1),  (-1, 1),  (-1, -1),  (1, 1),  (1, -1)]
    
    while True:
        accessible = []
        
        for i in range(rows):
            for j in range(cols):
                if grid[i][j] == '@':
                    neighbor_count = 0
                    for di, dj in directions:
                        ni, nj = i + di, j + dj
                        if (0 <= ni < rows and 0 <= nj < cols and grid[ni][nj] == '@'):
                            neighbor_count += 1
                    
                    if neighbor_count < 4:
                        accessible.append((i, j))
        
        if not accessible:
            break
        
        for i, j in accessible:
            grid[i][j] = '.'
        
        total_removed += len(accessible)
    
    return total_removed
    
print(f"part one ⭐: {part_one()}")
print(f"part two ⭐: {part_two()}")

