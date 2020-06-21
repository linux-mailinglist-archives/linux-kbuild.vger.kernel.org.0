Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB673202CA1
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jun 2020 22:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730590AbgFUUKY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Jun 2020 16:10:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:56894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730570AbgFUUKY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jun 2020 16:10:24 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.8-rc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592770223;
        bh=Gi4UQdLxncsUavvLQHAQ3rEKmGVLVz3H4mwxcXUn2sk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=KQ/hERy+IZd/74q9G3Qebh0ukf9Z/vmQ8LLY2qd21W9Bf3MI2kAIcE0Y6MPBf8JUz
         2AOQCvigyfuJyLIPLG7cvZsNRSCOhOt5cMnEM7VZBwtmwaGjD4VosBkQOTQIjf4g16
         3ppIiDi1sgU9+pWsCb/HhE/nK52K482SByQLSHbE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAT6C26gEHyT17cwHkvjx3NgvjtuFuuhqYWwH5fSz7R6wA@mail.gmail.com>
References: <CAK7LNAT6C26gEHyT17cwHkvjx3NgvjtuFuuhqYWwH5fSz7R6wA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAT6C26gEHyT17cwHkvjx3NgvjtuFuuhqYWwH5fSz7R6wA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.8
X-PR-Tracked-Commit-Id: 214377e9b7e3185abf5998b8a90450e01bab21a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: be9160a90de778758d499fe2cb8ee8cc4dda2cc7
Message-Id: <159277022377.13621.2982692208535196635.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Jun 2020 20:10:23 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 22 Jun 2020 02:06:58 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/be9160a90de778758d499fe2cb8ee8cc4dda2cc7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
