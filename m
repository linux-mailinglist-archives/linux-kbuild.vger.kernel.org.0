Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F121F837
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 18:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbfEOQKT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 12:10:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:52678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727414AbfEOQKT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 12:10:19 -0400
Subject: Re: [GIT PULL] Kconfig updates for v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557936618;
        bh=Oj1eADJ6J449F6bnEHMxmVxhjw3v/MGetE1yQnwKJnY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=LsOgKGVQhd9EsaUHusE296iydXKDMCkxuTSMzROIFtiRNy1eDUsag2q1mghanYD4L
         r1BirHTo2+gK6F1sc7UmAGmNt3Gyeb3AM9F7D1A5w5qYd2gPhRjl8oPXzHnCc2N095
         /qVdKoDwgkjpk94m4S9gpQ/o8usXM+eXvsHTgEA0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQoi24VYEVdwvmjD3CP=Q7_91KQ1o47ocL+MFPKnVBOKA@mail.gmail.com>
References: <CAK7LNAQoi24VYEVdwvmjD3CP=Q7_91KQ1o47ocL+MFPKnVBOKA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQoi24VYEVdwvmjD3CP=Q7_91KQ1o47ocL+MFPKnVBOKA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kconfig-v5.2
X-PR-Tracked-Commit-Id: 9b9f5948afcdf583cb1b58e0c4cc327aa1820f5a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2bbacd1a92788ee334c7e92b765ea16ebab68dfe
Message-Id: <155793661882.5377.9104640459605426470.pr-tracker-bot@kernel.org>
Date:   Wed, 15 May 2019 16:10:18 +0000
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        masahiroy@kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Thu, 16 May 2019 00:56:47 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2bbacd1a92788ee334c7e92b765ea16ebab68dfe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
