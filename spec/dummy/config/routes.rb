Rails.application.routes.draw do
  RawnetAdmin.mount(self) do
    resources :users
  end
end
