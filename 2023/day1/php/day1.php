<?php declare(strict_types=1);

// part 1
echo array_reduce(
    array_map(
        fn (string $i) => intval(substr($i, 0, 1) . substr($i, -1)),
        preg_replace(
            "/[^\d]/",
            '',
            preg_split(
                pattern: "/\n/",
                subject: file_get_contents(__DIR__ . "/real.txt"),
                flags: PREG_SPLIT_NO_EMPTY
            )
        )
    ),
    fn (?int $a, ?int $b) => $a + $b
);

