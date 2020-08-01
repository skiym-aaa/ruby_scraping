require 'optparse'

module Mercury
  class PreProcesser
    def self.exec(argv)
      opt = OptionParser.new
      opt.on('--infile=VAL')
      opt.on('--outfile=VAL')
      opt.on('--category=VAL')

      params = {}
      opt.parse!(argv, into: params)
      raise 'Error: --infile と --category は同時に指定できません。' if params[:infile] && params[:category]
      params
    end
  end
end