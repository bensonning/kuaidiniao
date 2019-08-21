require 'faraday'
require 'json'
require 'active_support/core_ext/hash'

module Kuaidiniao
  class Service
    REQUEST_URL = 'http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx'.freeze

    # 查询订单物流轨迹，按照运单号单个查询
    # shipper_code 快递公司编码
    # logistic_code 物流单号
    # order_code 订单编号
    def self.get_trace(shipper_code, logistic_code, order_code='')
      request_data = "{'OrderCode':'#{order_code}','ShipperCode':'#{shipper_code}','LogisticCode':'#{logistic_code}'}"
      post_data = {
        'EBusinessID': Kuaidiniao.mch_id,
        'RequestType': '1002',
        'RequestData': CGI.escape(request_data),
        'DataType': '2',
        'DataSign': Kuaidiniao::Sign.sign(request_data, Kuaidiniao.app_key)
      }
      invoke_remote(post_data)
    end

    class << self
      private

      def invoke_remote(payload)
        conn = Faraday.new(url: REQUEST_URL)
        JSON.parse(conn.post('', payload).body)
      end
    end
  end
end
