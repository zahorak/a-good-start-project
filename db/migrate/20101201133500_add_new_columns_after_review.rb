class AddNewColumnsAfterReview < ActiveRecord::Migration
  def self.up

    add_column('surveys','language_albanian', :integer, :limit => 4)
    add_column('surveys','children_language_albanian', :integer, :limit => 4)

    #7.2
    mi = MenuItem.new(:name_en => 'Post-secondary non tertiary education', :name_sk => "Ukončenie pomaturitného vzdelávania", :position => 2, :category => 'wished_education')
    mi.save

    add_column('surveys','talked_about_pregnancy_doctor', :boolean, :limit => 1)
    add_column('surveys','talked_about_pregnancy_nurse', :boolean, :limit => 1)
    add_column('surveys','talked_about_pregnancy_community_mediator', :boolean, :limit => 1)
    add_column('surveys','talked_about_pregnancy_health_mediator', :boolean, :limit => 1)
    add_column('surveys','talked_about_pregnancy_noone', :boolean, :limit => 1)
    
    #9.2 
    add_column('surveys','book_reading_no_asnwer', :boolean, :limit => 1)
    add_column('surveys','tell_stories_no_asnwer', :boolean, :limit => 1)
    add_column('surveys','play_no_answer', :boolean, :limit => 1)
    add_column('surveys','draw_no_answer', :boolean, :limit => 1)
    add_column('surveys','teach_letters_no_answer', :boolean, :limit => 1)
    add_column('surveys','homework_no_answer', :boolean, :limit => 1)


    change_column('surveys', 'book_reading_other', :string, :limit => 100)
    change_column('surveys', 'tell_stories_other', :string, :limit => 100)
    change_column('surveys', 'play_other', :string, :limit => 100)
    change_column('surveys', 'draw_other', :string, :limit => 100)
    change_column('surveys', 'teach_letters_other', :string, :limit => 100)
    change_column('surveys', 'homework_other', :string, :limit => 100)

    # 12.1
    mi = MenuItem.new(:name_en => 'Post-secondary non tertiary education', :name_sk => "Ukončenie pomaturitného vzdelávania", :position => 2, :category => 'school_type')
    mi.save

  end

  def self.down
  end
end
