require 'stringio'
require 'tempfile'

require 'cfg2asm'

require 'rspec'

describe Cfg2asm::Commands do
  before :all do
    @fib_java = File.expand_path('../../examples/graalvm-ce-java11-21.2.0/fib-java.bgv.gz', __dir__)
    @fib_ruby = File.expand_path('../../examples/graalvm-ce-java11-21.2.0/fib-ruby.bgv.gz', __dir__)
  end

  before :each do
    @out = StringIO.new
    @commands = Cfg2asm::Commands.new(@out)
  end

  describe '#cfg2asm' do
    if Cfg2asm::SpecHelpers.dependencies_installed?
      it 'prints format and version' do
        @commands.cfg2asm(File.expand_path('../../examples/java/exampleWhile.cfg.gz', __dir__), '--no-comments')
        lines = @out.string.lines.map(&:rstrip)
        expect(lines[1]).to include ":\tnop	dword ptr [rax + rax]"
        expect(lines[-1]).to include ":\thlt"
      end
    else
      it 'raises an exception if Capstone is not installed' do
        expect do
          @commands.cfg2asm(File.expand_path('../../examples/java/exampleWhile.cfg.gz', __dir__), '--no-comments')
        end.to raise_error(RuntimeError, /Could not load Capstone - is it installed?/)
      end
    end
  end
end
