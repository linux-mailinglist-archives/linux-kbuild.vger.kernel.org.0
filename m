Return-Path: <linux-kbuild+bounces-5689-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E3FA2DFEE
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Feb 2025 19:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B7C8162B3B
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Feb 2025 18:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D001E0B77;
	Sun,  9 Feb 2025 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjSFKPw2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C291DFD86;
	Sun,  9 Feb 2025 18:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739125965; cv=none; b=a+xgzWSYywVBccj1s9V+jcJKHWBp3+eID0JCQH/oVWj5gIvd1vcxvYvKi1dH1ZHP6nyZfdMhezd+hmp+mpgTp4m4/VADeYbEq1YBHqj1Hn87jZeykKVX3zIbLIR4GwjeQ2EdNHcriPq0jTukm/yk4B5V6T3NI5H9lpDwq0pgG44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739125965; c=relaxed/simple;
	bh=NdssoG+DOhM5SQLbUkUSl60DaMn7ig7bfBM1fPBUDs0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=MnzrznTcWviCt3k6EqNrF8YNKbo1Jdvrq0GNpflB+BQajArDB/zZHRnL5wniLIPJKOCmq7bto3wclegMJjsdPFyw3ASQ2081fvn2kGPo7YXVBwuGHLGFH1c/2EWJK0UJV+SbBoycAPgJ3V0HJA6YFujF9+qzZeyk+I5+MifuFxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjSFKPw2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C55C4CEDD;
	Sun,  9 Feb 2025 18:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739125965;
	bh=NdssoG+DOhM5SQLbUkUSl60DaMn7ig7bfBM1fPBUDs0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JjSFKPw2KmHsnIHdnztxihDiWN8Rj66Lwlz29ABxeXRo0qkJwe4niKGRCYf0zZCEn
	 rXzxOr+9ukajnHr/m73r+rBWXHpS6nnZV+MBPVpSw88gFc/LAbkFuNmDBTUQ+++RRf
	 2Pygy031r8AGWHMFPQpB6s+6ibh29RlxHrzdn6q+Qz+pMtsdK77YQBq++iG8+mPUg4
	 wLaRZOdqjOq/lRmLflGlKkp/siZtB7V4gG370rUSAYVfOFkJcOGy/WD9FXulbkGPp1
	 us+Q9XyhTBvlCyy3rF+mAn5SN6qnbr623atmN6rgsIrb/1Ha31urwSrg4o7lJy36m6
	 EuJXxMbxs5VHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D7A380AAEB;
	Sun,  9 Feb 2025 18:33:15 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAR3rgsNCN2hUs_s3H9wZeBPaLPwZgMH3ShLuLUKMjjihQ@mail.gmail.com>
References: <CAK7LNAR3rgsNCN2hUs_s3H9wZeBPaLPwZgMH3ShLuLUKMjjihQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAR3rgsNCN2hUs_s3H9wZeBPaLPwZgMH3ShLuLUKMjjihQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.14
X-PR-Tracked-Commit-Id: f354fc88a72ae83dacd68370f6fa040e5733bcfe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69b54314c975f4dfd3a29d6b9211ab68fff46682
Message-Id: <173912599377.2868883.6817567728527424259.pr-tracker-bot@kernel.org>
Date: Sun, 09 Feb 2025 18:33:13 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 10 Feb 2025 02:39:14 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69b54314c975f4dfd3a29d6b9211ab68fff46682

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

