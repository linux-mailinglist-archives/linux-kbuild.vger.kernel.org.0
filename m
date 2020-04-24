Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA7D1B7DFF
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2020 20:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbgDXSkW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Apr 2020 14:40:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:36460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728908AbgDXSkU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 14:40:20 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.7-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587753620;
        bh=x4/hy+zhBT08d2cmGh72F5pmpw/vyCeEQFpqQ3nE420=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ZfsmsUxgalk+w368jN7tiv42SrqKJ3qtXNL5ua1ur/KWpVJWGyAnVwQuBuF7PlwCo
         M3Jx0x105ghmrMSytk9+DIRYDCdYPUxOJfZ/YOxlHZcb2lRvBYOFSbn2kBwqSeuD5N
         vxSm/NlLrV5cFRBTPhbd1xYcmpd2aHTz2bGOP1rA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQRXn_n60K9LF=pBz0HHg55Lj-1p5gwwmT=YSOdMBXKCA@mail.gmail.com>
References: <CAK7LNAQRXn_n60K9LF=pBz0HHg55Lj-1p5gwwmT=YSOdMBXKCA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQRXn_n60K9LF=pBz0HHg55Lj-1p5gwwmT=YSOdMBXKCA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.7
X-PR-Tracked-Commit-Id: d9451798998df3a72dce1bc365bc9e76401b0d3a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b9916af776013051a34ccf47bc5e13acffef16c3
Message-Id: <158775362043.26557.16458024691321952772.pr-tracker-bot@kernel.org>
Date:   Fri, 24 Apr 2020 18:40:20 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 25 Apr 2020 01:09:27 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b9916af776013051a34ccf47bc5e13acffef16c3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
