class LabelsController < ApplicationController

  def index
    @labels=Label.all
  end

  def new
    @label=Label.new
  end

  def create
    @label=Label.new(label_params)
    if @label.save
      redirect_to labels_path, notice: 'ラベルを作成しました'
    else
      render 'new'
    end
  end

  def destroy
    @label=Label.find(params[:id])
    @label.destroy
    redirect_to labels_path, notice: 'ラベルを削除しました'
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
