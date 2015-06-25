10.times do
  company = Company.create(name: Faker::Company.name)
  5.times do
    location = company.locations.create(name: Faker::Address.city)
    3.times do
      location.courses.create(title: Faker::Company.catch_phrase,
                        description: Faker::Lorem.paragraph,
                     enrollment_cap: Array(20..100).sample)
    end
    10.times do
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      job_title = Faker::Name.title
      hire_date = Faker::Date.between(10.years.ago, 1.day.ago)
      location.employees.create(first_name: first_name,
                                 last_name: last_name,
                                 job_title: job_title,
                                 hire_date: hire_date,
                                company_id: company.id)

    end
  end
end

Course.all.each do |course|
  students = course.location.employees.sample(rand(course.enrollment_cap))
  students.each do |student|
    course.participants.create(employee_id: student.id)
  end
end
