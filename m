Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FD6244E67
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Aug 2020 20:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgHNSO5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 Aug 2020 14:14:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:42602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgHNSO5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 Aug 2020 14:14:57 -0400
Subject: Re: [GIT PULL] Kconfig updates for v5.9-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597428896;
        bh=QiZc1eQ6x5fmoF2ni7WysBVrSj9Ac0MjPW0YHkktkM0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=NvbBExc0+/kbpNnsE3D+XAIxmDJdCh48tado4ycWQMCPoc40CZUDQnDSzWNLWkxs1
         Jw2Fqo9oxGLGUHRhaCfDW3sNc30O1D1reBwiLFIXf2Yqnuq410DeUZQmyMbbuERV/4
         sykgy+eJM9+EPhtAf0aMhAVHiQRsJuVO61orS5/s=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQh7gsicKmSFrLExH=a=spMMeYRDkFGB53Da7gcAUCFDg@mail.gmail.com>
References: <CAK7LNAQh7gsicKmSFrLExH=a=spMMeYRDkFGB53Da7gcAUCFDg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQh7gsicKmSFrLExH=a=spMMeYRDkFGB53Da7gcAUCFDg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.9
X-PR-Tracked-Commit-Id: d4bbe8a1b55aeaadfa0fa982b468eaec9b799f1a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 32b2ee5cea4d281f4f3f5a34d6363d1841422040
Message-Id: <159742889689.14620.10465141626126413101.pr-tracker-bot@kernel.org>
Date:   Fri, 14 Aug 2020 18:14:56 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Fri, 14 Aug 2020 14:01:22 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/32b2ee5cea4d281f4f3f5a34d6363d1841422040

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
