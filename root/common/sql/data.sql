--*******************sample data - diamond team**********************

 --manager
 INSERT INTO public.manager(login_id, password) VALUES ('chi', 'chi');
 INSERT INTO public.manager(login_id, password) VALUES ('hien', 'hien');
 INSERT INTO public.manager(login_id, password) VALUES ('tin', 'tin');
 
 --bus
 
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '34', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '35', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '36', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '37', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '38', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '39', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '40', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '41', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '42', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '43', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '44', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '45', 12, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '88', 2, 2 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('品川', '23', 'は', '12', '99', 2, 2 );

INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('横浜', '33', 'は', '21', '01', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('新宿', '36', 'て', '21', '02', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('新宿', '36', 'て', '21', '03', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('新宿', '36', 'て', '21', '04', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('新宿', '36', 'は', '21', '05', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('新宿', '36', 'て', '21', '06', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('新宿', '36', 'て', '21', '07', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('大阪', '92', 'は', '21', '08', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('大阪', '92', 'た', '43', '09', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('大阪', '92', 'た', '43', '10', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('大阪', '92', 'た', '43', '11', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('大阪', '92', 'た', '43', '12', 10, 3 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('大阪', '92', 'た', '43', '13', 4, 4 );
INSERT INTO public.bus(number_place, number_division, number_kana, number_first_half, number_latter_half, row_num, column_num)VALUES ('大阪', '92', 'た', '43', '14', 4, 4 );

-- bus_stop

INSERT INTO public.bus_stop(bus_stop_name)VALUES ('北海道');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('青森県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('岩手県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('宮城県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('秋田県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('山形県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('福島県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('茨城県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('栃木県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('群馬県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('埼玉県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('千葉県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('東京都');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('神奈川県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('新潟県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('富山県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('石川県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('福井県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('山梨県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('長野県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('岐阜県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('静岡県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('愛知県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('三重県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('滋賀県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('京都府');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('大阪府');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('兵庫県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('奈良県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('和歌山県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('鳥取県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('島根県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('岡山県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('広島県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('山口県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('徳島県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('香川県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('愛媛県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('高知県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('福岡県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('佐賀県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('長崎県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('熊本県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('大分県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('宮崎県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('鹿児島県');
INSERT INTO public.bus_stop(bus_stop_name)VALUES ('沖縄県');


--member

INSERT INTO public.member(last_name, first_name, tel, email, password) VALUES ( 'Nguyen', 'Kim Chi', '000-2023-1997', 'kimchihanu@gmail.com' , 'chi');
INSERT INTO public.member(last_name, first_name, tel, email, password) VALUES ( 'Nguyen', 'Thanh Hien', '000-2023-1999', 'thanhhien13p@gmail.com' , 'hien');
INSERT INTO public.member(last_name, first_name, tel, email, password) VALUES ( 'Tran', 'Trung Tin', '000-2023-1992', 'trungtintran0711@gmail.com' , 'tin');


--route

INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (26,'10:00', 27, '18:00', '2023-06-17 00:00:00', null, 1, 4000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (27,'22:00', 26, '06:00', '2023-06-17 00:00:00', null, 1, 3000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (25,'10:00', 22, '18:00', '2023-06-17 00:00:00', null, 2, 5000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (23,'22:00', 21, '06:00', '2023-06-17 00:00:00', null, 3, 2000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (1,'10:00', 3, '18:00', '2023-06-17 00:00:00', null, 4, 3500);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (15,'22:00', 19, '06:00', '2023-06-17 00:00:00', null, 5, 4500);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (33,'06:00', 35, '22:00', '2023-06-22 00:00:00', null, 27, 20000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (37,'04:00', 39, '12:00', '2023-06-22 00:00:00', null, 28, 22000);

INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (11,'10:00', 21, '18:00', '2023-06-10 00:00:00', null, 30, 4000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (12,'22:00', 22, '06:00', '2023-06-10 00:00:00', null, 31, 3000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (13,'10:00', 23, '18:00', '2023-06-10 00:00:00', null, 32, 5000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (14,'22:00', 24, '06:00', '2023-06-10 00:00:00', null, 33, 2000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (15,'10:00', 25, '18:00', '2023-06-10 00:00:00', null, 34, 3500);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (16,'22:00', 26, '06:00', '2023-06-10 00:00:00', null, 35, 4500);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (17,'06:00', 27, '22:00', '2023-06-20 00:00:00', null, 36, 20000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (18,'04:00', 28, '12:00', '2023-06-20 00:00:00', null, 37, 22000);

INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (19,'22:00', 24, '06:00', '2023-06-10 00:00:00', null, 38, 2000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (20,'10:00', 25, '18:00', '2023-06-10 00:00:00', null, 39, 3500);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (21,'22:00', 26, '06:00', '2023-06-10 00:00:00', null, 40, 4500);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (22,'06:00', 27, '22:00', '2023-06-20 00:00:00', null, 41, 4000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (27,'04:00', 13, '10:00', '2023-06-20 00:00:00', null, 42, 22000);
INSERT INTO public.route(departure_bus_stop_id, departure_time, arrival_bus_stop_id, arrival_time, run_start_date, run_end_date, bus_id, price) VALUES (27,'08:00', 13, '14:00', '2023-06-20 00:00:00', null, 43, 22000);

--reservation


INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-07 00:00:00', 1, 1);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-07 00:00:00', 1, 2);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-09 00:00:00', 2, 1);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-25 00:00:00', 3, 1);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-09 00:00:00', 2, 1);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-17 00:00:00', 1, 3);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-27 00:00:00', 1, 4);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-29 00:00:00', 2, 5);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-15 00:00:00', 3, 4);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-19 00:00:00', 2, 3);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-10 00:00:00', 3, 13);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-20 00:00:00', 3, 14);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-07 00:00:00', 2, 1);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-07 00:00:00', 3, 1);
INSERT INTO public.reservation(reservation_datetime, user_id, route_id)VALUES ('2023-07-09 00:00:00', 1, 1);

--reservasion_detail


INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (1, '7A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (1, '7B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (2, '8B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (2, '8C');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (3, '2A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (3, '2B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (4, '1A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (5, '10B');

INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (6, '12A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (6, '12B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (6, '18B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (7, '18C');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (8, '21A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (8, '21B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (9, '11A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (10, '10B');

INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (11, '1A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (11, '1B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (11, '2A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (11, '2B');

INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (12, '1A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (12, '1B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (12, '2A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (12, '2B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (13, '10A');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (14, '11B');
INSERT INTO public.reservation_detail(reservation_no, seat_name)VALUES (15, '23A');




