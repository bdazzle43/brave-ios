// Copyright 2023 The Brave Authors. All rights reserved.
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import Foundation
import BraveCore

/// A helper class that helps us clean urls for "clean copy" feature
class CleanURLService {
  public static let shared = CleanURLService()
  private weak var urlSanitizerService: URLSanitizerService?
  
  /// Initialize this instance with a network manager
  init() {}

  /// Setup this downloader with rule `JSON` data.
  ///
  /// - Note: Decoded values that have unknown types are filtered out
  func setup(with urlSanitizerService: URLSanitizerService) {
    self.urlSanitizerService = urlSanitizerService
  }
  
  /// Cleanup the url using the stored matcher
  func cleanup(url: URL) -> URL {
    return urlSanitizerService?.sanitizedURL(url) ?? url
  }
}
