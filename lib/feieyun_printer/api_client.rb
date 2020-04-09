module FeieyunPrinter
  class ApiClient
    attr_reader :user, :ukey

    API_URL = URI.parse("http://api.feieyun.cn/Api/Open/")

    def initialize(user, ukey)
      @user, @ukey = user, ukey
    end

    def add_printer(sn_list)
      request_params = {
        user: user,
        stime: Time.new.to_i.to_s,
        apiname: "Open_printerAddlist",
        printerContent: sn_list
      }.tap do |data|
        data[:sig] = sign(data)
      end
      resp = call_api(request_params)
      FeieyunPrinter.logger.info "FeieyunPrinter add_printer #{sn_list} resp(#{resp.status}): #{resp.body}"
      JSON.load(resp.body)
    end

    def query_printer_status(sn)
      request_params = {
        user: user,
        stime: Time.new.to_i.to_s,
        apiname: "Open_queryPrinterStatus",
        sn: sn
      }.tap do |data|
        data[:sig] = sign(data)
      end
      resp = call_api(request_params)
      FeieyunPrinter.logger.info "FeieyunPrinter query_printer_status #{sn} resp(#{resp.status}): #{resp.body}"
      JSON.load(resp.body)
    end

    def print(sn, content, options={})
      request_params = {
        user: user,
        stime: Time.new.to_i.to_s,
        apiname: "Open_printMsg",
        sn: sn,
        content: content,
        times: options[:times].presence || "1"
      }.tap do |data|
        data[:sig] = sign(data)
      end
      resp = call_api(request_params)
      FeieyunPrinter.logger.info "FeieyunPrinter print #{sn} #{content.squish} #{options.to_json} resp(#{resp.status}): #{resp.body}"
      JSON.load(resp.body)
    end

    def query_order_state(order_id)
      request_params = {
        user: user,
        stime: Time.new.to_i.to_s,
        apiname: "Open_queryOrderState",
        orderid: order_id
      }.tap do |data|
        data[:sig] = sign(data)
      end
      resp = call_api(request_params)
      FeieyunPrinter.logger.info "FeieyunPrinter query_order_state #{order_id} resp(#{resp.status}): #{resp.body}"
      JSON.load(resp.body)
    end

    private
      def sign(data)
        Digest::SHA1.hexdigest(user+ukey+data[:stime])
      end

      def call_api(data)
        Faraday.post API_URL, data
      end
  end
end
