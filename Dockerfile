# Local test-runner image for pensoft/task-dispatcher.
# Defaults to PHP 8.3 — the version Laravel 13 requires.
# Override with:  docker build --build-arg PHP_VERSION=8.4 .
ARG PHP_VERSION=8.3
FROM php:${PHP_VERSION}-cli

# PHP extensions the suite needs:
#   sockets, bcmath -> required by php-amqplib (RabbitMQ transport + delivery tags)
#   pcntl           -> queue consumer signal handling
#   zip             -> Composer dist installs
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions \
    && install-php-extensions sockets bcmath pcntl zip

# Composer (copied from the official image)
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app
CMD ["bash"]
