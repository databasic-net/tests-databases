CREATE INDEX dealers_name ON dealers (name ASC);
CREATE INDEX dealers_surname ON dealers (surname ASC);
CREATE INDEX dealers_turn_over_excl_vat ON dealers (turn_over_excl_vat ASC);
CREATE INDEX dealers_turn_over_incl_vat ON dealers (turn_over_incl_vat ASC);
CREATE INDEX dealers_description ON dealers (description ASC);

CREATE INDEX clients_name ON clients (name ASC);
CREATE INDEX clients_fullname ON clients (fullname ASC);
CREATE INDEX clients_discount ON clients (discount ASC);
CREATE INDEX clients_street ON clients (street ASC);
CREATE INDEX clients_city ON clients (city ASC);
CREATE INDEX clients_zip ON clients (zip ASC);
CREATE INDEX clients_region ON clients (region ASC);
CREATE INDEX clients_country ON clients (country ASC);

CREATE INDEX orders_price_excl_vat ON orders (price_excl_vat ASC);
CREATE INDEX orders_price_incl_vat ON orders (price_incl_vat ASC);
CREATE INDEX orders_date_submit ON orders (date_submit ASC);
CREATE INDEX orders_date_dispatch ON orders (date_dispatch ASC);
CREATE INDEX orders_paid ON orders (paid ASC);
CREATE INDEX orders_status ON orders (status ASC);