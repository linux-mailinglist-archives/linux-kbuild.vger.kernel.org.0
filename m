Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EB39240047
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Aug 2020 00:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgHIWVx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 9 Aug 2020 18:21:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbgHIWVw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Aug 2020 18:21:52 -0400
Subject: Re: [GIT PULL] Kbuild updates for v5.9-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597011712;
        bh=wygO6GsHNW6snd5lVMqpAfLP9WzOqZi+nqnQ5vwffLI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=bWmgdfGGmclk2Alb+r2llcFi/ctto6CrYVsn1Ynxoos+nKHm5ysGfAspFdN8XBdVQ
         PsSYykDHsHdwOVeAOObx4/sU6ofE5htzZpwmfVk9ay8LqeIR3DfeEowZmtQN/POItE
         140TIUpBsPPWlTMYTdDlZdo+KDZS26BGP7tiUmLE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARMCg0vPjZL0o-sFr+vMu17-nFcV4v4pbLazLK8iTSQWQ@mail.gmail.com>
References: <CAK7LNARMCg0vPjZL0o-sFr+vMu17-nFcV4v4pbLazLK8iTSQWQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARMCg0vPjZL0o-sFr+vMu17-nFcV4v4pbLazLK8iTSQWQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.9
X-PR-Tracked-Commit-Id: 132305b3b474a85152302ceda4551384cce3904e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc80c51fd4b23ec007e88d4c688f2cac1b8648e7
Message-Id: <159701171249.29028.6714762932851290207.pr-tracker-bot@kernel.org>
Date:   Sun, 09 Aug 2020 22:21:52 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 10 Aug 2020 01:44:22 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc80c51fd4b23ec007e88d4c688f2cac1b8648e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
