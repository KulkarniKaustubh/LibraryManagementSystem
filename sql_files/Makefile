enter_mysql_library:
	sudo mysql -u root --password= library

create_library:
	sudo mysql -u root --password= < ./create_and_enter_library.sql
remove_library:
	sudo mysql -u root --password= -t < ./remove_library.sql

create_tables:
	sudo mysql -u root --password= library -t < ./create_tables.sql
	sudo mysql -u root --password= library -t < ./triggers.sql
remove_tables:
	sudo mysql -u root --password= library -t < ./remove_all_tables.sql

show_tables:
	sudo mysql -u root --password= library -t < ./show_table_names.sql
all_tables:
	sudo mysql -u root --password= library -t < ./show_all_tables.sql

triggers:
	sudo mysql -u root --password= library -t < ./triggers.sql
show_triggers:
	sudo mysql -u root --password= library -t < ./show_triggers.sql

branch_insert:
	sudo mysql -u root --password= library -t < ./insert_in_branch.sql
branch_address_insert:
	sudo mysql -u root --password= library -t < ./insert_in_branch_address.sql
customer_insert:
	sudo mysql -u root --password= library -t < ./insert_in_customer.sql
customer_subscription_insert:
	sudo mysql -u root --password= library -t < ./insert_in_customer_subscription.sql
author_insert:
	sudo mysql -u root --password= library -t < ./insert_in_author.sql
books_insert:
	sudo mysql -u root --password= library -t < ./insert_in_books.sql
borrowed_insert:
	sudo mysql -u root --password= library -t < ./insert_in_borrowed.sql

branch_delete:
	sudo mysql -u root --password= library -t < ./branch_delete.sql
branch_address_delete:
	sudo mysql -u root --password= library -t < ./branch_address_delete.sql
customer_delete:
	sudo mysql -u root --password= library -t < ./customer_delete.sql
customer_subscription_delete:
	sudo mysql -u root --password= library -t < ./customer_subscription_delete.sql
author_delete:
	sudo mysql -u root --password= library -t < ./author_delete.sql
books_delete:
	sudo mysql -u root --password= library -t < ./books_delete.sql
borrowed_delete:
	sudo mysql -u root --password= library -t < ./borrowed_delete.sql

test_join:
	sudo mysql -u root --password= library -t < ./join_test.sql
queries:
	sudo mysql -u root --password= library -t < ./queries.sql
