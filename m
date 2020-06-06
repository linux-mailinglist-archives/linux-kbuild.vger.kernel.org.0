Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B77A1F0840
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2020 21:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgFFTPT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jun 2020 15:15:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728921AbgFFTPS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jun 2020 15:15:18 -0400
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.8-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591470917;
        bh=K5GJMx7rCNzstOXFP+DBWMPeBcYjdXKZbdmkdK6QnT8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=b76N+5XwrCLEcdGqdj+e98LV06gYG6FHn/srP6D2e8M2UVrpY7bEAh4VyHVftlryW
         csT0t7Kl+lhP/tL2fltLveHy+Zki/siylR05t/hcq1YQGik6UFvUf1fdrBoEUgcGy1
         il5Hysvv1QzITHuSxrpkPhPD8uM3QK6SSpgbJIos=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNASjL_SbPUC1PJNx3Fqv0WjcgQkOMtBkim=F-xdzqAzhkg@mail.gmail.com>
References: <CAK7LNASjL_SbPUC1PJNx3Fqv0WjcgQkOMtBkim=F-xdzqAzhkg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNASjL_SbPUC1PJNx3Fqv0WjcgQkOMtBkim=F-xdzqAzhkg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kconfig-v5.8
X-PR-Tracked-Commit-Id: bcfefb61cd2bc86329915a4074f7b4c48b00b33a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b170290c2836c40ab565736ba37681eb3dfd79b8
Message-Id: <159147091741.3313.15409007733361221136.pr-tracker-bot@kernel.org>
Date:   Sat, 06 Jun 2020 19:15:17 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 7 Jun 2020 00:21:54 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b170290c2836c40ab565736ba37681eb3dfd79b8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
