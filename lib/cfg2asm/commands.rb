require 'json'
require 'set'

module Cfg2asm
  # Implementations of the command-line commands that you can run in Seafoam.
  class Commands
    def initialize(out)
      @out = out
    end
    
    def get_files_and_comments_flag(args)
      comments = true
      files = []

      until args.empty?
        arg = args.shift
        if arg.start_with?('-')
          case arg
          when '--no-comments'
            comments = false
          else
            raise ArgumentError, "unknown option #{arg}"
          end
        else
          files.push arg
        end
      end
      
      [files, comments]
    end

    def cfg2asm(*args)
      case args.first
      when nil, 'help', '-h', '--help', '-help'
        args = args.drop(1)
        raise ArgumentError, "unexpected arguments #{args.join(' ')}" unless args.empty?

        @out.puts 'cfg2asm file.bgv...'
        @out.puts '            --no-comments'
        @out.puts '        --help'
        @out.puts '        --version'
      when 'version', '-v', '-version', '--version'
        args = args.drop(1)
        version(*args)
      when 'summary'
        args.shift
        files, comments = get_files_and_comments_flag(args)

        files.each_with_index do |file, n|
          parser = Cfg2asm::CFG::CFGParser.new(@out, file)
          parser.print_summar_of_content
        end
      else
        files, comments = get_files_and_comments_flag(args)

        files.each_with_index do |file, n|
          parser = Cfg2asm::CFG::CFGParser.new(@out, file)
          parser.skip_over_cfg('After code installation', 'After code generation')
          nmethod = parser.read_nmethod

          disassembler = Cfg2asm::CFG::Disassembler.new(@out)
          @out.puts if n.positive?
          @out.puts "[#{file}]"
          disassembler.disassemble(nmethod, comments)
        end
      end
    end

    # Prints the version.
    def version(*args)
      raise ArgumentError, "unexpected arguments #{args.join(' ')}" unless args.empty?

      @out.puts "cfg2asm #{VERSION}"
    end
  end
end
