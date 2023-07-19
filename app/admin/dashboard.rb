ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: 'blank_slate_container', id: 'dashboard_default_message' do
      span class: 'blank_slate' do
        span I18n.t('active_admin.dashboard_welcome.welcome')
        small I18n.t('active_admin.dashboard_welcome.call_to_action')
      end
    end

    columns do
      column do
        panel 'Recent Teachers' do
          ul do
            Teacher.order(created_at: :desc).limit(5).map do |teacher|
              li link_to(teacher.name, admin_teacher_path(teacher))
            end
          end
        end
      end

      column do
        panel 'Recent Children' do
          ul do
            Child.order(created_at: :desc).limit(5).map do |child|
              li link_to(child.name, admin_child_path(child))
            end
          end
        end
      end
    end
  end
end
