class InformsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q= Record.ransack(params[:q])
    @informs_record = @q.result
    respond_to do |format|
      format.html
      format.json
      format.pdf do
        render template: 'informs/reporte',
        pdf: 'Reporte',
        page_size: "A4"
      end
    end
  end

  def form
  end

  private
  def record_params
    params.require(:record).permit(:course_id, :student_id, :score)
    params.require(:q).permit!
  end
end