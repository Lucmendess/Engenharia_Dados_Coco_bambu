CREATE TABLE MenuItem (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  price DECIMAL(10, 2)
);

CREATE TABLE Discount (
  discountId INT PRIMARY KEY,
  amount DECIMAL(10, 2)
);

CREATE TABLE ServiceCharge (
  serviceChargeId INT PRIMARY KEY,
  amount DECIMAL(10, 2)
);

CREATE TABLE TenderMedia (
  tenderId INT PRIMARY KEY,
  type VARCHAR(50),
  amount DECIMAL(10, 2)
);

CREATE TABLE ErrorCode (
  errorId INT PRIMARY KEY,
  message VARCHAR(255)
);

CREATE TABLE OrderDetail (
  orderDetailId INT PRIMARY KEY AUTO_INCREMENT,
  menuItemId INT,
  quantity INT,
  discountId INT,
  serviceChargeId INT,
  tenderId INT,
  errorId INT,
  FOREIGN KEY (menuItemId) REFERENCES MenuItem(id),
  FOREIGN KEY (discountId) REFERENCES Discount(discountId),
  FOREIGN KEY (serviceChargeId) REFERENCES ServiceCharge(serviceChargeId),
  FOREIGN KEY (tenderId) REFERENCES TenderMedia(tenderId),
  FOREIGN KEY (errorId) REFERENCES ErrorCode(errorId)
);