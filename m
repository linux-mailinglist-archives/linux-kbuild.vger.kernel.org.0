Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C9610F4AB
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2019 02:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfLCBuT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Dec 2019 20:50:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:43830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfLCBuS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Dec 2019 20:50:18 -0500
Subject: Re: [GIT PULL] Kbuild updates for v5.5-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575337818;
        bh=GFOPyX4h1S+TFPIwPXMI8l7xaLr+XBKZ3OgnZ96NK/c=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=A7IiA6XzS/t7mQbmoMqSn0J8PEqTs/X3jWyOhQxzS0kQ8d+hvIV1VEnOnvlTNF6vw
         dqsVbBC3YOPb13DHYNAGj/FK6rfgnhz5D87TANVhqsRGen6BVyXfMTHA2ztev/Spyu
         dbBvzeSJGLuPTMmCV5pfA4E7bnDvstiJXC7U0Csc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATG5bPOn5qD8=NAJP8LwicV0hO4W8WBE8LFgOczEePBKg@mail.gmail.com>
References: <CAK7LNATG5bPOn5qD8=NAJP8LwicV0hO4W8WBE8LFgOczEePBKg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATG5bPOn5qD8=NAJP8LwicV0hO4W8WBE8LFgOczEePBKg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-v5.5
X-PR-Tracked-Commit-Id: d21b7e6b985c15ff75e8668b0282ec5104391901
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 76bb8b05960c3d1668e6bee7624ed886cbd135ba
Message-Id: <157533781822.21520.1691648592118637754.pr-tracker-bot@kernel.org>
Date:   Tue, 03 Dec 2019 01:50:18 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Tue, 3 Dec 2019 01:24:02 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/76bb8b05960c3d1668e6bee7624ed886cbd135ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
