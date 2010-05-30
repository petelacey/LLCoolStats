class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :name
      t.references :team

      t.timestamps
    end

    # http://github.com/matthuhiggins/foreigner
    # Does not seem to be honoring t.references xxx, :foreign_key => true # or t.foreign_key xxx
    # Rails 3 issue?
    add_foreign_key(:players, :teams)
  end

  def self.down
    drop_table :players
  end
end
