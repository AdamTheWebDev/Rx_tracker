class PrescriptionsController < ApplicationController
  before_action :find_prescription, only: [:show, :edit, :update, :destroy]

def index
  @prescriptions = Prescription.all.where(user_id:current_user).order("created_at DESC")

end

def show
  puts "this is the params #{params}"
  @prescriptionimg = Prescription.find(params[:id])
  require 'uri'
  require 'net/http'

  url = URI("https://rximage.nlm.nih.gov/api/rximage/1/rxnav?parse=" + @prescriptionimg[:name])
  puts @prescriptionimg[:url]
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["cache-control"] = 'no-cache'
  request["postman-token"] = '15077320-b4d6-5d77-57bf-2c60066957a6'

  response = http.request(request)
  puts response.read_body
  @body = response.body
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
