class ResidentsController < ApplicationController
  before_action :set_resident, only: %i[show update edit switch_status]
  
  def index
    @residents = Resident.includes(:address)

    if params[:search_term].present?
      @residents = @residents.search(params[:search_term])
    elsif params[:active].present?
      @residents = @residents.where(active: params[:active])
    end

    @residents = @residents.page(params[:page])
  end
  
  def show; end
  
  def new
    @resident ||= Resident.new
    @resident.build_address
  end
  
  def create
    @resident = Resident.new(resident_params)

    if @resident.save
      ResidentMailer.with(resident: @resident).creation_mail.deliver_now
      redirect_to @resident
    else
      render :new
    end
  end
  
  def update
    if @resident.update(resident_params)
      ResidentMailer.with(resident: @resident).update_mail.deliver_now
      redirect_to residents_path
    else
      redirect_to action: :edit
    end
  end

  def edit; end
  
  private
  
  def set_resident
    @resident = Resident.find(params[:id])
  end
  
  def resident_params
    params.require(:resident)
    .permit(
      :full_name, :cpf, :cns, :email, :birth_date, :phone, :picture, :active, :page, :search_term,
      address_attributes: %i[id postal_code public_address adjunct district city state_code ibge_code]
    )
  end
end