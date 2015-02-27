require 'test_helper'

class DateTimezoneTest < ActiveSupport::TestCase
  test 'UTC ISO date time string assignment should work with timezone' do
    person = Person.new(name: 'Ruby', birth_date: '1995-12-20T15:00:00.000Z')
    assert_equal person.birth_date, Date.new(1995, 12, 21)
  end

  test 'ISO date time string with timezone assignment should work' do
    person = Person.new(name: 'Ruby', birth_date: '1995-12-21T00:00:00.000+0900')
    assert_equal person.birth_date, Date.new(1995, 12, 21)
  end

  test 'date string assignment should work' do
    person = Person.new(name: 'Ruby', birth_date: '1995-12-21')
    assert_equal person.birth_date, Date.new(1995, 12, 21)
  end

  test 'arbitrary string assignment should be nil' do
    person = Person.new(name: 'Ruby', birth_date: 'Ruby\'s birth date')
    assert_equal person.birth_date, nil
  end

  test 'date assignment should work' do
    person = Person.new(name: 'Ruby', birth_date: Date.new(1995, 12, 21))
    assert_equal person.birth_date, Date.new(1995, 12, 21)
  end

  test 'time assignment should work' do
    person = Person.new(name: 'Ruby', birth_date: Time.new(1995, 12, 21))
    assert_equal person.birth_date, Date.new(1995, 12, 21)
  end

  test 'time with zone assignment should work' do
    person = Person.new(name: 'Ruby', birth_date: Time.zone.local(1995, 12, 21))
    assert_equal person.birth_date, Date.new(1995, 12, 21)
  end

  test 'nil assignment should be nil' do
    person = Person.new(name: 'Ruby', birth_date: nil)
    assert_equal person.birth_date, nil
  end
end
