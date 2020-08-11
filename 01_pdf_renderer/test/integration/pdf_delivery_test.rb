require "test_helper"

class PdfDeliveryTest < ActionDispatch::IntegrationTest
    test "pdf request send a pdf as file" do
        get home_path(format: :pdf)

        assert_match "PDF", response.body
        assert_equal "binary", headers["Content-Transfer-Encoding"]

        assert_equal "attachment", headers["Content-Disposition"]
        assert_equal "application/pdf", headers["Content-Type"]
    end

    test "pdf renderer uses the specified template" do
        get another_path(format: :pdf)
        
        assert_match "PDF", response.body
        assert_equal "binary", headers["Content-Transfer-Encoding"]

        assert_equal "attachment", headers["Content-Disposition"]
        assert_equal "application/pdf", headers["Content-Type"]
    end

end