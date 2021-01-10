Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B76B2F09DD
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Jan 2021 22:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbhAJV1B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 Jan 2021 16:27:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:54570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbhAJV1A (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Jan 2021 16:27:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E2FC22AAB;
        Sun, 10 Jan 2021 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610313980;
        bh=mln3FfAAd5WBUYr9Umnz24wIoPoEvWPJrWDHXSW8TSA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=r4QeSQrgmTcRxQuArLi4fXI7APJu7uhc0jYrcd82w/afOhEJbws/9cD5RWWGvpIiK
         JM9GhqhehsIh67COng+4XnN2gs+KlHTnB8lNb60SuVSu7yrvjN2I2Y9jveHDSOOhdz
         RJqCxKzGqc4TN7K2jShkBZHNzKFZz/KkjSTHOfMuXa6iNFekKdonA4Bn2srYI/kR3i
         UlXjAFIr+LJ0en6V11mosHmy45qx8oUa1ylhNZGqTMt0PS+EQA5U+7AYLarLhPmwNi
         GAkkUAv0Y6tjo4mxtLqaBF482ZoN+rd56VGfz/ib2TsqV0uHXM61YPPdpr/OO0Lzg5
         PHa070mLRRZJA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 5AD4460140;
        Sun, 10 Jan 2021 21:26:20 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v5.11-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAR6zJnAo7KwdeghJZk8x8BivXWb2F5Gpxb90LDgP9D4dg@mail.gmail.com>
References: <CAK7LNAR6zJnAo7KwdeghJZk8x8BivXWb2F5Gpxb90LDgP9D4dg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAR6zJnAo7KwdeghJZk8x8BivXWb2F5Gpxb90LDgP9D4dg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.11
X-PR-Tracked-Commit-Id: 5625dcfbbcf892e40e8d60abbb5f56701a1d031c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 20210a98463e2abac31676ee141459fc23252927
Message-Id: <161031398029.31317.18317995013715136211.pr-tracker-bot@kernel.org>
Date:   Sun, 10 Jan 2021 21:26:20 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 11 Jan 2021 05:29:30 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/20210a98463e2abac31676ee141459fc23252927

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
