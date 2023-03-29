<?php

namespace VladimirYuldashev\LaravelQueueRabbitMQ\DTOs;

use Carbon\Carbon;
use Spatie\DataTransferObject\DataTransferObject;

class TaskData extends DataTransferObject
{
    public string $task_id;

    public string $status;

    public string $type;

    public Carbon $created_at;

    public ?Carbon $updated_at;

    public object|array|null $data;

    public static function create($data): self
    {
        return new self(
            task_id: $data['task_id'],
            status: $data['status'],
            type: $data['type'],
            created_at: $data['created_at']
        );
    }

    public static function update($oldData, $newData): self
    {
        return new self(...[...$oldData, ...$newData]);
    }

}
