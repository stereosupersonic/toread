# frozen_string_literal: true

require "delegate"

class BasePresenter < SimpleDelegator
  alias object __getobj__

  def self.wrap(collection)
    collection.map { |elem| new(elem) }
  end

  def helpers
    ApplicationController.helpers
  end

  alias h helpers
  alias o object
end
