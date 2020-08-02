Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58B62359F5
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 20:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgHBSkG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 14:40:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:59806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbgHBSkE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 14:40:04 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.8(-rc8)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596393604;
        bh=RttWtHJS12xlgaapQ3F2mgpwdgI2qtboe3flMwe8iqM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=gCIsUXXVS3KNNaGr7I8avPOVQ1GXFOABlmX4XrOlR4iBF0XWAbQDkgxmIbMUx9o/9
         v3hovGhfUgBmelq2wyUH02Q7y/4AW5KBVJBLMG6rbxLpvmqZCku+KRybn5oOXgCCE8
         4DmE6NmHdYjojaA4Y2LU7aFPZGFGJr6Pkeq5Sbxk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATJbLfuj8bbjPevXWTk5HAra3n2aG-B2ueTPxMpYhbZnQ@mail.gmail.com>
References: <CAK7LNATJbLfuj8bbjPevXWTk5HAra3n2aG-B2ueTPxMpYhbZnQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATJbLfuj8bbjPevXWTk5HAra3n2aG-B2ueTPxMpYhbZnQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.8-4
X-PR-Tracked-Commit-Id: 28ab576ba8de934ee3145b6d75119f016de567cb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 142c3326b055a278c303bfef8dc6a105fff18ca6
Message-Id: <159639360445.23285.5039926848438778349.pr-tracker-bot@kernel.org>
Date:   Sun, 02 Aug 2020 18:40:04 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 3 Aug 2020 01:34:57 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.8-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/142c3326b055a278c303bfef8dc6a105fff18ca6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
