Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 647BD53DD51
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jun 2022 19:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351436AbiFERQg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Jun 2022 13:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351458AbiFERQY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Jun 2022 13:16:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 605FC4EA09;
        Sun,  5 Jun 2022 10:16:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E960EB80B89;
        Sun,  5 Jun 2022 17:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6C51C34119;
        Sun,  5 Jun 2022 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654449380;
        bh=0BgI3hhFy5lYKXKU4fTE2ttt/eeLyDKlDmxUcoy9RY8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Prq65BalKSlz/EMZ+oLrjBkeTVtDgvVIAA9JQfZGu+P1XKMSwGjmTkkspvmR4stWK
         yKMUXxidEzOg/vQujN5q4TB9omq3Da3WjQANOqisNRJ3ZFGwF0A/hNWUQ8wv11PYPC
         Zgv2IcsaPoiOanuuLpxhhyLwVdEkYJSiUj4mja4rh+/RxSjvDje3UBTC127ftWEzEh
         t2bDEAwKVWwfhpiJek+6DKyuINfVM39EKknCsB5hRU2n0kZ0tcRqRKB32x2E8PUVhZ
         3DUayFCueZUlHG6i+YEWKIpwdDrh+c37K6MrDHsNvbTFeVcUqBIjXmKpZ9FIqQ8B3F
         xc8R/Mx42WiKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8729DF03950;
        Sun,  5 Jun 2022 17:16:20 +0000 (UTC)
Subject: Re: [GIT PULL v2] More Kbuild updates for v5.19-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQsyk-bGm82PgbHtJmxgoJVhYtM9T6PMm6BD1vuHbwL6g@mail.gmail.com>
References: <CAK7LNAQsyk-bGm82PgbHtJmxgoJVhYtM9T6PMm6BD1vuHbwL6g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQsyk-bGm82PgbHtJmxgoJVhYtM9T6PMm6BD1vuHbwL6g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.19-3
X-PR-Tracked-Commit-Id: 42ce60aa5aa46ae00f71aa806a11510b6db6d1a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 71e80720dbf0f08c6979e54f21ddaa5735ce742d
Message-Id: <165444938054.7539.8330986999651784254.pr-tracker-bot@kernel.org>
Date:   Sun, 05 Jun 2022 17:16:20 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 5 Jun 2022 06:43:49 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/71e80720dbf0f08c6979e54f21ddaa5735ce742d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
