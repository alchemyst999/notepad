require 'date'

class Task < Post

    def initialize
        super
        
        @due_date = ''
    end
    
    def read_from_console
        puts "Что вам необходимо сделать?"
        @text = STDIN.gets.chomp

        puts "До какого числа вам нужно это сделать?"
        puts "Укажите дату в формате ДД.ММ.ГГГГ, например 29.06.2024:"

        input = STDIN.gets.chomp

        @due_date = Date.parse(input)
    end

    def save
        file = File.new(file_path, "w")

        time_string = @created_at.strftime("%Y.%m.%d, %H:%M")
        
        file.puts(time_string + "\n\r" + "Сделать до #{@due_date.strftime("%Y.%m.%d")}:" + "\n#{@text}")

        file.close

        puts "Ваша задача сохранена"
    end

    def to_strings
    end
end