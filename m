Return-Path: <linux-kbuild+bounces-6031-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D183BA58785
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Mar 2025 20:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99E577A3678
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Mar 2025 19:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A984D1A2C0E;
	Sun,  9 Mar 2025 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXKBHVuY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D5416A959;
	Sun,  9 Mar 2025 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741548298; cv=none; b=TTH47smEzklm8wqmKXNBoTc/0cBzS9F5MGXMWiVcnHWjLwO4un5X4KFTNIf4v49MCEq6X+87fJvrxLiHdN4RoQko0YLVyfVqw2TOfolJYqwebwHUZgJcdPtqpND4A9EQXZ9ZITi8SvF/VV1MHhE4eDKSQKxhzj9jtfwc+K/MKo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741548298; c=relaxed/simple;
	bh=t+TCr/rNXaxXnCs8S15I4r34Ms4YY3Gqirl372fdgLw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=oWhTA7gT6ImqYLlnH+tp0nzSg7voIrfzR4lZyV+SPB8MWZv9pyMiK+rT4Bt/NfSw8oc5STAxIeKdSu1Rh/6cwLajjm4CF1L1cFPyl2/JQRzPOF1fjq1bEUBLcGljoIRAzTsMXBZn5tjBjEQgq+4W8MtwMIWtX8iUdtT+i6RgZX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXKBHVuY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C32C4CEE3;
	Sun,  9 Mar 2025 19:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741548298;
	bh=t+TCr/rNXaxXnCs8S15I4r34Ms4YY3Gqirl372fdgLw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qXKBHVuYl4xajSt/lvW96yelCR+K/vwh1dKwhAstMSkST0LwX3Xcj0/JKM3OtyYhx
	 kBbdc1mGxr2d+5WiZfCL1jtA5sUZyyuraen5cM1OjDEoYBhF3z+e6uLBGS8j4Txpz+
	 PeRMA8Ih2+LrrccLH5+H2wDiwUPZRsMOaovvltANFRcsMed2GaK1AcMcdr9lmiROqW
	 yc5Wen16iNyktRzAs12gTI3NsknUl+U9e6ca5t2wRxdnaQWDtK5Ndv8xFnZp9CQWHv
	 5Ws0LN7jfJwMKzLXT1t2ohuaEx71HZCzzS+kaIBft963qZSDClRsiUn75T+H2mMEVr
	 +9AmEaZGTdpMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FDA380DBC0;
	Sun,  9 Mar 2025 19:25:33 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAS_En5ooXYfjWEZVbwBcymDaEwGs8ug6w4-82pGa4+VpA@mail.gmail.com>
References: <CAK7LNAS_En5ooXYfjWEZVbwBcymDaEwGs8ug6w4-82pGa4+VpA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAS_En5ooXYfjWEZVbwBcymDaEwGs8ug6w4-82pGa4+VpA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.14-3
X-PR-Tracked-Commit-Id: b5e3956535466187657563b754ba0f1da8626c7f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9712d38c87087ae34f8cede6583092c272507c52
Message-Id: <174154833211.2955722.9510509873077625807.pr-tracker-bot@kernel.org>
Date: Sun, 09 Mar 2025 19:25:32 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 10 Mar 2025 03:21:47 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.14-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9712d38c87087ae34f8cede6583092c272507c52

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

