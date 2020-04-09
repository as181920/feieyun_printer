module FeieyunPrinter
  class ApiClient
    attr_reader :user, :ukey

    def initialize(user, ukey)
      @user, @ukey = user, ukey
    end

    def add_printer(sn_list)
      # FeieyunPrinter.logger.info "FeieyunPrinter add_printer #{sn_list} resp(#{resp.status}): #{resp.body}"
    end

    def print(sn, content, options={})
      # FeieyunPrinter.logger.info "FeieyunPrinter print #{sn} #{content} #{options.to_json} resp(#{resp.status}): #{resp.body}"
    end
  end
end
