-- Query 1: Figure out whether each node is a Root, Inner, or Leaf node.
SELECT DISTINCT t1.N,
    CASE
    WHEN t1.P IS NOT NULL AND child.N IS NULL THEN 'Leaf'
    WHEN t1.P IS NOT NULL AND child.N IS NOT NULL THEN 'Inner'
    ELSE 'Root'
    END AS n_type
FROM BST t1
LEFT JOIN BST child ON child.P = t1.N
ORDER BY t1.N ASC

/*
Algorithm Breakdown:

    1. LEFT JOIN (self) for child nodes. 
        - Parent nodes are already provided, so ignore them.
        - I used LEFT JOIN here since not all nodes will have children.
        - In other words, return me all nodes and their children if applicable.
    2. Use following logic in CASE statement:
        - Root: No parent, children optional
        - Inner: Yes parent, yes children
        - Leaf: Yes parent, no children
    3. Return with distinct node identifier, sort by identifier in ascending
*/