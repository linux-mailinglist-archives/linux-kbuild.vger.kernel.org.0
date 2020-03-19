Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9377018BDEF
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2020 18:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgCSRZJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Mar 2020 13:25:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:57374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727146AbgCSRZH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Mar 2020 13:25:07 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.6-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584638706;
        bh=NfS59A8mHznDlIVDVb5fxZyORY84TtYTcQNxzuhgarc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=0CdHN6IsLTgXeYgTBnKSsX78gVITpfl0UF+6FzjBHwL3uOrEMTgGxF4H+ZjXQB2hq
         y+i8iojRIvGnFsqO/dzYsfkLy+8sFsbkY5xinKYdMhVODe2nmXW0HM0CEPDBZgPrhr
         qdsj3/fKH2mq1+nHaFtpqWiZJSlmc0MkVBFVoWxQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNASTxvF9AbddpkgABM2fAmvCP_bwCCrS9gmeDN0w-ZjfwA@mail.gmail.com>
References: <CAK7LNASTxvF9AbddpkgABM2fAmvCP_bwCCrS9gmeDN0w-ZjfwA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNASTxvF9AbddpkgABM2fAmvCP_bwCCrS9gmeDN0w-ZjfwA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.6-3
X-PR-Tracked-Commit-Id: 7883a14339299773b2ce08dcfd97c63c199a9289
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 207f75c4543fcd34ed7ec84ede43479f1c08e7ca
Message-Id: <158463870675.20508.344533080914750903.pr-tracker-bot@kernel.org>
Date:   Thu, 19 Mar 2020 17:25:06 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Fri, 20 Mar 2020 00:22:09 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.6-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/207f75c4543fcd34ed7ec84ede43479f1c08e7ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
