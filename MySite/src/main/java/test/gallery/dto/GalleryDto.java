package test.gallery.dto;

public class GalleryDto {
	private int num;
	private String name;
	private String subject;
	private String regdate;
	private String passwd;
	private int readcnt;
	private String filename;
	private long filesize;
	
	public GalleryDto() {}

	public GalleryDto(int num, String name, String subject, String regdate, String passwd, int readcnt, String filename,
			long filesize) {
		super();
		this.num = num;
		this.name = name;
		this.subject = subject;
		this.regdate = regdate;
		this.passwd = passwd;
		this.readcnt = readcnt;
		this.filename = filename;
		this.filesize = filesize;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	@Override
	public String toString() {
		return "GalleryDto [num=" + num + ", name=" + name + ", subject="
				+ subject + ", regdate=" + regdate + ", passwd=" + passwd
				+ ", readcnt=" + readcnt + ", filename=" + filename
				+ ", filesize=" + filesize + "]";
	}
}
