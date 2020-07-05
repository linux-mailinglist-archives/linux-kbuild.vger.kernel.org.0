Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFF8214F12
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jul 2020 21:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgGETzG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Jul 2020 15:55:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727891AbgGETzG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Jul 2020 15:55:06 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.8-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593978906;
        bh=XDu23HySQ1kWEBMi2YiS5y2kJbE33vur8zlbHgAtVAA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ZJXr0gWN1sFt5OUlpoTQTsGE8PObDEMqar9LothXkcaO2ZYBfFArLU36/PfsSrT7m
         dKyoAZtbF/SCfJmVejCv6VJ5OiJLBEjwp1vQhI5W/Gr6zdSyNPBBPAThW2QTLwybbq
         3eAahOSI+8N2zjIcahi9KWvnBUVFVQnemvfesYVI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQEMNSM2PRaTwPoX+2hn3FpU2=kQEyJdFjH2xkz+eq5gg@mail.gmail.com>
References: <CAK7LNAQEMNSM2PRaTwPoX+2hn3FpU2=kQEyJdFjH2xkz+eq5gg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQEMNSM2PRaTwPoX+2hn3FpU2=kQEyJdFjH2xkz+eq5gg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.8-2
X-PR-Tracked-Commit-Id: ba77dca584f5abf30340672bc752fe7912731af5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4bc927367db11d8c5b1e20d05729f1ee748791b9
Message-Id: <159397890594.7489.740680151892513260.pr-tracker-bot@kernel.org>
Date:   Sun, 05 Jul 2020 19:55:05 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 6 Jul 2020 00:13:09 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.8-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4bc927367db11d8c5b1e20d05729f1ee748791b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
