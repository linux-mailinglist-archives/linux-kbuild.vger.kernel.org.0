Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD483972C
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2019 23:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbfFGVAN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Jun 2019 17:00:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:36150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730740AbfFGVAM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jun 2019 17:00:12 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.2-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559941212;
        bh=qUiTD/dsBmED2JaZcS8ytEiu7iFpnKUam9jTCI7bGzs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=uLrHICDXLhehQqdkCax6ULkTpvEd06MOlnJmrI1fAfxaKpToUPIDmduUACL7NpF2/
         EsVCRP3u8zGYLZBuIrQiq46e77MUTIm9mvOpgdL0lPf0OwlrU5byaBUHwSZcowlRYq
         ciRKoXpY7J1kfXZOwnz0UaUwKBoaOg5qV+0abcwE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQZ2FAZcc367eCPqhwYRVvP+65hDa5hx6qfTwh2qVGL=w@mail.gmail.com>
References: <CAK7LNAQZ2FAZcc367eCPqhwYRVvP+65hDa5hx6qfTwh2qVGL=w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQZ2FAZcc367eCPqhwYRVvP+65hDa5hx6qfTwh2qVGL=w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.2-2
X-PR-Tracked-Commit-Id: 913ab9780fc021298949cc5514d6255a008e69f9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 33de0d1c68a5127e923363349c349d90c7da06a1
Message-Id: <155994121244.4194.14272650752821099142.pr-tracker-bot@kernel.org>
Date:   Fri, 07 Jun 2019 21:00:12 +0000
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 8 Jun 2019 00:52:56 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/33de0d1c68a5127e923363349c349d90c7da06a1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
