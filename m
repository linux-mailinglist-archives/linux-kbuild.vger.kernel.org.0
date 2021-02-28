Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4350327477
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Feb 2021 21:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbhB1UqE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Feb 2021 15:46:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:40150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230084AbhB1UqE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Feb 2021 15:46:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 88D7064E01;
        Sun, 28 Feb 2021 20:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614545123;
        bh=T3uKwX8/dCvKEOm+1qJ/c4VyG5LVdBw6dz/hjFzdmAY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=IWO6tFYmi0Ft11PaNJMEmtSbu7fx7dfEWLGwov3mMFWpHSqUeBu8geLuzfVvnpdvC
         sI+2qgbOSyVRAbg0/O0lQboqlmjk60ZAFroTywWKSr8Fl1O2yTKPUC8nfDVGbhavi1
         t6k6BN76JKWUFW2D0SA3kAh2I/fhTbQF0eDastpZC0kxnofUsuaaLhVLVK1izKQmZv
         70WaZPtFIKghov8pO6JLx+q/wWgUo+2yE8CcffuYXZnve8lK0i8aKBYwXyIfw89Pyw
         OtqcmEomEPHj8PkyicPMqM2+AY7AO+72miGLIUkzbCCSNDmxCBVyCgKbCsJ/HXBkcO
         N+CRDnSR7W/8w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 75DF360A13;
        Sun, 28 Feb 2021 20:45:23 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v5.12-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNASnND8Vs1q4_6ceuEBPo=JbeoWYFTJBp_t-gYQy4BjVNw@mail.gmail.com>
References: <CAK7LNASnND8Vs1q4_6ceuEBPo=JbeoWYFTJBp_t-gYQy4BjVNw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNASnND8Vs1q4_6ceuEBPo=JbeoWYFTJBp_t-gYQy4BjVNw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.12
X-PR-Tracked-Commit-Id: 207da4c82ade9a6d59f7e794d737ba0748613fa2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06d5d309a3f17e32cd59926f391db1e1ea652184
Message-Id: <161454512342.17556.16279195395683551030.pr-tracker-bot@kernel.org>
Date:   Sun, 28 Feb 2021 20:45:23 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 1 Mar 2021 00:22:06 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06d5d309a3f17e32cd59926f391db1e1ea652184

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
