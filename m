Return-Path: <linux-kbuild+bounces-9463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAD6C445D5
	for <lists+linux-kbuild@lfdr.de>; Sun, 09 Nov 2025 20:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ED21A346249
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Nov 2025 19:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5462236FC;
	Sun,  9 Nov 2025 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdgNetd7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E1421D3F4;
	Sun,  9 Nov 2025 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762716036; cv=none; b=ukPAe8S//M5qyEAOsro5xHZyYCr9FbEfu7qv/0hCc0TbUkr6ln0Oxz1zYugwnZqT9/o5uk1mRY5+NMujCwtkJYwymS5IkaKqYS773gLpAryhCLE+wLsTt3oHqDI3+BuB8jz5RccpaqBFpslAgD7skfNwnAHQ0xog7mEpiD9Nzoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762716036; c=relaxed/simple;
	bh=21OqZaDzuwtySgWJzal5LahB5pObDzPMa/w6X6tFWBs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=DyaZ7SqkpPTK8MYtfwk01QJtmYNwUhDSyhSEE0zMI7UzVxK0aIUYb4OfzN9W1R0jnBEvKJp9/FLGdh1+Ll3o8W8LAlrfAJzcsyiUgveNgVMqaiU+rcX54ai4hw3Vzsa81XAtPvSUbcVIau/ToJ4cxfmG9uFgMLOkfZ58T1Ap+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdgNetd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C435C19421;
	Sun,  9 Nov 2025 19:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762716036;
	bh=21OqZaDzuwtySgWJzal5LahB5pObDzPMa/w6X6tFWBs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZdgNetd7/yCdFu7RVvm++SaKd9z4yUqqQ+kYq/X9+BVTFUp4aSB8I+NMdzlYA7pRP
	 YDar/Ghj4WhE6+9DE4ll4S/IZ+rhPJHHQAtlAGfJnwdoian6FxNrm5Io1KzzMp//CB
	 gIX2oBCpH4UGWYUa5FdNl1mf5tNcW8yTK0X0JP/e8NW6kGVdsm1wUCddaRaN51oI50
	 yhK7tsPD+AHY2PpTOLUlvqVcF2nMc2r/h5w3Kovxge6Qgdj6K68/ARBfwQJQgqBmeG
	 citsQFUq9r7FkjbsglGtbApcieAi3lqjctusj9Cb2E2he3yUlwc0y3Sabho/+s8zyj
	 rEw/SFKXq5MSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3503A40FE9;
	Sun,  9 Nov 2025 19:20:08 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 6.18 #3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251109025637.GA2001503@ax162>
References: <20251109025637.GA2001503@ax162>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251109025637.GA2001503@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.18-3
X-PR-Tracked-Commit-Id: 002621a4df3c166fab1427e8e502bc15acc26b13
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3461e958c1052111f9729d74861cdf44fa2eda61
Message-Id: <176271600754.1617815.13311620267765425591.pr-tracker-bot@kernel.org>
Date: Sun, 09 Nov 2025 19:20:07 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Nov 2025 19:56:37 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.18-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3461e958c1052111f9729d74861cdf44fa2eda61

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

