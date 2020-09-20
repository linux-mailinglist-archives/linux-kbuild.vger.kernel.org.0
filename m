Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C678E27167A
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Sep 2020 20:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgITSAZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Sep 2020 14:00:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbgITSAX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 14:00:23 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.9-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600624823;
        bh=+TPj2ppJE2V72IHsE7yHamA3FIjyVcu0IB/2hTOMdsk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=H1tPz6kZVJOihaHuuhFMvv52zqQQN9asUyF9h+cc/c2qUtmNDyXLRnHa+FxLksQw4
         rn2YCI802AIF8uZ5+uwMyqesRSoiVxXWrLQx+HeQndnRO07WdUaJREf/Po0ztpMee1
         0Dlp0Wl72TKZElXjVrRzk7Wr92K3I5vOxwFfO2K0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQPTUCWVk=xDr9bv6X+TANOZHfr4YKenP64Mq+sgFTmDw@mail.gmail.com>
References: <CAK7LNAQPTUCWVk=xDr9bv6X+TANOZHfr4YKenP64Mq+sgFTmDw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQPTUCWVk=xDr9bv6X+TANOZHfr4YKenP64Mq+sgFTmDw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.9-3
X-PR-Tracked-Commit-Id: a46afd11414758233f23798cc5be51e554d04efe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c7948fe9bada1b335de1cbe8a1fd02e2ccecaa6b
Message-Id: <160062482315.2021.4752322997186984202.pr-tracker-bot@kernel.org>
Date:   Sun, 20 Sep 2020 18:00:23 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 20 Sep 2020 13:01:27 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.9-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c7948fe9bada1b335de1cbe8a1fd02e2ccecaa6b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
