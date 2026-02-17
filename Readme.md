# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

# Запрос кол-ва сосикок проданных на предыдушей неделе

SELECT
    o.date_created, SUM(op.quantity)
FROM
    orders AS o
        JOIN order_product AS op ON o.id = op.order_id
WHERE
    o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY
    o.date_created;

# Выполнение запроса \timing

store=> SELECT
    o.date_created, SUM(op.quantity)
FROM
    orders AS o
        JOIN order_product AS op ON o.id = op.order_id
WHERE
    o.status = 'shipped' AND o.date_created > NOW() - INTERVAL '7 DAY'
GROUP BY
    o.date_created;
 2026-02-11   | 943073
 2026-02-12   | 946909
 2026-02-13   | 939424
 2026-02-14   | 935544
 2026-02-15   | 949566
 2026-02-16   | 946588
 2026-02-17   | 946806

Time: 34956.725 ms (00:34.957)
