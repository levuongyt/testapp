## Highlight Dialog
## Mô tả
Sử dụng dữ liệu file .toml và file âm thanh có định dạng .oga để xử lý và highlight từ đồng bộ với thời gian audio đang phát. Và thực hiện sự kiện chèn ảnh dựa vào timeEllsed, để ảnh xuất hiện và chuyển đổi ảnh.

## Cấu trúc dự án
- Assets: Chứa các file dữ liệu (output.oga, output.toml).
- Model: Chứa cấu trúc dữ liệu và các phương pháp xử lý thông tin từ tệp TOML.
- Controller: Chứa logic xử lí (tải dữ liệu, xử lí âm thanh).
- View: Giao diện người dùng

- Các thư viện sử dụng : get, audioplayers(phát âm thanh audio) , toml(xử lý dữ liệu dạng file .toml .

## Chi tiết các phần

# Model:
- Xử lý dữ liệu từ tệp .toml ,
- AudioInfo: Chứa thông tin về audio như nguồn phát, tốc độ, số kênh, và ngôn ngữ.
- Timestamp: Định nghĩa các mốc thời gian, vị trí, độ dài từ cho từng từ trong đoạn hội thoại.
- Event: Chứa thông tin về các sự kiện xảy ra trong ứng dụng (ví dụ: thay đổi hình ảnh).
- BookModel: Mô hình chính chứa toàn bộ thông tin từ tệp TOML.

# Controller:
- Tải dữ liệu từ tệp TOML và âm thanh từ tệp audio
- Điều khiển phát, tạm dừng và theo dõi tiến trình audio.
- Cập nhật trạng thái giao diện theo thời gian thực dựa trên vị trí audio.

Các hàm chính:
- LoadData :  Tải tệp TOML từ thư mục `assets` và chuyển đổi thành mô hình `BookModel`. Xử lý lỗi khi tệp không hợp lệ hoặc thiếu dữ liệu.

- startOrResumeReading:
  - Bắt đầu hoặc tiếp tục phát audio.
  - Quản lý trạng thái `isPlaying` để xác định trạng thái hiện tại của audio.

- pauseReading:
  - Tạm dừng phát audio và dừng bộ đếm thời gian.

- startReading:
  - Dùng bộ đếm thời gian (`Timer.periodic`) để theo dõi thời gian phát audio và cập nhật giao diện tương ứng.

# View
Hiển thị giao diện người dùng:

- Vùng hiển thị ảnh động sau khi chèn và thay đổi theo timeElapsed trong event (dữ liệu file output.toml).
- Hội thoại hiển thị dưới dạng các khung tin nhắn với màu sắc riêng để phân biệt các nhân vật (dựa vào speaker để lấy name và phân biệt đoạn văn bản của từng người).
- Nút điều khiển dừng, phát âm thanh.

- Hàm : _buildMessageBubbles
  - Mục đích là hiển thị các đoạn văn bản của từng nhân vật, (Duyệt qua các đoạn hội thoại trong dữ liệu book.dialog. Tạo các widget Align để căn chỉnh tin nhắn về bên trái hoặc phải tùy thuộc vào người nói).
- Hàm: _buildHighlightedText
  - Mục đích là highlight tô vàng các từ đang được phát âm dựa vào timestamp và vị trí đang phát của audio. Sử dụng các hiệu ứng như backgroundColor để tô màu và đánh dấu từ đang highlight.
- Hàm: _buildControlPanel
  - Mục đích để điều khiển phát hoặc tạm dừng Audio dựa vào trạng thái isPlaying từ controller bằng Obx.


