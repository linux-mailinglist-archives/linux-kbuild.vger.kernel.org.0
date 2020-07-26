Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF1822E2A0
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Jul 2020 22:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgGZUuF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 26 Jul 2020 16:50:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:45698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgGZUuE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Jul 2020 16:50:04 -0400
Subject: Re: [GIT PULL] Kbuild fixes for v5.8-rc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595796604;
        bh=W2Oje1BUCt/AbcWud/SnqHp24Z8QQnXAQFp6GeQweC8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=KXeAZB5zDP0gpT/jD64TMXdv3zOo+cxevkZmcXC6H9pcY1Tw3GEgoVByIxCq3zkZX
         XcLTppx+hjUs0yE3tuSste7YmeUypXthAND+9lAQtLDsA8YvXim4RDXL9Zb9n71OBB
         AmGRl9dm8b/AuPHkFTL87hDCWfv/F42zdH1QvnrE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQNYmyeB1ZWQ1t4bLZtC4+08TUNtjobwyj4-7e-7BOPAw@mail.gmail.com>
References: <CAK7LNAQNYmyeB1ZWQ1t4bLZtC4+08TUNtjobwyj4-7e-7BOPAw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQNYmyeB1ZWQ1t4bLZtC4+08TUNtjobwyj4-7e-7BOPAw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 tags/kbuild-fixes-v5.8-3
X-PR-Tracked-Commit-Id: ca9b31f6bb9c6aa9b4e5f0792f39a97bbffb8c51
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c8594b8427290c178c5d39885eacd9e41f68743
Message-Id: <159579660443.30354.15856412453208486271.pr-tracker-bot@kernel.org>
Date:   Sun, 26 Jul 2020 20:50:04 +0000
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pull request you sent on Mon, 27 Jul 2020 05:32:33 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v5.8-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c8594b8427290c178c5d39885eacd9e41f68743

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
