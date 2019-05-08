Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15F73180C8
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 May 2019 22:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbfEHUAP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 May 2019 16:00:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728184AbfEHUAP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 May 2019 16:00:15 -0400
Subject: Re: [GIT PULL] Kbuild updates for v5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557345614;
        bh=jU00zmojyJrH3PQ4UK53p79SwLBRlj9HrE1gGey9lX0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=mH8oAV4QF7JmSp8gPUP+pSwVJwCG+0HtCb+P9zFUESZoiLLCqx1K/yGeWblqQ7oNa
         wFdgAP6PdH5NKkZwhS71IWTHC9CJaIijXT7CZhssPA2i/lsiejbzpERrw55PXwp2y7
         paQSfKG+zrx4DbCTy3mzE1xQvpyhhk2QgRybiS3w=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARG6if48VWsFTYmKstm+2jPSbrZRimVbD2W4a4AmBqmOA@mail.gmail.com>
References: <CAK7LNARG6if48VWsFTYmKstm+2jPSbrZRimVbD2W4a4AmBqmOA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARG6if48VWsFTYmKstm+2jPSbrZRimVbD2W4a4AmBqmOA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-v5.2
X-PR-Tracked-Commit-Id: 7fb1fc420f3b1cb27cce5aa1050eb5d9161d0944
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2646719a48c21ba0cae82a3f57382a9573fd8400
Message-Id: <155734561473.27473.17805337229531164111.pr-tracker-bot@kernel.org>
Date:   Wed, 08 May 2019 20:00:14 +0000
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        masahiroy@kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Wed, 8 May 2019 23:47:39 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2646719a48c21ba0cae82a3f57382a9573fd8400

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
