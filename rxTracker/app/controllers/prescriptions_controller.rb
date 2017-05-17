class PrescriptionsController < ApplicationController
  before_action :find_prescription, only: [:show, :edit, :update, :destroy]

def index
  @prescriptions = Prescription.all.where(user_id:current_user).order("created_at DESC")
end

def show
end

def new
  @prescription = current_user.prescriptions.build
end
def create
  @prescription = current_user.prescriptions.build(prescription_params)
    if @prescription.save
      redirect_to root_path
    else
      render 'new'
    end
end
  def edit
  end

  def update
    if @prescription.update(prescription_params)
      redirect_to prescription_path
    else
      render 'edit'
    end
  end

  def destroy
    @prescription.destroy
    redirect_to root_path
  end
end
private

  def prescription_params
    params.require(:prescription).permit(:name, :date, :prescriber, :strength, :directions, :refills, :ndc)
  end
  def find_prescription
    @prescription = Prescription.find(params[:id])
  end
