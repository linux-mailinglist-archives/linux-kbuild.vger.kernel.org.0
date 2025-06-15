Return-Path: <linux-kbuild+bounces-7507-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D08FADA28D
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 18:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DC4816E528
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 16:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93DA18C02E;
	Sun, 15 Jun 2025 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1duklty"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9752E11CB;
	Sun, 15 Jun 2025 16:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750004539; cv=none; b=adVmE7OqJowgg4qFJwBLvU5JonflDdKQgMBUHxXXENRPtixGIsR00iLatd4TdEGpZ9j/7svQAX722KMOTtHEKFZHhyusILDNtKiz4IBgYeqwiG/l0x2MSvYsdDS4KmPoiNz9SVT/fIOMFSSY29drwDxKcsrT3WlPnbJnoPQ3yjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750004539; c=relaxed/simple;
	bh=BJXLebFf7l7VsEHBZsdL+fJnSeccD32ZA7gTmMJ1Vl8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=J0wgl8v01nUaHigEUZmRCdlNNfgox3TdEIlv39aSfCgm1n+EBd7d3QfMOIbrukEPo1YwNMvU0Mw393UgFsVPrvyp6YyXL5xeFbD9/ety8VM+YQkWebiwyxJKltIeIXnSDAxuSS9YGlDaJcBNttkn0ye9B07vODgrIpRl35W6sNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1duklty; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B92C4CEE3;
	Sun, 15 Jun 2025 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750004539;
	bh=BJXLebFf7l7VsEHBZsdL+fJnSeccD32ZA7gTmMJ1Vl8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k1dukltyXcSzz3aVcH/m8tUNXlBTmz6c+XtPC0yc6WLBZgbS/zR6BOgr904M/IvFf
	 jZQHAK71ksWh5R2ZGwHWMucrbhb/k+M4cKLCPp6I70ZzA0g8CQA58Ot2WUVE0EkN2y
	 PiuWQ+MBF5DoebLKmiQTrdXmg3NfhMmKIgj1p0i0bt7q82pnaNQ9Pl2TKPFk4YeX0/
	 9tjNDtvjYEVyOoWH0ETjjq5AEK+oaL9qYu1Dee119H+rbaHcIJeUmcBDRWIZsBQwZG
	 Ap0Oiu82vp+9n2wZ+r0b6exKaIOlatO4BxG/za931j+j2abgnk5MMaBebB/3KhPanI
	 8CZEX2T46JuAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DF9380AAD0;
	Sun, 15 Jun 2025 16:22:49 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.16-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQvzJzxEqTP6XkhcEYdJA3SdTMzjB8u6Qt9QzJ6nTTVpQ@mail.gmail.com>
References: <CAK7LNAQvzJzxEqTP6XkhcEYdJA3SdTMzjB8u6Qt9QzJ6nTTVpQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQvzJzxEqTP6XkhcEYdJA3SdTMzjB8u6Qt9QzJ6nTTVpQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.16
X-PR-Tracked-Commit-Id: 2f6b47b295518c3ba16fabb1dddbe6a319899acb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 08215f5486ec4d7c39cf14987ffb133e1e1f6c10
Message-Id: <175000456794.1353021.13914940034508518880.pr-tracker-bot@kernel.org>
Date: Sun, 15 Jun 2025 16:22:47 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 16 Jun 2025 00:58:45 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/08215f5486ec4d7c39cf14987ffb133e1e1f6c10

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

