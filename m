Return-Path: <linux-kbuild+bounces-2517-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFC2930BF8
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 00:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA9981C20BA8
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 22:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB83213AA45;
	Sun, 14 Jul 2024 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QrjXpyXy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE744AEF6;
	Sun, 14 Jul 2024 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720996964; cv=none; b=PmCEfw9Vb5T2HPo4XP4P9uecZYGElH054Bws3V4N2VtrvwebGpFb1S5OGLSeEBCifj9Hhy12PodmPXUUVijsSptt3/ncSin42r/BBeI6cqkSsfrZzXiJQi/oSMciWPKVomxqIQrGZBR3pi80ihWlczph5XNzYLkLsn14Tbr9iKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720996964; c=relaxed/simple;
	bh=doH3fBuI3EolM6RmqV5/npNvdpMQ2zI62eu2B17EcwA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NYfoEjKFbPssttGWth5q7R2WpJrbJadt4zDmJxfBSRoxMa5ZLaYWiHyox1pMYYr+0ZfWzhn/laLmf/F8TnQy3WlFvzZABqPnVTCeGdV7LfSzyjaWwQMvCDvC/CMbFjODc8yHUN3UBwTv++WBNNyZW0+ws75rvc9/neRjlP87+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QrjXpyXy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ED0CC4AF0E;
	Sun, 14 Jul 2024 22:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720996964;
	bh=doH3fBuI3EolM6RmqV5/npNvdpMQ2zI62eu2B17EcwA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QrjXpyXygC0I/HCkZ3FbsnLjbx5y27fFywaHptoe5NsPZ4/5ax1gWQB7J4ED5386f
	 7zNyxBX6ijvdwrtOSD/2TUnbeLIthAgm+4VBCVT/oU+WRHyAS2r8bNkT+06oCuu3zq
	 yUUaqZXFuDDG/nz6i569x0GTAep0xTxxlFlzNsgrWL5mf65ZKOA+Hp2GMY43oz+h32
	 SMn8TWtriLKIf8tbm8XfLGEHSVmrO7Zhevkdw04MvnRtzHkiosZxoEZviofJnQhD24
	 lSYvlG8G++8MEZwIyLq5DcphM8nREbEl3A4N9FX36dINsyVmHAhv+A7JjcTdnKDGlQ
	 t1vEeZlQTgm3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 728E7C43168;
	Sun, 14 Jul 2024 22:42:44 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.10(-rc8)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARuKOCDqv-V_Y6moUmNVqBmApVJy6yZKosFOp8zW6Vt9w@mail.gmail.com>
References: <CAK7LNARuKOCDqv-V_Y6moUmNVqBmApVJy6yZKosFOp8zW6Vt9w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARuKOCDqv-V_Y6moUmNVqBmApVJy6yZKosFOp8zW6Vt9w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.10-4
X-PR-Tracked-Commit-Id: 84679f04ceafd58d9b35f790203520b2930f1a03
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 882ddcd1bf63c2984221dfa8c435f8eeb3d9b6f7
Message-Id: <172099696446.4566.15814645761775779608.pr-tracker-bot@kernel.org>
Date: Sun, 14 Jul 2024 22:42:44 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 15 Jul 2024 05:30:42 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.10-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/882ddcd1bf63c2984221dfa8c435f8eeb3d9b6f7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

