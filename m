Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E4124E912
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 19:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbgHVReA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 13:34:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:56126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728132AbgHVRcR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 13:32:17 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.9-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598117537;
        bh=Q6N6KwbYhvbkpIQumB9/HhFg2VuHmS4sQTBfNSvj1Ck=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=N1KzH3iBLcbp9hsrZDZnuw1r1AezTJ+eT1VifmvtTAFCwAwY5bpBsqIRetW2AwM8Q
         zvoLKC5OK+Fo+HhuBMCa5r7hGfYiLPvBYqtBfiO46FgWOKpRMsq/0p65j5EDRuGdnd
         lRe2D+OvzrMU6hlhBJvkV2yFyTLHfw0It+weEXFg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQO7kay52Dxku3sgyYk=4OGEB8m+gmN7wLemjc0f-pY-A@mail.gmail.com>
References: <CAK7LNAQO7kay52Dxku3sgyYk=4OGEB8m+gmN7wLemjc0f-pY-A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQO7kay52Dxku3sgyYk=4OGEB8m+gmN7wLemjc0f-pY-A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.9
X-PR-Tracked-Commit-Id: 510bc3cb1ddc32f9533e6ed0a68c980544c3ca3f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c3d8f220d01220a5b253e422be407d068dc65511
Message-Id: <159811753724.17427.16062703476306424501.pr-tracker-bot@kernel.org>
Date:   Sat, 22 Aug 2020 17:32:17 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 22 Aug 2020 23:00:58 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c3d8f220d01220a5b253e422be407d068dc65511

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
