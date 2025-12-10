Return-Path: <linux-kbuild+bounces-10042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4DCB259E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 09:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05173300720B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 08:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B722F7ACA;
	Wed, 10 Dec 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtS50W1s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02DF1F872D;
	Wed, 10 Dec 2025 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765353870; cv=none; b=ihPqM0gLZ0lcpqon7oP6dR6Y4Xg7DdjzY73UIvg5iW0WSIvlu3zOYd4QzCAsVtPcYsZhk65OGw3XbVGhpEmESq/zKFUJ13l0Xo2zYmIfFrpvVy+RNxieZ7Hd+G67oCMx742dGyFtQXzew7Zm87tRHUVLW5v4BhxK2XUiBcl3wjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765353870; c=relaxed/simple;
	bh=NoMvfIi61YaCNgCsXHj1grd91tdkPwxaTr2pJzD5h6Q=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=aPtQQiC3fydT3alCM9TnBTb8fXbxry2EI1tLyUIJxoHvtg9z7iMy3yzAgfenMpovy4pCkhjNphApBabpsr6X/ST05G88qKEB8lsxcbZPc10I4H4Yg4F0dG5dTibW7r6ruE9d4V2zce7BDmBovfeS/KJqRwhVd8bYQN6XzScJlJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtS50W1s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473C4C4CEF1;
	Wed, 10 Dec 2025 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765353870;
	bh=NoMvfIi61YaCNgCsXHj1grd91tdkPwxaTr2pJzD5h6Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CtS50W1sltZx1gGYZox0m5PId471Xt4d1uMbeaKMxXY7LKL6LGw6t84uFvIHMXZe8
	 hKEX/5Bbof1e3AMk4uBt3M44cX3jdKfEoRad5MDN7MiSz+Hk/DwCzprtMMtik5By2N
	 BE2ce0hbp+M3eqoQvW2vXE1fOfEMpnKZIC60b2kwOzuqmdX8NLc6YnC0FMciegDvyM
	 yp6ldPLPuvOAVzCbEa1Lu39Z7e4k2VtrwteCvRqQVG/bsk9Ygso53C+wzqXPGBdqte
	 GHkMN0Qytl3TXoTLQKOcNqk9UKZizOFYKGgqU30sowbRtwRwHEQ7uNOKdaW/pWwfG2
	 2xCNk/np/B0SA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B7993809A18;
	Wed, 10 Dec 2025 08:01:26 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild for 6.19 #2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251210071715.GA1138940@ax162>
References: <20251210071715.GA1138940@ax162>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251210071715.GA1138940@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.19-2
X-PR-Tracked-Commit-Id: 4ab2ee307983548b29ddaab0ecaef82d526cf4c9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2137cb863b8018710315138f40eefcceb8584d1b
Message-Id: <176535368478.496531.4933865295625330720.pr-tracker-bot@kernel.org>
Date: Wed, 10 Dec 2025 08:01:24 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 10 Dec 2025 16:17:15 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2137cb863b8018710315138f40eefcceb8584d1b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

