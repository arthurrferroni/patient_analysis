# app/policies/patient_policy.rb

class PatientPolicy < ApplicationPolicy
  attr_reader :user, :patient

  def initialize(user, patient)
    @user = user
    @patient = patient
  end

  def index?
    true
  end

  def show?
    user.admin? || patient.company == user.company || user.role == 'company_user'
  end

  def create?
    user.admin? || user.company == patient.company || user.role == 'company_user'
  end

  def update?
    user.admin? || user.company == patient.company || user.role == 'company_user'
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(company: user.company)
      end
    end
  end
end
