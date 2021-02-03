class AddSoundAmplificationVoiceToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :sound_amplification_voice, :boolean
  end
end
