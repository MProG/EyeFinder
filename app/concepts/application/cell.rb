class Application::Cell < Cell::Concept
  abstract!

  include Cell::Slim
  include ApplicationHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::AssetTagHelper
  include SimpleForm::ActionViewExtensions::FormHelper
end
