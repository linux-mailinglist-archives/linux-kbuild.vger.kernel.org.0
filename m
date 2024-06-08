Return-Path: <linux-kbuild+bounces-2034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5B19012F1
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Jun 2024 19:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59BD41F21743
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Jun 2024 17:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348D2C13D;
	Sat,  8 Jun 2024 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foP+HeS3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3A563C8;
	Sat,  8 Jun 2024 17:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717867148; cv=none; b=K2MZTBx1dXkTaQDKiWWpuC22KSAHGhCQacmxbIzaHL3C2zDm1UhbZOXAw6ShNNN/cdbxp9ZV95qq1BNNpEdoLjXRjs7+nCeg4TafxYw+muTPXJDTZsO7f2WYz3FUyy2DqSp3R80QOapRIi6Smh+sUmoWxQs9Ph/M8j0s4Qe3SZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717867148; c=relaxed/simple;
	bh=Qr/i6r4BQxSvKgBez5VKsyTQvM+ns+Oa4zim1XOTtvE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=jhIvZppZqHLunTf9gq/p+KKCWQ5LDOgRRz9hOH6XQrJlcqSr9jPY1mLSNJxsnLDWSbeLzxRdH6vqvEoY82x0TXy2hxXNZ7Ft54ODsiEzRbE7B2/dlUmHxux6DoDA4qx+NlI01nDJR/uUg775geCDGLJBb2nHueozpwVuJWoPEMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foP+HeS3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D24B6C2BD11;
	Sat,  8 Jun 2024 17:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717867147;
	bh=Qr/i6r4BQxSvKgBez5VKsyTQvM+ns+Oa4zim1XOTtvE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=foP+HeS3KpUhQhiKUsXvge5dJDetGxDIoRJB3GM7J80XBx7Tt4EjvBBBf5dj4PDrL
	 0Bm8VzHmSuJX3Qrj9rf4A65lsxQ5hVEDp64jWmieUIzzopG96ZyumBbhpvzqu0InKx
	 lCJgc+EyUxnpDaItmnBcJdxzs5B4Cn2NLK+eTIAf4Dp6Jq/a8gHhsjECVqhqzX7FX6
	 VGinSbB6oNZXP2PWESabnMByNHQvvAkVrQRRuLmefAo5vzWB+j3X/zeKWXo26STNDD
	 OYHCBnuP2ffakzPb85W6ON0IoHMaS+iMsFHPCEtFgN6Ino/UjR9y/vxYVNW0LtLX7S
	 htySlzRsvcWlw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE7E1C43168;
	Sat,  8 Jun 2024 17:19:07 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.10-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATJ8UbgHdPfi7nCkQLZNNf0hgsXe5XWAqW=-34p03Vepw@mail.gmail.com>
References: <CAK7LNATJ8UbgHdPfi7nCkQLZNNf0hgsXe5XWAqW=-34p03Vepw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATJ8UbgHdPfi7nCkQLZNNf0hgsXe5XWAqW=-34p03Vepw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.10-2
X-PR-Tracked-Commit-Id: 9185afeac2a3dcce8300a5684291a43c2838cfd6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 329f70c5beaefe0e1197b7919e776dc005213b59
Message-Id: <171786714776.12449.5561245791729200520.pr-tracker-bot@kernel.org>
Date: Sat, 08 Jun 2024 17:19:07 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 9 Jun 2024 02:10:18 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/329f70c5beaefe0e1197b7919e776dc005213b59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

