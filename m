Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80122CCC98
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Oct 2019 22:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730269AbfJEUFR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Oct 2019 16:05:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730245AbfJEUFP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Oct 2019 16:05:15 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.4-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570305914;
        bh=C3dOcbNbvsVVNtkIVIpngy0VYlrwjiXnsg6x80Z5T9c=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=SdCOzdSS7ZhblZ7iAw3LshSRDKNedjH/PuEhmQ60HdDWIh/hQda+tjqb2q3Bz4tR3
         VMp2rkIL6H8TLDlEnF7NgPl0NOAi3RElo+KDOu3oJKiGVQcFOLVQeuwwQbu6jiVxAw
         lyJM/EwA6ilorrNlMH4ek9YvwPgt+crajaRe5HhM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATpmqt57w9m1keLKu4Y0zbvWjJX8SWqKC6b6mj-23Y0xg@mail.gmail.com>
References: <CAK7LNATpmqt57w9m1keLKu4Y0zbvWjJX8SWqKC6b6mj-23Y0xg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATpmqt57w9m1keLKu4Y0zbvWjJX8SWqKC6b6mj-23Y0xg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.4
X-PR-Tracked-Commit-Id: 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d00aee21a5d4966e086d98f9d710afb92fb14e8
Message-Id: <157030591476.15791.17657287644153393351.pr-tracker-bot@kernel.org>
Date:   Sat, 05 Oct 2019 20:05:14 +0000
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 5 Oct 2019 17:21:15 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d00aee21a5d4966e086d98f9d710afb92fb14e8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
