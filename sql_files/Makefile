enter_mysql_library:
	sudo mysql -u root -p library

create_library:
	sudo mysql -u root -p < ./create_and_enter_library.sql
remove_library:
	sudo mysql -u root -p -t < ./remove_library.sql

create_tables:
	sudo mysql -u root -p library -t < ./create_tables.sql
	sudo mysql -u root -p library -t < ./triggers.sql
remove_tables:
	sudo mysql -u root -p library -t < ./remove_all_tables.sql

show_tables:
	sudo mysql -u root -p library -t < ./show_table_names.sql
all_tables:
	sudo mysql -u root -p library -t < ./show_all_tables.sql

triggers:
	sudo mysql -u root -p library -t < ./triggers.sql
show_triggers:
	sudo mysql -u root -p library -t < ./show_triggers.sql

branch_insert:
	sudo mysql -u root -p library -t < ./insert_in_branch.sql
customer_insert:
	sudo mysql -u root -p library -t < ./insert_in_customer.sql
customer_subscription_insert:
	sudo mysql -u root -p library -t < ./insert_in_customer_subscription.sql
author_insert:
	sudo mysql -u root -p library -t < ./insert_in_author.sql
books_insert:
	sudo mysql -u root -p library -t < ./insert_in_books.sql
borrowed_insert:
	sudo mysql -u root -p library -t < ./insert_in_borrowed.sql

branch_delete:
	sudo mysql -u root -p library -t < ./branch_delete.sql
customer_delete:
	sudo mysql -u root -p library -t < ./customer_delete.sql
customer_subscription_delete:
	sudo mysql -u root -p library -t < ./customer_subscription_delete.sql
author_delete:
	sudo mysql -u root -p library -t < ./author_delete.sql
books_delete:
	sudo mysql -u root -p library -t < ./books_delete.sql
borrowed_delete:
	sudo mysql -u root -p library -t < ./borrowed_delete.sql
