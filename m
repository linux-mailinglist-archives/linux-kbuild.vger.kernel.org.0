Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C97AFCB23
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 17:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfKNQzK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 11:55:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:43764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726655AbfKNQzF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 11:55:05 -0500
Subject: Re: [GIT PULL] Kbuild fixes for v5.4(-rc8)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573750505;
        bh=FWK96innZUFwJLbbxQ7jYD09cgTH4QK3AYDMHe/aJE8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=NGNJL0RFRJTy6Fk842uVXLN/wRoIL10u0WvAEEmeVfewSrClauD7OOiEKCcyHSZ6r
         pnnWkVh4pDu/1SVBxgk2ngcuWU38QoFuzMo6tUjyUaz7Shz/Rvb9wbreeFsBj7MEji
         OLsDCJ3l+h0n/Nl2GXpExf/cVrkdwFDNGQ0zOlYg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATqoF-NVhkP9J7SyDmK-x8vQ5pDJ7U_aEngdJb_vvDixg@mail.gmail.com>
References: <CAK7LNATqoF-NVhkP9J7SyDmK-x8vQ5pDJ7U_aEngdJb_vvDixg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATqoF-NVhkP9J7SyDmK-x8vQ5pDJ7U_aEngdJb_vvDixg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 kbuild-fixes-v5.4-3
X-PR-Tracked-Commit-Id: 80591e61a0f7e88deaada69844e4a31280c4a38f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 96b95eff4a591dbac582c2590d067e356a18aacb
Message-Id: <157375050535.665.2266424346154790313.pr-tracker-bot@kernel.org>
Date:   Thu, 14 Nov 2019 16:55:05 +0000
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "David S. Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Fri, 15 Nov 2019 00:19:27 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild-fixes-v5.4-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/96b95eff4a591dbac582c2590d067e356a18aacb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
