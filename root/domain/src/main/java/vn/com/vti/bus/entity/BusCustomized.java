package vn.com.vti.bus.entity;

public class BusCustomized {
	
	private Integer busId;
	private Integer routeId;
	private Integer rowNum;
	private Integer columnNum;
	private String numberPlace;
	private String numberDivision;
	private String numberKana;
	private String numberFirstHalf;
	private String numberLatterHalf;
	private String fullNameLabel;
	
	public Integer getBusId() {
		return busId;
	}

	public void setBusId(Integer busId) {
		this.busId = busId;
	}

	public Integer getRouteId() {
		return routeId;
	}

	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
	}

	public Integer getRowNum() {
		return rowNum;
	}

	public void setRowNum(Integer rowNum) {
		this.rowNum = rowNum;
	}

	public Integer getColumnNum() {
		return columnNum;
	}

	public void setColumnNum(Integer columnNum) {
		this.columnNum = columnNum;
	}

	public String getNumberPlace() {
		return numberPlace;
	}

	public void setNumberPlace(String numberPlace) {
		this.numberPlace = numberPlace;
	}

	public String getNumberDivision() {
		return numberDivision;
	}

	public void setNumberDivision(String numberDivision) {
		this.numberDivision = numberDivision;
	}

	public String getNumberKana() {
		return numberKana;
	}

	public void setNumberKana(String numberKana) {
		this.numberKana = numberKana;
	}

	public String getNumberFirstHalf() {
		return numberFirstHalf;
	}

	public void setNumberFirstHalf(String numberFirstHalf) {
		this.numberFirstHalf = numberFirstHalf;
	}

	public String getNumberLatterHalf() {
		return numberLatterHalf;
	}

	public void setNumberLatterHalf(String numberLatterHalf) {
		this.numberLatterHalf = numberLatterHalf;
	}

	public String getFullNameLabel() {
		String fullNameLabel = numberPlace+" "
				+numberDivision+" "
				+numberKana+" "
				+numberFirstHalf+"-"
				+numberLatterHalf+" "
				+columnNum +"列ｘ"+
				+rowNum;
		return fullNameLabel;
	}

	public void setFullNameLabel(String fullNameLabel) {
		this.fullNameLabel = fullNameLabel;
	}
}