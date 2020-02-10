Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4680E156D1E
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2020 01:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgBJAKZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 9 Feb 2020 19:10:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:52612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726915AbgBJAKY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Feb 2020 19:10:24 -0500
Subject: Re: [GIT PULL] more Kbuild updates for v5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581293424;
        bh=140zUBpxxk4wiGsnmF/irmYN0fv0NTAH2kX6HfvOMQE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Lol2vXdzJ2svIgzXjvBse+MfFIPCu612rvvSC9HaAz7G7O/cDq38PJZ82w3xPqYJV
         cICmDD066cFQjyMdWYz6veDwl8FFOeY0RGT7NoWAxegYS1KcXG6tpo3e+Gd/+CqahQ
         kf2C+96iOh5gXQ7YMUkC325h3sNFVxxXXHhAZHVw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQs-KVCM7xXqJchQrMG+nnajPFRMB2Z+RJ9VTsg7XGRAQ@mail.gmail.com>
References: <CAK7LNAQs-KVCM7xXqJchQrMG+nnajPFRMB2Z+RJ9VTsg7XGRAQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQs-KVCM7xXqJchQrMG+nnajPFRMB2Z+RJ9VTsg7XGRAQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-v5.6-2
X-PR-Tracked-Commit-Id: f566e1fbadb686e28f1c307e356114b2865ef588
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 89a47dd1af8fdda667938ec190d9595d55d7ec6f
Message-Id: <158129342420.32523.4154436213451712314.pr-tracker-bot@kernel.org>
Date:   Mon, 10 Feb 2020 00:10:24 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sun, 9 Feb 2020 06:45:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v5.6-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/89a47dd1af8fdda667938ec190d9595d55d7ec6f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
