class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find_by(id: params[:id])
  end

  def new
  end

  def create
    @note = Note.new
    @note.content = params[:note][:content]

    if @note.save
      redirect_to notes_url, notice: "Note created successfully."
    else
      render 'new'
    end
  end

  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.content = params[:content]

    if @note.save
      redirect_to notes_url, notice: "Note updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    @note.destroy

    redirect_to notes_url, notice: "Note deleted."
  end
end
