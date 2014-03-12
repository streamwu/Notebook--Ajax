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
      respond_to do |format|
        format.html { redirect_to notes_url, notice: "Note created successfully." }
        format.js
      end
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

    respond_to do |format|
      format.html do
        redirect_to notes_url, notice: "Note deleted."
      end
      format.js do
                     # $("#note_15").hide();
        render :js => '$("#note_' + @note.id.to_s + '").hide();'
      end
    end

  end
end












