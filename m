Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F292E1026
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Dec 2020 23:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgLVWY5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Dec 2020 17:24:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:49810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727678AbgLVWYo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Dec 2020 17:24:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E762A207B6;
        Tue, 22 Dec 2020 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608675843;
        bh=vWpickTcNVtSiOTDDq+grRbDuVI2zI3IY1ID7efspbo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MOMdjaPDF9kwpgu8Ova2TIdLdHtQGsoo6XsZOTuK1N6i/kGy+n4wHv16IV8+h9OU0
         JEp0gdImAp+m1ifu7KFhEb71ya07iZoxjXMi1Byhob4+i5BYU6Hlv/6ephbQBPzVUX
         WXOBhvU5lzT0kTF/JPDNVRGK7RHBvWSxEBSUzdHwJvFTTSOpv9cLWMfnz3R43eAuao
         Un4mIBh1m5dorJ7LWtN2yDwceznAE5SG0G0Yt1881MSvklC6uA/49CcPEiqIH9D3Ab
         Hx9R93UNBJg9NMYIGLqviViii4l2GhzxPx7R6xTfen/jXbUz6QcNZU4yb76YIsQ59F
         A5IISXoIqAs8A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E213B6019C;
        Tue, 22 Dec 2020 22:24:03 +0000 (UTC)
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.11-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARRsx+bTOW+y-u8z91NvBZfC9HMbB0i1if+SbjMh=vNpA@mail.gmail.com>
References: <CAK7LNARRsx+bTOW+y-u8z91NvBZfC9HMbB0i1if+SbjMh=vNpA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARRsx+bTOW+y-u8z91NvBZfC9HMbB0i1if+SbjMh=vNpA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.11
X-PR-Tracked-Commit-Id: 90d39628ac799e93c0f7a56763eed5029632f1ba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2762db756f422861c70868bc2d4b9b5d1ce6a59d
Message-Id: <160867584391.8550.18422428341479856490.pr-tracker-bot@kernel.org>
Date:   Tue, 22 Dec 2020 22:24:03 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Wed, 23 Dec 2020 01:47:55 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2762db756f422861c70868bc2d4b9b5d1ce6a59d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
