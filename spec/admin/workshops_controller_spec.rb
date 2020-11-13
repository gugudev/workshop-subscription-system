# frozen_string_literal: true

require 'rails_helper'

feature 'Admin workshop CRUD' do

  before :each do
    @workshop = build(:workshop)

    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'created' do

    visit admin_workshops_path
    click_on 'Register Workshop'

    fill_in 'Nome', with: @workshop.name
    fill_in 'Descrição Curta', with: @workshop.short_description
    fill_in 'Descrição Completa', with: @workshop.full_description

    fill_in 'Capacidade Máxima', with: @workshop.attendees
    fill_in 'Data', with: @workshop.workshop_date
    fill_in 'Hora', with: @workshop.start_time
    fill_in 'Duração', with: @workshop.duration
    click_on I18n.t('admin.workshops.new.submit')

    expect(page).to have_content I18n.t('messages.notices.successfully_created', model_name: 'Workshop')
    expect(page).to have_css('h1', text: @workshop.name)
    expect(page).to have_content @workshop.short_description
    expect(page).to have_content @workshop.full_description

    # expect(page).to have_content '60 minutos'
    # expect(page).to have_content '05/12/2020'
    # expect(page).to have_css('dd', text: /^14:00$/)


  end

  scenario 'updated' do

    @workshop.save!
    random_name = FFaker::Name.name

    visit edit_admin_workshop_path(@workshop.id)

    fill_in 'Nome', with: random_name
    click_on I18n.t('admin.workshops.edit.submit')

    expect(page).to have_content I18n.t('messages.notices.successfully_updated', model_name: 'Workshop')

  end

  scenario 'destroyed' do

    @workshop.save!

    visit admin_workshops_path

    click_on 

  end

end
