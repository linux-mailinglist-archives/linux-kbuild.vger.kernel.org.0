Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4345636F227
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 23:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237076AbhD2VjG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 17:39:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:37118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233394AbhD2VjF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 17:39:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 930D9613F8;
        Thu, 29 Apr 2021 21:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619732298;
        bh=G1kl+vdOcvmCWJ8j3CnqI9jXl1xnKXUpCn8W/EK5uzE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=jsvbfNPq4FeaSgWKuQp2PqHHf443K390fF1h81H+DhEJl/o3smimvcB3PZGPUgOi9
         TrLGrapckITk3yJuKlYASyRYLzr4jDpeiZBwrDEXL6dDAYQp2os4IQjJLW1PTKLELP
         orQmRnT86wOAorCDFo5cfZbtjBGGdwg3nIrZNV3rej/2TYiigBZjqtLrpJoVZKnn+C
         EB/SwvFyCmD6Gz02zwx75aD3tmiGc2pPISqqRvvnFS/7nby6XhO+EDxbUIdgZuDCXq
         QAF0vbI/nngKswwjfc5ir5iN6pqa+Cq3pdRm1d3bxsVLQ17xaEmBlrfRyFKTSuYHwp
         GfyhL22A/qMKA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7EE3460A1B;
        Thu, 29 Apr 2021 21:38:18 +0000 (UTC)
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.13-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNASN32_wwEf7xD+kVgT6SXLqZ41dJYFu8qwu-99Q_xkyhQ@mail.gmail.com>
References: <CAK7LNASN32_wwEf7xD+kVgT6SXLqZ41dJYFu8qwu-99Q_xkyhQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNASN32_wwEf7xD+kVgT6SXLqZ41dJYFu8qwu-99Q_xkyhQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.13
X-PR-Tracked-Commit-Id: f634ca650f724347892068489c7920631a3aac6a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b0030af53a74a08c77ea11d3888da21542af2d0e
Message-Id: <161973229845.20460.6717472563871173858.pr-tracker-bot@kernel.org>
Date:   Thu, 29 Apr 2021 21:38:18 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Thu, 29 Apr 2021 15:44:43 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b0030af53a74a08c77ea11d3888da21542af2d0e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
