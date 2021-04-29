Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9427C36F228
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 23:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237192AbhD2VjG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 17:39:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:37134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237032AbhD2VjF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 17:39:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C59C36144B;
        Thu, 29 Apr 2021 21:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619732298;
        bh=sBzsTrxadfVHDz84D2gbXqNEOgh564gI+90QO3Tby8o=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Er/J9Cx8SLeRSfaH20SG4I8vGWJ6jHG6yKzFuJMNXPmtsP47MTaJvGaAXfej41Fp7
         TW7nUc49gKnucRrj5fV0MveE0OaHhqY45yXfrL3YPKTs5f8kp1crmtEgTfoKeEINDt
         fqsJwMWt5gm/5yShpmkTaLkx8rge6J3J5cx1pmZYM3JEcWBG4YAvY8estUFHVBxeWp
         0P5phSJOHxe7S9GGaEf44Gb3r/g2+fgXA1tQN1i8jz9+JUA29dBY6N/n5q4nbNtCM+
         hnlpgGd0SW7+WJ25F7WjXpHEDeC6ozarXkrQHVjHPcAD1EtrTABG6RK9PVjAuVMlSY
         KHXRzs0XfjB4A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BF8A960A36;
        Thu, 29 Apr 2021 21:38:18 +0000 (UTC)
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.13-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQ_2XPx6-v5irQDw0HyfSRKrrxcR2rutmZ=WBUsSBW-wA@mail.gmail.com>
References: <CAK7LNAQ_2XPx6-v5irQDw0HyfSRKrrxcR2rutmZ=WBUsSBW-wA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQ_2XPx6-v5irQDw0HyfSRKrrxcR2rutmZ=WBUsSBW-wA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.13
X-PR-Tracked-Commit-Id: 8ac27f2c6eac1f140531411e404fb3ba23339ba5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8ca5297e7e38f2dc8c753d33a5092e7be181fff0
Message-Id: <161973229877.20460.3086595657380344308.pr-tracker-bot@kernel.org>
Date:   Thu, 29 Apr 2021 21:38:18 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Thu, 29 Apr 2021 15:48:53 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kconfig-v5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8ca5297e7e38f2dc8c753d33a5092e7be181fff0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
