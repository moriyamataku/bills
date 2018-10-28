Monban.configure do |config|
  config.sign_in_notice = -> { I18n.t("sign_in_notice") }
end