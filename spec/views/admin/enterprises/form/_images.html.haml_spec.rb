require 'spec_helper'

describe 'admin/enterprises/form/_images.html.haml' do 
  context 'if the enterprises has logo and promo_image attached' do
    it 'display both images and delete checkboxs' do
      enterprise = create(:enterprise_with_images)
      assign :object, enterprise
      form_for enterprise do |f|
        render template: 'admin/enterprises/form/_images', :handlers => [:haml], locals: {f: f}
      end

      expect(rendered).to have_css('div#enterprise_logo') 
      expect(rendered).to have_css('div#enterprise_promo_image')
      expect(rendered).to have_css('input#enterprise_delete_logo')
      expect(rendered).to have_css('input#enterprise_delete_promo_image')

    end
  end

  context "if the enterprises has no image attached" do
    it 'not display both images and delete checkboxes' do
      enterprise = create(:enterprise)
      assign :object, enterprise
      form_for enterprise do |f|
        render template: 'admin/enterprises/form/_images', :handlers => [:haml], locals: {f: f}
      end

      expect(rendered).to_not have_css('div#enterprise_logo')
      expect(rendered).to_not have_css('div#enterprise_promo_image')
      expect(rendered).to_not have_css('input#enterprise_delete_logo')
      expect(rendered).to_not have_css('input#enterprise_delete_promo_image')
  end
end
end