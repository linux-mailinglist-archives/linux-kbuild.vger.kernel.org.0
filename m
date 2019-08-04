Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3D2F80BD9
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2019 19:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbfHDRUR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Aug 2019 13:20:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:56180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbfHDRUQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Aug 2019 13:20:16 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.3-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564939216;
        bh=9DvSzAj+eg7pHB33F4T4wdJQonqSQgo4d+S9hj/TGj8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=oJmQI/JsuXnApN03wFq2BwpNXmDKkr9QLP9B7lkmhVagUfE4lQZlYH3MjHr1AL7Yo
         FyATULOBLnBMVygBnGPbfPj0ZtU+sICll+dWk51/PjNAGWof+gpIF/gWI7znw2fthF
         c9BbjR2KzSIBq5GGSzEuxHqZOo8AwZSuorbVxsUs=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQNSjKcanh78mEJWeyO81xz9qBJ=_u=Dcqx+YcaT9pZig@mail.gmail.com>
References: <CAK7LNAQNSjKcanh78mEJWeyO81xz9qBJ=_u=Dcqx+YcaT9pZig@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQNSjKcanh78mEJWeyO81xz9qBJ=_u=Dcqx+YcaT9pZig@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.3-2
X-PR-Tracked-Commit-Id: 0c5b6c28ed68becb692b43eae5e44d5aa7e160ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 05e4f88b7d25fa8bf65b846f05197c47ddece278
Message-Id: <156493921001.5657.3129106652808656430.pr-tracker-bot@kernel.org>
Date:   Sun, 04 Aug 2019 17:20:10 +0000
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        masahiroy@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 5 Aug 2019 01:07:14 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/05e4f88b7d25fa8bf65b846f05197c47ddece278

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
