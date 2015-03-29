require 'rubygems'
require 'mechanize'
require 'csv'

agent = Mechanize.new
start_time = Time.now
#prevpage = " "

CSV.open("open_rice_export.csv", 'w') {|csv|
	#csv << ["shopname", "addr", "tel", "food type", "hours", "price"]

	page = agent.get("http://www.openrice.com/en/hongkong/restaurant/sr1.htm?tc=sr1quick&s=1&region=0&inputstrwhat=&inputstrwhere=")	
	page.links_with(:href => /tc=sr1/).each do|link|
		#if link != prevpage 
			eachpage = link.click
			#Get Shop Name
			shopname = eachpage.at(".sr2_poi_title")
			if shopname != nil
				shopname = shopname.text.strip
			end
			#Get Shop Info
			addr = eachpage.search('//div[3]/div/div/div/div[2]/div[1]/div/div[2]/div').text.strip
			#tel = eachpage.search('//div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[2]').text.strip
			#type = eachpage.search('//div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[3]').text.strip
			#hours = eachpage.search('//div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[4]').text.strip
			#price = eachpage.search('//div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[5]').text.strip
			
			# shoptel = eachpage.at(".col")
			# if shoptel != nil
				# shoptel = shoptel.text.strip
			# end
			#shop_price = eachpage.search(".listprice").text.strip
			#     = eachpage.search(".listadd").text.strip
			#shop_type        = eachpage.search(".listdish").children.text.strip
			#shop_rating_good = eachpage.at(".sr2_score_l")
			#shop_rating_ok  = eachpage.at(".sr2_score_m")
			p shopname
			#shop_price = eachpage.search(".price").text
			#shop_address =  eachpage.search(".add").text
			csv << [shopname, addr]#, tel, type, hours, price]
			#prevpage = link
		#end
	end
}
p Time.now - start_time