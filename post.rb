class Post

    def self.post_types
        [Memo, Task, Link]
    end

    def self.create(type_index)
        post_types[type_index].new
    end

    def initialize
        @created_at = Time.now
        @text = []
    end

    def read_from_console
        # todo
    end

    def to_strings
        # todo
    end

    def save
        file = File.new(file_path, "w")
        
        for item in to_strings do
            file.puts(item)
        end

        file.close
    end

    def file_path
        current_path = File.dirname(__FILE__)

        file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")

        unless Dir.entries(current_path).include?("files")
            Dir.mkdir("files")
        end

        current_path + "/files/" + file_name
    end
end