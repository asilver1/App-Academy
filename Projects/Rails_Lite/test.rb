def sudoku2(grid)
    #check rows
    for i in 0..(grid.length-1)
        a=Array.new
        for j in 0..(grid[0].length-1)
            if grid[i][j]=="."
              next
            end

            if !a.include?(grid[i][j])
                a.push(grid[i][j])
            else
                return false
            end
        end
    end
    #check cols
    for j in 0..(grid[0].length-1)
        a=Array.new
        for i in 0..(grid.length-1)
            if grid[i][j]=="."
              next
            end

            if !a.include?(grid[i][j])
                a.push(grid[i][j])
            else
                return false
            end
        end
    end
    [[0,0],[3,0],[6,0],[0,3],[3,3],[6,3],[0,6],[3,6],[6,6]].each do |startpoint|
        start_i=startpoint[0]
        print startpoint
        start_j=startpoint[1]
        a=Array.new
        for i in start_i..(start_i+2)
            for j in start_j..(start_j+2)
                if grid[i][j]=="."
                  next
                end
                if !a.include?(grid[i][j])
                    a.push(grid[i][j])
                else
                    return false
                end
            end
        end
    end
    return true
end
print sudoku2([[".",".",".","1","4",".",".","2","."],
 [".",".","6",".",".",".",".",".","."],
 [".",".",".",".",".",".",".",".","."],
 [".",".","1",".",".",".",".",".","."],
 [".","6","7",".",".",".",".",".","9"],
 [".",".",".",".",".",".","8","1","."],
 [".","3",".",".",".",".",".",".","6"],
 [".",".",".",".",".","7",".",".","."],
 [".",".",".","5",".",".",".","7","."]])
