require 'faraday'
require 'json'
require 'active_support/core_ext/hash'

module Kuaidiniao
  class Service
    if Kuaidiniao.debug
      API = debug_api
    else
      API = api
    end
    REQUEST_URL = 'http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx'.freeze

    # 查询订单物流轨迹，按照运单号单个查询
    # shipper_code 快递公司编码
    # logistic_code 物流单号
    # order_code 订单编号
    # EbusinessOrderHandle
    def self.get_trace(shipper_code, logistic_code, order_code='',api)
      api_url = eval("#{API}.#{api}.url")
      code = eval("#{API}.#{api}.code")
      request_data = "{'OrderCode':'#{order_code}','ShipperCode':'#{shipper_code}','LogisticCode':'#{logistic_code}'}"
      post_data = {
        'EBusinessID': Kuaidiniao.mch_id,
        'RequestType': code,
        'RequestData': CGI.escape(request_data),
        'DataType': '2',
        'DataSign': Kuaidiniao::Sign.sign(request_data, Kuaidiniao.app_key)
      }
      invoke_remote(post_data,api_url)
    end

    class << self
      private

      def invoke_remote(payload,api_url)
        conn = Faraday.new(url: api_url)
        JSON.parse(conn.post('', payload).body)
      end
    end
  end
end
