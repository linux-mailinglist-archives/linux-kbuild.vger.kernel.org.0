Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A3D449AE5
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Nov 2021 18:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240849AbhKHRmE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Nov 2021 12:42:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:50020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240830AbhKHRmE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Nov 2021 12:42:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B329761360;
        Mon,  8 Nov 2021 17:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636393159;
        bh=lgxFqKzkQw+oex5qJuaspbbMApMRtFjyGnKYyHHWhLE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=pVHs7OO8K2rFDo5rvxZizabv2G1IxQD7TVeZbSdRaVkbhu/BWf8YKZzWgi4pMyCIy
         XrLOYV+Aj1qU3DORA6vCSFjs9l8To5+04m8k5egTEyoIZmkQD9wSL6yeIIhNmmT9g/
         3qGFcS2qFq71HUf6CjPxFER2XWhUVHT7nskhYhexsCL0pNgOIhwd1d0svZKxbqN9Jx
         LUP0Scuc2EUMRADVTxorBxunaCePR76EJxiYyIjkg1qc3Zz4XECmqbKR3piQ2YwefG
         QTQDhlH5Gdb3XH4zKFt4qA0xKmi1wjwr9rMhNHOAuuXzjrzqAzGIu/Eym9Qz3MIBbg
         i8Y1pXQI+kbUg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9E71960985;
        Mon,  8 Nov 2021 17:39:19 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v5.16-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARr1q9YfXRZy+uo9WRA6iNj2kkA9=ba0N1CtMc8NFtVvA@mail.gmail.com>
References: <CAK7LNARr1q9YfXRZy+uo9WRA6iNj2kkA9=ba0N1CtMc8NFtVvA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARr1q9YfXRZy+uo9WRA6iNj2kkA9=ba0N1CtMc8NFtVvA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild-v5.16
X-PR-Tracked-Commit-Id: 8212f8986d311ccf6a72305e6bdbd814691701d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e9ed9360f80d13e41684ca458f01fdf922c7c57
Message-Id: <163639315959.31155.8354701681965359176.pr-tracker-bot@kernel.org>
Date:   Mon, 08 Nov 2021 17:39:19 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 6 Nov 2021 23:45:44 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild-v5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e9ed9360f80d13e41684ca458f01fdf922c7c57

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
