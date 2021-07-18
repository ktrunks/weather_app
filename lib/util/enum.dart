/// progress loader
enum ProgressIndicatorStatus { display, dismiss }

/// error widget status
enum ErrorDisplayStatus { display, dismiss }

enum ApplicationDataStatus {
  ideal,
  loading,
  ResponseData,
  ResponseError,
  ResponseEmpty,
  NetworkError
}

enum ShopScreenContent {
  home,
  shiftReport,
  dailyReport,
  emailSettings,
  addUser,
  changePassword,
  boxCount,
  profitPercentage,
  aiResultPercentage,
  settlementDay,
  support,
  locationList,
  reset,
  removeLastShift,
  verifyAndStolenTickers,
  artificialIntelligence,

  ///
  updateInventory,
  activate,
  inactivate,
  addSoldOut,
  returns,
  settlements,
  fixBeginningNumber,
  fixSoloOutReturn,
  changeBox,
  settings,
  printReport,
  aboutLai,
  userManual,
  barCodeScannerCT007,
  barCodeScannerTerra,
  installationGuid,
  logout,

  ///
  shiftDetail,
  shiftEdit,
  pdfView,
  pdfDisplay
}

enum HamburgerMenu { left, right }

enum PdfPrintType { dailyReport }

enum ScanMode { manual, phoneScanner }

enum CloseShift { manual, automatic, autoSubmit }

enum UpdateInventorySetting { automatic, autoSubmit }

enum ActiveDefaultPackPosition { maximumNumber, scanNumber }

enum TicketValueOrder { ascending, descending }

enum DefaultCheckBoxSelection { check, unCheck }

enum InstallationMode { normal, installationMode }

enum StoreTimer { twelveHour, twentyFourHour }
