module Alipay
  class Result < ::Hash
    SUCCESS_FLAG = 'T'.freeze
    FAIL_FLAG = 'F'.freeze

    def initialize(result)
      super nil # Or it will call `super result`
      self[:raw] = result
      
      if result.class == Hash
        result['alipay'].each_pair do |k, v|
          self[k] = v
        end
      end
    end
    
    def success?
      self['is_success'] == SUCCESS_FLAG
    end
  end
end
