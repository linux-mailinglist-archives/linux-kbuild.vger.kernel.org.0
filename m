Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB27014F96E
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 19:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgBASaS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 13:30:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:60792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726906AbgBASaS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 13:30:18 -0500
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580581817;
        bh=oULU3pJva/kYcZsBs15bn5aSnDu7Dlxsuj8csI8AoD0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jhULgHBKmrU3AWBd1tDGA3tQuda4HQx38ntzhuzDF8YIXZ7UT94q24079eRMDe6fW
         nReq5i6cLeErQLALuy5Km15XjfLDeXBEhEPfKhwN1iigzBSznR6Lt0l9Zc1y4xi8+p
         VwxtRwkk/f/1uHblydFsEE5q2hWxUwfLad7lpkEY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
References: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kconfig-v5.6
X-PR-Tracked-Commit-Id: 2b5072b9dfab1bc9e4f605bba19b4470e429c60c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 14cd0bd04907df79b36a31e55f18768172230987
Message-Id: <158058181744.4504.2265745078062648929.pr-tracker-bot@kernel.org>
Date:   Sat, 01 Feb 2020 18:30:17 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 1 Feb 2020 13:05:48 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/14cd0bd04907df79b36a31e55f18768172230987

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
