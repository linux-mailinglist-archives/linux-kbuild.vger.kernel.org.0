Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA362E101C
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Dec 2020 23:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgLVWYo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Dec 2020 17:24:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:49794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgLVWYo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Dec 2020 17:24:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A4F7122573;
        Tue, 22 Dec 2020 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608675843;
        bh=23llmvXzIqjRTnOmAOox5jxxWEjd5zstVXSH9Wu2/gs=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=U+DqPni6N5EfiutmeLOabwxtrWva+uUPDPbYF+yoXb43XmmUIVhMiFww+NfRixoKl
         L5kj6wwVqApCZNgu0LaD0CZEpE8IIktFjoS0IgIfE6M/5pXs47KIVQS5AnH8zAFq45
         9a2RjGg15v6vM+G+Oa1DL8/vLd5HDGFpb4RWlK2vBx9/g4g0AG5eVFun8syNl3SuAt
         IMyTtBwrdYGYIY4RpHzn8YBlaiwdAAwa/iundxdT04uwF1st6LMx6IrWCWSbc05MGC
         F5MOGZsGC6gwPXnQfyM/35Ed7jEXXoVqy7Gd52CROAs2a5HbuRmSaABu48pWgCgb+t
         hh8KIrH+e+KfQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 9E32960113;
        Tue, 22 Dec 2020 22:24:03 +0000 (UTC)
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.11-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQbWcXRFd55DkUVrcr9Z2yjUOV-3qnkjrjr3VOC5JDOXA@mail.gmail.com>
References: <CAK7LNAQbWcXRFd55DkUVrcr9Z2yjUOV-3qnkjrjr3VOC5JDOXA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQbWcXRFd55DkUVrcr9Z2yjUOV-3qnkjrjr3VOC5JDOXA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.11
X-PR-Tracked-Commit-Id: 18084e435ff6e47197542db6bab98bafaa4c7b68
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b95f0563ab5a8f75195cdd4b2c3325c0c1df319
Message-Id: <160867584364.8550.7676128630676687159.pr-tracker-bot@kernel.org>
Date:   Tue, 22 Dec 2020 22:24:03 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Wed, 23 Dec 2020 01:45:59 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b95f0563ab5a8f75195cdd4b2c3325c0c1df319

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
