Return-Path: <linux-kbuild+bounces-79-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C677F093F
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 23:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FA7E1C204F5
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Nov 2023 22:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF7A156F6;
	Sun, 19 Nov 2023 22:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6SD5WlS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC118E15
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Nov 2023 22:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E3A3C43391;
	Sun, 19 Nov 2023 22:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700431390;
	bh=vXMa0sCs5I27qbJxLMwNWDYdeTZJEGwYORtaTKISIGI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=u6SD5WlSVUwOqMPPQvYoEeM+Ay+RRr5qZM8dihFIYMG69mdFopBO0BSknJbTIfCr6
	 9H09rlXLAvZWtMTIepCmi8sVoX7y0s/uxvam4WWeOCS7uGrHEx/9b0e/6IlPeH7n/v
	 YQ/9iOYb/gKT6HqbF9hRsyiIOUjvF5a5Ba2EESvPmE52WLjeVL5kQu/gYuOkgD6Abr
	 PjN0jaCk1cH2LV6tQvXRuK3Dr624fOKt9R9YwcGnum0y+K2VGwKScR9azbBd7Gi1T/
	 FazAiNpWKu7eCOnxD+NCKgaqFbhwQT3W40Z8B9gCojCsRRoqYkPSW8SBKQC7+VQeJa
	 Jlt7qRK0vU1+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D6E9E000A4;
	Sun, 19 Nov 2023 22:03:10 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.7-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATS=c2K7Ttg+Sb6gEmfUkrMbTQ0c62niOFzayzRF-rOdw@mail.gmail.com>
References: <CAK7LNATS=c2K7Ttg+Sb6gEmfUkrMbTQ0c62niOFzayzRF-rOdw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATS=c2K7Ttg+Sb6gEmfUkrMbTQ0c62niOFzayzRF-rOdw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.7
X-PR-Tracked-Commit-Id: ae1eff0349f2e908fc083630e8441ea6dc434dc0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb3479bc23fafbc408558cd8450b35f07fad2a63
Message-Id: <170043139037.9984.17169970172856896609.pr-tracker-bot@kernel.org>
Date: Sun, 19 Nov 2023 22:03:10 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 20 Nov 2023 02:01:14 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb3479bc23fafbc408558cd8450b35f07fad2a63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

