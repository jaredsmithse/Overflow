require 'spec_helper'

describe "Index Page" do
	let(:content)  { "this is the content" }
	let(:title)    { "this is the title" }
	let!(:question) { Question.create(content: content, title: title) }

	context "link to create new question" do 
		it "should have the link to create a new question" do 
			visit questions_path
			page.should have_selector(:link, "New Question")
		end

		it "should take you to the new question route" do
			visit questions_path
			click_link('New Question')
			expect(page).to have_content "New Question Form"
		end
	end

	context "link to view the question show page" do 
		it "should have the link for the question created" do 
			visit questions_path
			page.should have_selector(:link, title)
		end

		it "should take you to the question show page" do 
			visit questions_path
			click_link(title)
			expect(page).to have_content "this is the content"
			expect(page).to have_content "this is the title"
		end
	end

	context "form to create a new question" do 
		it "should fill out the form and show the new question page" do
			visit new_question_path
			fill_in 'title', :with => "this is the title"
			fill_in 'content', :with => "this is the content"
			click_on 'Create Question'
			expect(page).to have_content "this is the title"
			expect(page).to have_content "this is the content"
		end
	end
end
