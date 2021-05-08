Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500B6377372
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 May 2021 19:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhEHRro (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 8 May 2021 13:47:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:55854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229523AbhEHRro (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 May 2021 13:47:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D080610FA;
        Sat,  8 May 2021 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620496002;
        bh=UEkS8R/dVeycfD+3I3h7jbQbwlU+pYwK7vy7xNnZ0is=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=sdnn9wNGFT9WOExSUWq/XVTwZ9zmRyzH+jIRo0afVck7cXO+Z9a2F21MKpBBs2Jgk
         tcMWNxScEEfNUhWXCb/5wjELny9A/Y2fguNxHDBBb2bty6hcdRTeKMCO3xP3y7nxpa
         +VDjItGinX/6CrjDft/RIxwGG3H5IgusaTDz4XFH229sLQVdIyiKGzxGltS2AX5Gcp
         VvDHop5nidV+F3w0blWjltbw7MEhw4J/mxW+1DlVO3sHf0KHLxKl8urg+eXi+orUwu
         1Ex5lpJCcTyTd7vS1l2AOAz+SRpuZjN+E98/0T0v47vZXB/4MfGQyrS2a5JnLhsY0T
         NEidDsWWHZ0sQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7A93860A0C;
        Sat,  8 May 2021 17:46:42 +0000 (UTC)
Subject: Re: [GIT PULL] More Kbuild updates for v5.13-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNASYmL1E9r7as1xGccKFUg0TiVMxe1jzDazfDO_V4rzDKA@mail.gmail.com>
References: <CAK7LNASYmL1E9r7as1xGccKFUg0TiVMxe1jzDazfDO_V4rzDKA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNASYmL1E9r7as1xGccKFUg0TiVMxe1jzDazfDO_V4rzDKA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.13-2
X-PR-Tracked-Commit-Id: 0ab1438bad43d95877f848b7df551bd431680270
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f979d815cd52084b99e9f6b367e79488850df2e
Message-Id: <162049600244.344.16570295681799960631.pr-tracker-bot@kernel.org>
Date:   Sat, 08 May 2021 17:46:42 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 9 May 2021 01:00:34 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f979d815cd52084b99e9f6b367e79488850df2e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
