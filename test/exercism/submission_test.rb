require './test/test_helper'
require 'exercism/submission'

class SubmissionTest < Minitest::Test
  LANGUAGES = [
    {:lang => :ruby,        :ext => '.rb'},
    {:lang => :elixir,      :ext => '.exs'},
    {:lang => :javascript,  :ext => '.js'},
    {:lang => :clojure,     :ext => '.clj'},
    {:lang => :python,      :ext => '.py'},
    {:lang => :go,          :ext => '.go'},
  ]

  LANGUAGES.each do |pair|
    define_method "test_knows_#{pair[:lang]}_code" do
      refute Exercism::Submission.test?("queens#{pair[:ext]}")
    end

    define_method "test_identifies_#{pair[:lang]}_tests" do
      case pair[:lang]
      when :javascript then
        assert Exercism::Submission.test?("queens.spec#{pair[:ext]}")
      else
        assert Exercism::Submission.test?("queens_test#{pair[:ext]}")
      end
    end
  end
end
