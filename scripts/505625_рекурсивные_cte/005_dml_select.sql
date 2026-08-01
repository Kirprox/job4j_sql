WITH RECURSIVE catalog_tree AS (
    SELECT
        id,
        name,
        parent_id,
        1 AS level,
        name::text AS tree_path
    FROM folders
    WHERE id = 1

    UNION ALL

    SELECT
        f.id,
        f.name,
        f.parent_id,
	ct.level + 1,
	ct.tree_path || ' -> ' || f."name" 
    FROM folders AS f
    JOIN catalog_tree AS ct ON f.parent_id = ct.id
)

CYCLE id
SET is_cycle
USING cycle_path

SELECT
    repeat('    ',level - 1) || name AS folder_name,
    level
FROM catalog_tree
ORDER BY tree_path;