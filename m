Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2801887BB
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 05:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbfHJDfI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Aug 2019 23:35:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:42584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbfHJDfH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Aug 2019 23:35:07 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.3-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565408106;
        bh=OOXbXwHQTreQVAz2Vek7YgFKOXX2vpVL5mYcPg9BRLY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=kbf4vfjRjJN/lW/9hZJMiIUbVwsALNl4SyUKvGFCRxNkVJmzf/WwxxIeoVTdzngXi
         DovJHuzgMMpM/m8P9WzfH1CXz1EM3Xnuvn41al+NVC1PyTpDtaOga94VEZOn8/IYUC
         IJFUKLWyOUlreaCdf6hSSggTyFFtlF+GSoQmCxkY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQGV+CFP6o3_iQNH3x6boXWH=2JN8j7WPJbtyi=eF6=dg@mail.gmail.com>
References: <CAK7LNAQGV+CFP6o3_iQNH3x6boXWH=2JN8j7WPJbtyi=eF6=dg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQGV+CFP6o3_iQNH3x6boXWH=2JN8j7WPJbtyi=eF6=dg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.3-3
X-PR-Tracked-Commit-Id: c07d8d47bca1b325102fa2be3a463075f7b051d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 451577f3e3a9bf1861218641dbbf98e214e77851
Message-Id: <156540810686.11925.17753605303438094862.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Aug 2019 03:35:06 +0000
To:     Masahiro YAMADA <masahir0yamad@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 10 Aug 2019 11:10:22 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/451577f3e3a9bf1861218641dbbf98e214e77851

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
