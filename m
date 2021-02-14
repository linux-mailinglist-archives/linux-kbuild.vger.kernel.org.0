Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C49A931B29A
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Feb 2021 21:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBNU71 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Feb 2021 15:59:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:50664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229934AbhBNU71 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Feb 2021 15:59:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AFD1164E26;
        Sun, 14 Feb 2021 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613336326;
        bh=D3MtH14xAs+6VQhzCzLGa/rzuf0ai+XYgOkcn3O0qIM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=mgaKNfvsw53clonZvO2CR10P3JyCMifJ/m00eMJmmvzbhw6blkPTIMGqqeckM44VT
         32ZqBPhsh1kp96PR9xue8vRZiM14A8FJ75gwNLPEGZMkcxDzapXzBOi01MSr5J76YV
         GVSFf1OUnztBwL+5xzy9mIkD84EdIIQszEOt106fp2Kp7kA40JXklW/MpMzbTa49wO
         t8W4feNm8nGfpvI/7ye84WAAghewuu0GRyUKYq2Drq4WsWqX2zyPjECwRQE2Tu5rEZ
         SmO+IYxlHmdYH3VOPrLPMoPaLvsKlDwPbbzXu9tM/LHqvYrWfsjyM3N9ZqVqF1S8jk
         W2ig7W7OyyvYA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 979C060A47;
        Sun, 14 Feb 2021 20:58:46 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v5.11
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNASpVZdyiN4Ug5zujSFnX5OesaVkFX7aP0feZHEF4DVHWQ@mail.gmail.com>
References: <CAK7LNASpVZdyiN4Ug5zujSFnX5OesaVkFX7aP0feZHEF4DVHWQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNASpVZdyiN4Ug5zujSFnX5OesaVkFX7aP0feZHEF4DVHWQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.11-3
X-PR-Tracked-Commit-Id: fe968c41ac4f4ec9ffe3c4cf16b72285f5e9674f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ab30c7f9c3ca2599f5ab3e4d29ae56453c8668e5
Message-Id: <161333632661.25612.9584045402779873330.pr-tracker-bot@kernel.org>
Date:   Sun, 14 Feb 2021 20:58:46 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 15 Feb 2021 02:02:19 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.11-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ab30c7f9c3ca2599f5ab3e4d29ae56453c8668e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
