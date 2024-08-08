//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Factory
import SwiftUI

class DownloadListViewModel: ViewModel {

    @Injected(\.downloadManager)
    private var downloadManager

    @Published
    var items: [DownloadTask] = []

    override init() {
        super.init()

        items = downloadManager.downloadedItems()
    }
}
