<!DOCTYPE html>
<html lang="en">

<head>
    <title>Сайт находится в стадии разработки. Скоро будет доступен</title>
</head>
<style>
    * {
        box-sizing: border-box;

    }

    html {
        width: 100%;
    }

    body {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        text-align: center;
        background: url("<?php echo e(asset('front/images/construction-bg.png')); ?>") no-repeat center center/cover;
        color: #fff;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 4rem 2rem;
        gap: 1.5rem;
        min-height: 100dvh;
    }

    img {
        margin-top: auto;
    }

    h1 {
        font-size: clamp(2.5rem, 8vw, 4rem);
        margin: 0;
        text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.6);
    }

    p {
        font-size: clamp(1.7rem, 5vw, 1.6rem);
        margin: 0 0 clamp(1.5rem, 4vw, 2rem);
        text-shadow: 0 1px 4px rgba(0, 0, 0, 0.5);
        line-height: 1.6;
    }

    a {
        display: inline-block;
        background: linear-gradient(85.93deg, #4A51DD 0%, #4CB7AB 100%);
        color: #fff;
        padding: clamp(0.9rem, 2.5vw, 1.25rem) clamp(1.5rem, 5vw, 2.5rem);
        text-decoration: none;
        border-radius: 999px;
        font-size: clamp(1.75rem, 4vw, 2rem);
        font-weight: 600;
        transition: transform 0.15s ease, box-shadow 0.15s ease, opacity 0.15s ease;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.35);
        margin-bottom: auto;
    }

    a:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.45);
        opacity: 0.95;
    }

    a:active {
        transform: translateY(0);
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);
    }
</style>

<body>

    <img src="<?php echo e(asset('front/images/construction-main.png')); ?>" style="width: min(70vw, 60vh);"
        alt="Under Construction">
    <h1>Сайт находится в стадии разработки </h1>
    <p>Скоро будет доступен </p>
    <a href="https://proend.uz">Сайт разработчика</a>
</body>

</html><?php /**PATH /var/www/vatandoshlar_usr36/data/www/vatandoshlar.7z7.uz/resources/views/errors/503.blade.php ENDPATH**/ ?>