# DateTimezone

[![Build Status](https://travis-ci.org/shuhei/date_timezone.svg)](https://travis-ci.org/shuhei/date_timezone)

`DateTimezone` is an `ActiveRecord` concern that makes `date`-type attributes to convert `String` inputs to `Date` taking account of the application's timezone.

## Motivation

In JavaScript, sometimes we want to handle date as `Date` and send it to Rails application directly. JavaScript's `JSON.parse()` converts `Date` to an string in UTC ISO 8601 format.

```js
JSON.stringify({ date: new Date(2015, 2, 14) })
// "{"date":"2015-03-13T15:00:00.000Z"}"
```

So, that's what Rails application's controller receives and it is usually passed to `ActiveRecord` model directly. However, `ActiveRecord`'s `date`-type attribute doesn't take timezone into account when it converts the given `String` to `Date`.

```rb
class Application < Rails::Application
  config.time_zone = 'Tokyo'
end

class Person < ActiveRecord::Base
  # birth_date :date
end

expect(Person.new(birth_date: '2015-02-13T15:00:00.000Z').birth_date)
  .to eq(Date.new(2015, 2, 13))
```

`DateTimezone` concern overrides `date`-type attribute mutators in your `ActiveRecord` model to take timezone into account.

```rb
class Person < ActiveRecord::Base
  include DateTimezone
end

expect(Person.new(birth_date: '2015-02-13T15:00:00.000Z').birth_date)
  .to eq(Date.new(2015, 2, 14))
```
