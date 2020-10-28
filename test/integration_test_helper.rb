require "minitest/spec"
require "minitest/autorun"
require "minitest/unit"

class ApplicationIntegrationTest < ActionDispatch::IntegrationTest
  NEW_CLASS = Class.new
  OK = "200"
  NOT_FOUND = "404"
  FOUND = "302"
  UNAUTHORIZED = "401"
  BAD_REQUEST = "400"

  alias GET get
  alias POST post
  alias PUT put
  alias PATCH patch
  alias DELETE delete

  def path_with_host(path)
    "http://#{host}/" << path
  end

  def assert(assertion, message = nil, equal: NEW_CLASS)
    if equal == NEW_CLASS
      super(assertion, message)
    else
      assert_equal(equal, assertion, message)
    end
  end
end
