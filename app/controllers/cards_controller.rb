require 'spreadsheet'
require 'stringio'

class CardsController < ApplicationController
  
  def index
    @projects = Project.find_all_by_active(true)
    # debugger
    # 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end
  
  def create
    card = Card.new params[:card]
    Spreadsheet.client_encoding = 'UTF-8'
    date = (Date.today.end_of_week - 2).to_s
    # pretty_name = "#{card.name.gsub(/ /,'')}_#{card.supervisor.gsub(/ /,'')}_#{card.date.gsub(/ /,'')}.xls"
    pretty_name = "#{card.name.gsub(/ /,'')}_#{card.supervisor.gsub(/ /,'')}_#{date.gsub(/ /,'')}.xls"
    
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet :name => "#{date}"
    
    sheet1.row(0).concat ["#{card.name}", "#{card.supervisor}", "#{date}"]
    idx = 1

    (0..card.projects.length).each do |i|
      if (!card.projects[i].blank? && !card.allocations[i].blank?)
        r = [Project.find(card.projects[i]).name, "#{card.allocations[i]}"]
        puts r
        sheet1.row(1+idx).concat r
        idx+=1
      end
    end
    
    data = StringIO.new ''
    book.write data
    
    send_data data.string.bytes.to_a.pack("C*"), :filename => pretty_name, 
      :type => "application/excel", :disposition => "attachment",
      :x_sendfile => true
    
    
  end
  
end