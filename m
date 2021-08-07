Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D14C3E3697
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Aug 2021 20:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhHGSWI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Aug 2021 14:22:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:59862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229517AbhHGSWH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Aug 2021 14:22:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2902960F25;
        Sat,  7 Aug 2021 18:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628360510;
        bh=YdrdLO7yZ1vBaVAS1TPrUb5+NYurbJhCghEXLHN2GOk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=hNirOPrDAAlIUaawoqfY+PT3utZpy3CyR/6cxP5cILE4GMi+fOM36IKRGW/wzekEu
         7CRYqOzCl0shgwOfdZCAUJ9lctBENrnOms/PjHAAZT3ZCtspeQb3pG209ckk4j/mSt
         qWvk4n9+R7boO+t5gG1YAxd58DKOxtn4ZX6Hp2wMYDaWAXYKWMywBV2tovvhCN8qBZ
         hxeeswTbrjRc4Kg8tg8N0KwHaZhVzLbThayUJJ0PLOXwUHIgiSl4KUcwrp8p8/4Uaj
         EHT3jkQcLmF85Boz5SO73lkFHAmdsG4ZymOV6zz7/VBggVojffpvd+1bTz0mhLD8Bb
         1E9CfIC5ne18A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 13E2460A7C;
        Sat,  7 Aug 2021 18:21:50 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v5.14-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQ_j+c3q+y74HXFbbE1G4w3ug5t4Dk2H1BritppEi0sEA@mail.gmail.com>
References: <CAK7LNAQ_j+c3q+y74HXFbbE1G4w3ug5t4Dk2H1BritppEi0sEA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQ_j+c3q+y74HXFbbE1G4w3ug5t4Dk2H1BritppEi0sEA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.14-2
X-PR-Tracked-Commit-Id: 14ccc638b02f9ec500c17d9e39efe979145a4b61
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4972bb90c3956817c8e0eea15a348ab635d1acdd
Message-Id: <162836051002.5679.13844432134010825248.pr-tracker-bot@kernel.org>
Date:   Sat, 07 Aug 2021 18:21:50 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 7 Aug 2021 23:27:39 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4972bb90c3956817c8e0eea15a348ab635d1acdd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
