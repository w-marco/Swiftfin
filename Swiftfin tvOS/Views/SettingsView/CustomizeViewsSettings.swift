//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2024 Jellyfin & Jellyfin Contributors
//

import Defaults
import SwiftUI

struct CustomizeViewsSettings: View {

    @Default(.Customization.shouldShowMissingSeasons)
    private var shouldShowMissingSeasons
    @Default(.Customization.shouldShowMissingEpisodes)
    private var shouldShowMissingEpisodes

    @Default(.Customization.showPosterLabels)
    private var showPosterLabels
    @Default(.Customization.nextUpPosterType)
    private var nextUpPosterType
    @Default(.Customization.recentlyAddedPosterType)
    private var recentlyAddedPosterType
    @Default(.Customization.latestInLibraryPosterType)
    private var latestInLibraryPosterType
    @Default(.Customization.similarPosterType)
    private var similarPosterType
    @Default(.Customization.searchPosterType)
    private var searchPosterType
    @Default(.Customization.Library.displayType)
    private var libraryViewType

    @Default(.Customization.Library.cinematicBackground)
    private var cinematicBackground
    @Default(.Customization.Library.randomImage)
    private var libraryRandomImage
    @Default(.Customization.Library.showFavorites)
    private var showFavorites
    @Default(.Customization.showRecentlyAdded)
    private var showRecentlyAdded

    @EnvironmentObject
    private var router: CustomizeSettingsCoordinator.Router

    var body: some View {
        SplitFormWindowView()
            .descriptionView {
                Image(systemName: "gearshape")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400)
            }
            .contentView {

                Section(L10n.missingItems) {

                    Toggle(L10n.showMissingSeasons, isOn: $shouldShowMissingSeasons)

                    Toggle(L10n.showMissingEpisodes, isOn: $shouldShowMissingEpisodes)
                }

                Section(L10n.posters) {

                    ChevronButton(L10n.indicators)
                        .onSelect {
                            router.route(to: \.indicatorSettings)
                        }

                    Toggle(L10n.showPosterLabels, isOn: $showPosterLabels)

                    InlineEnumToggle(title: L10n.next, selection: $nextUpPosterType)

                    InlineEnumToggle(title: L10n.recentlyAdded, selection: $recentlyAddedPosterType)

                    InlineEnumToggle(title: L10n.latestWithString(L10n.library), selection: $latestInLibraryPosterType)

                    InlineEnumToggle(title: L10n.recommended, selection: $similarPosterType)

                    InlineEnumToggle(title: L10n.search, selection: $searchPosterType)

                    InlineEnumToggle(title: L10n.library, selection: $libraryViewType)
                }

                Section(L10n.library) {

                    Toggle(L10n.cinematicBackground, isOn: $cinematicBackground)

                    Toggle(L10n.randomImage, isOn: $libraryRandomImage)

                    Toggle(L10n.showFavorites, isOn: $showFavorites)

                    Toggle(L10n.showRecentlyAdded, isOn: $showRecentlyAdded)
                }
            }
            .withDescriptionTopPadding()
            .navigationTitle(L10n.customize)
    }
}
