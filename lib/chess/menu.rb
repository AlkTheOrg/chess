module Chess
  class Menu
    attr_reader :game
    def initialize
      @game = Game.new
    end

    def main_menu
      input = ''
      until input == '3' # option 3: quit
        print_main_menu
        input = gets.chomp
        input = gets.chomp until valid_option?(input)
        enter_option(input) # 0: play; 1: save; 2: load; 3: quit
      end
    end

    def play
      new_game if new_game?
      game.play
    end

    def new_game
      @game = Game.new
    end

    def save_game(save_name = Time.now.strftime('%d.%m.%Y_%H.%M'))
      Dir.mkdir('saves') unless File.exist?('saves')
      File.open("./saves/#{save_name}.yaml", 'w') do |file|
        YAML.dump(@game, file)
        puts "Game is saved!\n\n"
      end
    end

    def load_game
      saves = Dir['./saves/*.yaml']
      if saves.empty?
        puts "No saved file\n\n"
        return
      end
      puts; saves.each_with_index { |save, i| puts "#{i + 1}: #{save[8..-6]}" }
      print "\nEnter the num of save to load: "
      input = get_save_input(saves)
      load_from_file(saves[input.to_i - 1])
    end

    def quit
      puts 'GOOD BYE!'
    end

    private

    def enter_option(option)
      case option
      when '0'
        play
      when '1'
        save_game
      when '2'
        load_game
      when '3'
        quit
      end
    end

    def print_main_menu
      print "0: PLAY\n" \
           "1: SAVE GAME\n" \
           "2: LOAD GAME\n" \
           '3: QUIT: '
    end

    def valid_option?(option)
      if (option =~ /[0-3]/) == 0
        true
      else
        print "\nInvalid input. Enter again: "
        false
      end
    end

    def new_game?
      puts "Enter 'yes' to start a new game. Anything else not to."
      input = gets.chomp
      input == 'yes'
    end

    def get_save_input(saves)
      input = gets.chomp
      input = gets.chomp until input.match?(/[1-#{saves.size}]/)
      input
    end

    def load_from_file(file_name)
      File.open(file_name) do |file|
        @game = YAML.load(file)
        puts "Game is loaded!\n\n"
      end
    rescue StandardError
      puts 'Couldnt find the file or ' \
      "the file is corrupted.\n\n"
    end
  end
end
