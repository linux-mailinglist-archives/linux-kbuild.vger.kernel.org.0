Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010EB3126A7
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Feb 2021 19:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbhBGS3t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Feb 2021 13:29:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:57372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229445AbhBGS3s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Feb 2021 13:29:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7488164DDD;
        Sun,  7 Feb 2021 18:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612722548;
        bh=kWwuqdEBEO0BC2yHvOEJmSzkLX9BsYmMkjaWNDuuYRg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=e6WD1lviKHT7J/uEuOlxp1IhzJKE0W9qCd5shQg449Giim53W18FT6LzSdI40+HUb
         GUdyS1ns5Xz/Do6xaxbdkNllkOJ8ei1/Uc8ScLBKCBYjbXTCvldDFkkrIEMkL7BsCd
         PbiiZQyHJ95PYe1yuyQ27i/3Chlj+fruAYupBP5lEw0GLmtYJ6KbJe47b8bwWpSW2f
         300/TRSkohYyjr14A0X6z8T4FYgGpB/xMCVm9CrtN6ewcFWwZxs550V6q+niaaVClx
         awpbkPrDZZxGXl28gqGqC1hKMMf7vlhMM/b9KmOM3Z1SUzPjh/S3IGhBXd+NlO/j9W
         7S9ZE/tDdaA5g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5654B609FE;
        Sun,  7 Feb 2021 18:29:08 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v5.11-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQsGyFpJcXYoeH7_vAzsw+9K1w0tDdHN=vxKDO+a-v70A@mail.gmail.com>
References: <CAK7LNAQsGyFpJcXYoeH7_vAzsw+9K1w0tDdHN=vxKDO+a-v70A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQsGyFpJcXYoeH7_vAzsw+9K1w0tDdHN=vxKDO+a-v70A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.11-2
X-PR-Tracked-Commit-Id: efe6e3068067212b85c2d0474b5ee3b2d0c7adab
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2db138bb9fa10f5652f55d3c3f427af54626a086
Message-Id: <161272254829.27145.9788210364439647296.pr-tracker-bot@kernel.org>
Date:   Sun, 07 Feb 2021 18:29:08 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 7 Feb 2021 11:32:52 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2db138bb9fa10f5652f55d3c3f427af54626a086

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
