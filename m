Return-Path: <linux-kbuild+bounces-1967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C88D712B
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 18:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F29791F21E95
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Jun 2024 16:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C7215380E;
	Sat,  1 Jun 2024 16:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GN59xD9J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08F915380B;
	Sat,  1 Jun 2024 16:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717259903; cv=none; b=Jkq9Ssmf0mViXiW5O3yvhGoMXsdUw6PVZMRekkWoIAe4flUKt4JB0jQ93jS/Y4xG3VXMh/DZ5BD7Z4aUV5NQ4Z5i+4uccDpnVct8B5SydxHobbMr/2ITLQ0fKgKBzNrIjchSEopvI3rIIx3RNH/WD6nT4mjC/Ny9u66pA9gcGOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717259903; c=relaxed/simple;
	bh=ZTIOqlPeOJtfDE7M+UYDMIc2DXR3T+hPmjF53SmBOoU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=j5elii4XReD8V2vn1IEO+YlXdYQ3TPCXDZKTB67v4OMNHVKrO26PcByga/lof/hMy/DZP0Q0P2GCtGBZ+tEp4A6hWnf/Tas+NJ+5Ehwk2FtUZxO/KvmMInuzaCKK3OmYX3Ntsv42AITyYqpQGdt6pTtM+qD5WxNhR/Yl/79tS5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GN59xD9J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64B67C116B1;
	Sat,  1 Jun 2024 16:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717259902;
	bh=ZTIOqlPeOJtfDE7M+UYDMIc2DXR3T+hPmjF53SmBOoU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GN59xD9J4zozDTIj6dHGZMHPnpKGdIKxz9WYefLtRhG7/UisFoyzTKyo+OPJb3/fA
	 3QcBZrhyue2RYb393NNdkwLrNr3AbV9WRn2r0Jqe2/fETIzJ1JRgPhQnVimDfMTQLG
	 dnviJanCoBNx2hzy03WIYgnyDzdm7aymfKDkQvofBskTaplgwFogJ1+/tYKODlK/Qe
	 umfsn68T8JXeHcwI01ZH5bz5B4hGLmKOQEewdEMzkS1U3UWfniZoPeU2DPUpjqnNYb
	 CNV5GtSK8J4W52m8G7O0MZoX2jDoctw9kszxSNtQK4Z3at0o+H9h2WvRs9kGa5ewFv
	 iKQ+Lw3XPgnMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53CB0C4361B;
	Sat,  1 Jun 2024 16:38:22 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.10-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATB7Gkq-rDeGy0VyZhEa1M8cMYQmUSQTQOLCGtJYUzD7g@mail.gmail.com>
References: <CAK7LNATB7Gkq-rDeGy0VyZhEa1M8cMYQmUSQTQOLCGtJYUzD7g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATB7Gkq-rDeGy0VyZhEa1M8cMYQmUSQTQOLCGtJYUzD7g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.10
X-PR-Tracked-Commit-Id: 1b1c9f0fd3fb70adf1f3b0aec58ab037d6e595d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec9eeb89e60d86fcc0243f47c2383399ce0de8f8
Message-Id: <171725990233.19745.3359437306717795663.pr-tracker-bot@kernel.org>
Date: Sat, 01 Jun 2024 16:38:22 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 2 Jun 2024 01:24:01 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec9eeb89e60d86fcc0243f47c2383399ce0de8f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

