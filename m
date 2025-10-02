Return-Path: <linux-kbuild+bounces-8992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 206CABB27BB
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Oct 2025 06:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D40D23231F9
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Oct 2025 04:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F6141A8F;
	Thu,  2 Oct 2025 04:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qENvyjNo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C528FD;
	Thu,  2 Oct 2025 04:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759380361; cv=none; b=MNOotFTQsqPxx2DxWc7HQ27BQgG/lKpvid2Ubl4yl+ZNqvrdbpMGarF8wCfm3iYhJDVY13wsksjB14Vnm4+L3a2t8ZHWISTlaqkPFoGZ+KObEA738KmwzCWshxDCet2VSZwL/5anH/+XxhA3jOFWlxxnWAa/9e7841A/gu0VrIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759380361; c=relaxed/simple;
	bh=mMX1UEnM1bKGqLvnYBhHemVJzo4+LwyHk1vYMYNDFIE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=avQ7NU5oiOdY20n0Yi+3ODCaBy0M1bJGljvsITTcxi18/Jgaw2P4TQp9W7x0mj+Ml8sCcEh2/I+tH+zeCHm/4zDu9qvT4k9c4HN1THVcj3g3dJJaYAMuXk5CvHWRjPpoHlt/BfMMom6d9rsb94+2w7qMifqpOjiz5VmKKbt1INw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qENvyjNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B51AC4CEF9;
	Thu,  2 Oct 2025 04:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759380361;
	bh=mMX1UEnM1bKGqLvnYBhHemVJzo4+LwyHk1vYMYNDFIE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qENvyjNoe1rlPXD65wlXUmxCkc2+oBwIfumBvRy3D9XAqIXHv3Cul6D9y2VxJlHbZ
	 GkBzoei4aqsmCChYsGjfi3FjYY1V4/lIJowTJX/CCY774T4BPA3Z6gsonqDUm2raa2
	 Jhslt3uHjNzfbxbQNXTDoGL8UEuogacpCWasNMmGUg+emBAQC1s4W11FhD3g2uxM72
	 lZZky45DG5PlgKk/YT46Uwp22BdbVuzmh8Dyqqf2twBQsZHat1nr8MHqDInBRU9vY+
	 uAnjfyiYeBUxJblC+wBTNi+P3Z5cQeFGtEwzk5wve5qBuWYnrZ4ypJoy7RJO0jBmw3
	 guEUYhCGHzBFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE21939D0C1A;
	Thu,  2 Oct 2025 04:45:54 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250930041119.GA1936516@ax162>
References: <20250930041119.GA1936516@ax162>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250930041119.GA1936516@ax162>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.18-1
X-PR-Tracked-Commit-Id: 2ea77fca84f07849aa995271271340d262d0c2e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7f7072574127c9e971cad83a0274e86f6275c0d5
Message-Id: <175938035339.2758529.13448283322122075578.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 04:45:53 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 29 Sep 2025 21:11:19 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7f7072574127c9e971cad83a0274e86f6275c0d5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

