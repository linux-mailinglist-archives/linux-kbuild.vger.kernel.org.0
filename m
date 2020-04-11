Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03FE21A5364
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2020 20:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbgDKSfZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Apr 2020 14:35:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgDKSfZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Apr 2020 14:35:25 -0400
Subject: Re: [GIT PULL] more Kbuild updates for v5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586630125;
        bh=YY84iTaL9IJkn7PKcECSJ/W1nm5od2vLwy38+BbaUPM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=o0X6s8ORof3WheVe1//ELjVW9XzE7JkfmblicxBDCXCPzz7rTlH8Yh+XYt6901AIK
         +ooHHHaEcu5tMilmBqsjz0lJ6EUF5A1uEmdOYkEox9VthD3kGBd1p0Mm6g4i+ufjM3
         +AsHPYEIzrT2P+dzpjgWmKDgrztQnJKTOR0QtjG0=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNART4rVUYsaqQKM4u1DVxTtDDs51kyY9JFKCOuHe1FLV-Q@mail.gmail.com>
References: <CAK7LNART4rVUYsaqQKM4u1DVxTtDDs51kyY9JFKCOuHe1FLV-Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNART4rVUYsaqQKM4u1DVxTtDDs51kyY9JFKCOuHe1FLV-Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 kbuild-v5.7-2
X-PR-Tracked-Commit-Id: 00d76a0c19436c88ffcafa1e816f0c0c9af082a0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b753101a4ac0b906064a72feec43f5b80a1fe2e5
Message-Id: <158663012561.22476.9821887008115108019.pr-tracker-bot@kernel.org>
Date:   Sat, 11 Apr 2020 18:35:25 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Sat, 11 Apr 2020 12:24:34 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild-v5.7-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b753101a4ac0b906064a72feec43f5b80a1fe2e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
