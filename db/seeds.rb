# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#insert Admin
Admin.create([{name:'Perdana Adhitama',email:'okanemanager@gmail.com',password:'d033e22ae348aeb5660fc2140aec35850c4da997',username:'admin'}])
# insert Category
Category.create([
	{name:'Food',tipe:'2',description:'Cafe,Breakfast,Lunch,Dinner'},
	{name:'Daily Goods',tipe:'2',description:'Child related,Pet related,Tobacco'},
	{name:'Transport',tipe:'2',description:'Train, Taxi, Bus, Airfares'},
	{name:'Phone, Net',tipe:'2',description:'Internet, TV, Delivery'},
	{name:'Utilities',tipe:'2',description:'Gas, Water, Electricity'},
	{name:'Home',tipe:'2',description:'Home Insurance, Furniture, Home Electronic, Mortgage'},
	{name:'Socializing',tipe:'2',description:'party, Gift'},
	{name:'Hobbies',tipe:'2',description:'Music, Books, Games, Cinema'},
	{name:'Education',tipe:'2',description:'Newspapers, Tuition fee, Examination Fee, Student Insurance'},
	{name:'Medical',tipe:'2',description:'Life Insurance, Medical Insurance'},
	{name:'Fashion',tipe:'2',description:'Accesories, Underwear, Gym & Helath, Cosmetics'},
	{name:'Automobile',tipe:'2',description:'Gasoline, Parking, Auto loan, Auto insurance ,Auto tax, Tolls'},
	{name:'Tax',tipe:'2',description:'Income tax, Residence tax'},
	{name:'Salary',tipe:'1',description:''},
	{name:'Business Income',tipe:'1',description:''},
	{name:'Bonus',tipe:'1',description:''},
	{name:'Extraordinary revenue',tipe:'1',description:''},
	{name:'Advances repayment',tipe:'1',description:''},
	{name:'Other',tipe:'1',description:''}
	])
# insert FAQ
Faq.create([
	{title:'Aplikasi apa ini?',order:'1',description:'Ini adalah aplikasi untuk pengaturan keuangan anda. Uang yang masuk dan keuar akan ter-record dalam aplikasi ini. Dengan begitu anda bisa tau berapa uang yang saya dapat,keluarkan dan tabung setiap bulan. '},
	{title:'Apakah aplikasi ini gratis?',order:'2',description:'Ya aplikasi ini gratis'},
	{title:'Bagaimana cara memasukkan pendapatan?',order:'3',description:'Anda bisa memasukan pendapatan dengan 2 cara yaitu.
<ol>
<li> masuk ke menu transaction->income klik tombol add</li>
<li> masuk ke menu transaction dan klik add income </li>
</ol>'},
	{title:'Bagaimana cara memasukkan pengeluaran?',order:'4',description:'Anda bisa memasukan pengeluaran dengan 2 cara yaitu.
<ol>
<li> masuk ke menu transaction->expense klik tombol add</li>
<li> masuk ke menu transaction dan klik add expense</li>
</ol>'},
	{title:'Saya menemukan Error/Bug',order:'5',description:'Anda bisa mengirimkan error atau bug yang anda temukan ke email perdana_adhitama@yahoo.com. Jangan lupa disertakan screenshot dan langkah-langkah menemukan error tersebut'}
	])