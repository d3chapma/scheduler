class MonthChooser
  def self.choose_month(prompt)
    month = 'none'
    choose do |menu|
      menu.prompt = prompt
      (1..5).each do |count|
        date = Date.today.at_beginning_of_month + count.month
        menu.choice(date.strftime('%B %Y')) { month = date }
      end
    end
    month
  end
end
