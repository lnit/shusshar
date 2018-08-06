Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      scope "/clarinet" do
        post "status", to: "clarinets#status"
        post "punch", to: "clarinets#punch"
        post "shussha", to: "clarinets#shussha"
        post "taisha", to: "clarinets#taisha"
      end
    end
  end
end
