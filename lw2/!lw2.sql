USE rental;


INSERT
  INTO
    object
  (owner_id, name, category_id)
  SELECT
      owner_id, name, category_id
    FROM
      object
    WHERE
      id = 1;



INSERT
  INTO
    object
  (owner_id, name, category_id)
VALUES
  (1, 'AR15', 1);



#####################################
SELECT
  COUNT(id)
FROM
  object;



SELECT
  name
FROM
  object
WHERE
  owner_id = 1;



#####################################
# delete all guns
DELETE
FROM
  object
WHERE
  category_id = 1;



DELETE
FROM
  black_list
WHERE
  bad_human_id = 2;



#####################################
UPDATE
  limitation
SET
  label = '23+'
WHERE
  label = '21+';



UPDATE
  object
SET
  name = 'Magnum Smith & Wesson 500'
WHERE
  name = 'Magnum 500';


#####################################
  SELECT
    human_id
  FROM
    owner
UNION ALL
  SELECT
    human_id
  FROM
    customer;



  SELECT
    human_id
  FROM
    owner
UNION DISTINCT
  SELECT
    bad_human_id AS human_id
  FROM
    black_list;

  