Return-Path: <linux-kbuild+bounces-9970-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5FECA1FDB
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 00:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6FA03004186
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 23:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D1F2E8E07;
	Wed,  3 Dec 2025 23:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dybg/5g/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0078A2D8791;
	Wed,  3 Dec 2025 23:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764805985; cv=none; b=MpyFIcQcWVtc/XmgiSEhEcqErUy8Qz4oIHg5dyaZkPoCv9yiEVFo9k84U+c31Hu3221DpvSJGVyH+6NDjJOyH2Ta0MgOYEy97mJIeQzSW0n2j5f5xW07hFqkQmgV+961QqVw9t/Rm4oEEv0Tz3KF6ZaSPQmO2Q0z9yGmhrauokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764805985; c=relaxed/simple;
	bh=zcQDVnu2zKPYnbSaTFdI6SgX4qM2cavjeSEPvKc0vkY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=WiUK36W1P4M2CDXsmE67jbpoJ6sGc9YVlduXNO9yLrNJHsrs9gutttcpx+nrIi+JR9o0Yl57CXJ8y3cdWOPifsVCB598r4Y+83ktLIWyEz4Qg0U9tRTd8uLk3CGTsTfOwMtO8FRGa1kv1tk0Cazl4k16c2wA0OcRUEk41Gvc4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dybg/5g/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56C6C4CEF5;
	Wed,  3 Dec 2025 23:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764805984;
	bh=zcQDVnu2zKPYnbSaTFdI6SgX4qM2cavjeSEPvKc0vkY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Dybg/5g/dbcE/xpxR6N9LAlubTzEz1KWIrV3aKGCfomri2/He2Q0IQt/XkRdsFtdu
	 rTd+W4V+P3UR7CTyNSADyOUBsSVrwLBndmywYEHKxL8QI6x/9Igmk+Sz+Z8b8ljCKg
	 mqwQ1Mch6Vy/9KgzwK0ABg47o3FSfYOkQx6tPLk/c19ptEE2TS1Wbv9W4eRBr6jzuO
	 8zTwCZFcX/LheuuKV0aBrd0TJ+uAJvt0BiOqoSkFy037dxyK9JV/O+KhV6C1qT3xcW
	 lGXVHxQY0rvK2yMSSURpp5p9bbGZmit15IdqNgrSZryVj6uLd0HFatn6VyI7mCynod
	 dKFmYnRIkrL2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5DE33AA9A81;
	Wed,  3 Dec 2025 23:50:04 +0000 (UTC)
Subject: Re: [GIT PULL] kbuild changes for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <aS22QhwdrHN24ToD@levanger>
References: <aS22QhwdrHN24ToD@levanger>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <aS22QhwdrHN24ToD@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.19-1
X-PR-Tracked-Commit-Id: 2a9c8c0b59d366acabb8f891e84569376f3e2709
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2ddcf4962c1834a14340a1f50afafc3276c015bd
Message-Id: <176480580346.130731.16528042234784893188.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 23:50:03 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 1 Dec 2025 16:37:38 +0100:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.19-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2ddcf4962c1834a14340a1f50afafc3276c015bd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

