Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665A833A122
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 21:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbhCMUqA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 15:46:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:38302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234535AbhCMUpk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 15:45:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C3A2B64ED0;
        Sat, 13 Mar 2021 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615668339;
        bh=cVaLyqZ5iVyFCF/YYq/v2y93OG+V4aESBIzrqITw5pg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=C3clp6BcIhs/avqhePGqVM1wlkcrbquAaLTCqaxLuKyfBR80+0qRIgcMkjQpNn/g2
         U62bTlMR73z3Eey4upDwDRoP1yoiuRmV9HK8I5Q9ZapXsCESgicg0T3spy4zraOlV4
         eIssP6s9xR93YEO+2dQtHXtIWSrEmmEo0CkwtWeWtOwmRCa8Xh5/hCDTjMRy5/idfL
         cwCpYGt4q/KoYljNCKQFPMS5+DksJocPKkSVAzxebkqoMd8BCjd/58UBWEMN8023Hz
         vz7KRSzanKFDKk11PEj4ip7lQEAj36KJafy7LrVT5jAN0alpdcREfuZR0ZJkwr8QHO
         a+jRviwEASBdg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BDB9F60971;
        Sat, 13 Mar 2021 20:45:39 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v5.12-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATqcLBbLVn5Ft+1-m_uC5WC=9HAx2orbopsOJnZ7SRgqQ@mail.gmail.com>
References: <CAK7LNATqcLBbLVn5Ft+1-m_uC5WC=9HAx2orbopsOJnZ7SRgqQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATqcLBbLVn5Ft+1-m_uC5WC=9HAx2orbopsOJnZ7SRgqQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.12-2
X-PR-Tracked-Commit-Id: bcbcf50f521843445c9ea320a0569874f88c4b7a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e83bad7f77a4348277c3ebe9bea4a5b0cd6dfcb5
Message-Id: <161566833977.19597.9555526720684258090.pr-tracker-bot@kernel.org>
Date:   Sat, 13 Mar 2021 20:45:39 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 13 Mar 2021 20:53:01 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e83bad7f77a4348277c3ebe9bea4a5b0cd6dfcb5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
