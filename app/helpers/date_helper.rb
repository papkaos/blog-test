module DateHelper
  def date_format(date)
    date.strftime('%d.%m.%Y %R')
  end
end