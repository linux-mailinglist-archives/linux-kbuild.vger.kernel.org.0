Return-Path: <linux-kbuild+bounces-10353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F332ACE81F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 21:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E47230142E9
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Dec 2025 20:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7FF25CC79;
	Mon, 29 Dec 2025 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UhMds+Wr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B21242D70;
	Mon, 29 Dec 2025 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767039692; cv=none; b=R4oCrl/TboIJYXQwdVal4S5pLi2dyhXqcLDHQNiSBxkWF5AhP3tqgQ5NKNBYwD6rKe/prKufMdtkM0FocqHEZI2DVXoBHADf5ztz9Ox4zOM2b4X6kBVpsO8mX9+lWXqRpPWKY8+QBU+stE3HXwxLcLYWdkf3IPKFmtBz0v/NMUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767039692; c=relaxed/simple;
	bh=N1S4Z5NEY7Rl2s3dX1sr2jbHeDIKDfQU/+EBXsiGu2k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TgzYMpYCuNeVPluAPCBngY8ixvqbK+V3E6s8fvXW0GekgF9BRlmI9yZgTWSfi/D8Lb4SlMofYg5rjhZBUL2rQ37VfvKLXX6K41M8giwYfhTBtMUgdZkxs9nW9NpDguDE3ct/L6uGjkv+QW86nGJnLdfi1j/9YYyGwEPrKT6Pyfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UhMds+Wr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41292C4CEF7;
	Mon, 29 Dec 2025 20:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767039692;
	bh=N1S4Z5NEY7Rl2s3dX1sr2jbHeDIKDfQU/+EBXsiGu2k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UhMds+WrHa1oZC+0HwlxCcseK3QLfaE0ScvIuTEp1loNLWuRf0/0nBsVIa4Llh6Si
	 XuVP2CLe5jdl9MRxnaHjOmzEUxI6e/hERbGxUYtWzvarssoqfuhCS2/uI7mnkovsjG
	 oPlOkokT8EQLDl8aboY8PGB7+qNOtO16NT6gpzUM+hn7NaUzhUWHUX+Fx6g6njTwyc
	 w/t1PB4EGocSegAyAEnv1mIxvbkMiSA3tEx4Hd4kLP/VLViYSaNxdgtVQHj7z4Cgvu
	 8TqX0QP8AIugMKVbv3KcHBWgFZK7rBgJKlPUcqOaf1lBZaEdqCMtMKDGH4lUI7/7mZ
	 4SDrMr+rZ719Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2AA23808200;
	Mon, 29 Dec 2025 20:18:15 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aVLYiDvJ1jsEAV9n@levanger>
References: <aVLYiDvJ1jsEAV9n@levanger>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <aVLYiDvJ1jsEAV9n@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-1
X-PR-Tracked-Commit-Id: 1f4ea4838b13c3b2278436a8dcb148e3c23f4b64
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8640b74557fc8b4c300030f6ccb8cd078f665ec8
Message-Id: <176703949466.3046711.813589619754733465.pr-tracker-bot@kernel.org>
Date: Mon, 29 Dec 2025 20:18:14 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>, Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 29 Dec 2025 20:37:44 +0100:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8640b74557fc8b4c300030f6ccb8cd078f665ec8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

