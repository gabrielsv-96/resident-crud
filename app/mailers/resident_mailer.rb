class ResidentMailer < ApplicationMailer
  default from: 'resident@email.com'
  layout 'mailer'

  def creation_mail
    @resident = params[:resident]
    mail(to: @resident.email, subject: 'Seu cadastro acaba de ser criado')
  end

  def update_mail
    @resident = params[:resident]
    mail(to: @resident.email, subject: 'Seu cadastro acaba de ser alterado')
  end
end
