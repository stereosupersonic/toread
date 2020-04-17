# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    link { "https://www.test.com/article" }
    description { "Esse qui et irure dolor excepteur culpa aliqua ad minim sint aliquip. Sunt deserunt labore sunt pariatur anim laboris occaecat ut nostrud do aliquip quis non est.
       Exercitation nisi consequat fugiat nisi duis ut aliqua ipsum. Do dolor nulla reprehenderit excepteur labore duis ipsum culpa
       nisi eu sint ad quis. Labore nostrud cillum duis qui pariatur elit officia officia do ex est veniam occaecat nisi." }
    title { "SUPER INTERESTING" }
    state { "" }
  end
end
