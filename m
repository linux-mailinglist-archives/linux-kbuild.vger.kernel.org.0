Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0993676C8
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jul 2019 01:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbfGLXUU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 19:20:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:40474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728500AbfGLXUU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 19:20:20 -0400
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.3-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562973619;
        bh=N7ZVU4Jq8rA0/blsoFcLHXpIiOB1IyhKUGetPw+izNM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=xouq5Zhw8mq0DHFJlcuyoKAKb2tJaZiR4T5nNhZ+5AE/npzZ7C0E03C0Mt0Qdmjm6
         cim6ulPGXxD6PlvUl4hudxNNbKwFKsTZt7Z08EXtsZWKqzHC535Ksv0pG9zr/zVyoj
         QO8mkXjj/xaefaHE4K/3Bd4Jh2ZOLgFV9VYKdaVY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQAs0fGSXnv_Un7bL1PbtbRtu2tTUrCsQv-jt_o_1R3VA@mail.gmail.com>
References: <CAK7LNAQAs0fGSXnv_Un7bL1PbtbRtu2tTUrCsQv-jt_o_1R3VA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQAs0fGSXnv_Un7bL1PbtbRtu2tTUrCsQv-jt_o_1R3VA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kconfig-v5.3
X-PR-Tracked-Commit-Id: e3cd5136a4ecece6a7599a07add0dfb811a7f49d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 106f1466e7e7057ec6f4dc9516c13ea8cb9dffa0
Message-Id: <156297361943.22922.12349210612962726424.pr-tracker-bot@kernel.org>
Date:   Fri, 12 Jul 2019 23:20:19 +0000
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        masahiroy@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 13 Jul 2019 02:54:42 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/106f1466e7e7057ec6f4dc9516c13ea8cb9dffa0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
