require 'kuaidiniao/version'
require 'kuaidiniao/service'
require 'kuaidiniao/sign'
require 'openssl'

module Kuaidiniao

  class << self
    # 商户ID， APPKey请到快递鸟后台会员中心查看
    attr_accessor :mch_id, :app_key, :bebug
  end
end
