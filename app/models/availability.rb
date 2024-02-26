class Availability < ApplicationRecord
  belongs_to :advisor
  # has_many :appointments, through :advisor
  # validates :day_of_week, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  before_validation :set_default_times, on: :create


  def covers_day?(date)
    day_of_week = date.strftime('%A').downcase
    self[day_of_week]
  end


  def time_slots_day(date)

    all_slots = []

    advisor_availabilities = Availability.where(advisor_id: self.advisor_id)

    day_availabilities = advisor_availabilities.select { |availability| availability.covers_day?(date) }

    appointments_date = Appointment.where(advisor_id: self.advisor_id, date: date.beginning_of_day..date.end_of_day)

    appointment_hours = appointments_date.map(&:advisor_hours)

    Rails.logger.info "Nombre de rendez-vous trouvés pour la date #{date} : #{appointments_date.count} à #{appointment_hours}"

    if day_availabilities.empty?
      # Si day_availabilities est vide ou Si un utilisateur a déjà réservé un créneau, on ne peut pas le réserver
      # On ajoute donc un créneau "none" pour chaque créneau horaire réservé
      # On récupère les créneaux horaires réservés via appointment.advisor_hours

      typical_start = advisor_availabilities.map(&:start_time).min
      typical_end = advisor_availabilities.map(&:end_time).max

      num_slots = ((typical_end - typical_start) / 30.minutes).to_i

     num_slots.times{ all_slots << "none" }

    else
      start_day = day_availabilities.map(&:start_time).min
      end_day = day_availabilities.map(&:end_time).max

      current_time = start_day

      while current_time < end_day

        # Ajout du créneau horaire au format HH:MM
        slot = current_time.strftime('%H:%M')

        if appointment_hours.include?(slot)
          all_slots << "none"
        else
          all_slots << slot
        end

        current_time += 30.minutes
      end
    end
    all_slots
  end


  private

  def set_default_times
    self.start_time ||= '09:00'
    self.end_time ||= '18:00'
  end
end
