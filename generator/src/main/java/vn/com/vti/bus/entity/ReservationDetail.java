package vn.com.vti.bus.entity;

public class ReservationDetail {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.reservation_detail.reservation_detail_no
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    private Integer reservationDetailNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.reservation_detail.reservation_no
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    private Integer reservationNo;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.reservation_detail.seat_name
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    private String seatName;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.reservation_detail.reservation_detail_no
     *
     * @return the value of public.reservation_detail.reservation_detail_no
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    public Integer getReservationDetailNo() {
        return reservationDetailNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.reservation_detail.reservation_detail_no
     *
     * @param reservationDetailNo the value for public.reservation_detail.reservation_detail_no
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    public void setReservationDetailNo(Integer reservationDetailNo) {
        this.reservationDetailNo = reservationDetailNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.reservation_detail.reservation_no
     *
     * @return the value of public.reservation_detail.reservation_no
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    public Integer getReservationNo() {
        return reservationNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.reservation_detail.reservation_no
     *
     * @param reservationNo the value for public.reservation_detail.reservation_no
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    public void setReservationNo(Integer reservationNo) {
        this.reservationNo = reservationNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.reservation_detail.seat_name
     *
     * @return the value of public.reservation_detail.seat_name
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    public String getSeatName() {
        return seatName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.reservation_detail.seat_name
     *
     * @param seatName the value for public.reservation_detail.seat_name
     *
     * @mbg.generated Sat May 20 09:09:10 JST 2023
     */
    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }
}