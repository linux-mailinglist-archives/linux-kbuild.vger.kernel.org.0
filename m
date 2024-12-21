Return-Path: <linux-kbuild+bounces-5227-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B379FA23E
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 20:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1251188CD20
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 19:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C437218FDB9;
	Sat, 21 Dec 2024 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcoPlsw9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79F18C03A;
	Sat, 21 Dec 2024 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734809385; cv=none; b=MRFtCuVvvTkk6xyr4zBt2bc1C4JqIJKjS6lf/5FCA35SpMCz7ZaSmoUfmnG1Ff4DmHEvhnb4UxO5sDE/CwDP9QJ2ilWfiwrne6uPZFi5IKKAClx3duFgU3g8mNdhrrCUbe39m/LyL7q8wRUMXMklWrCatoThsmXK8CicNOmRwrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734809385; c=relaxed/simple;
	bh=J5zvCsYZEmObOkr8QYc6RUtVdEBZkL/0nW6mV1OKSLM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SiE4/wIxe9QfSzrGB6/qljVSRSjPyjK0JUfF+Zhb/kzP+siKf+grSCQ+A6jqf2gwKpj75KEwAyWshePPlRoS2dL4Yjhh/B2n+IQlPP/zJ/7j7MpItOAjai+wAq7aVyQ1VjiSuA/MrDo1PAGrcGwur5U3CUwDXqDtIC0HGL8ZrmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcoPlsw9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F9BC4CEDD;
	Sat, 21 Dec 2024 19:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734809385;
	bh=J5zvCsYZEmObOkr8QYc6RUtVdEBZkL/0nW6mV1OKSLM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gcoPlsw9Z1mUdfCBGdZcTJGFkZZ4+DkqxmoRC/uJIJbZwfeYs7SafuYGFDP1TlXyO
	 BlY6229jpTSFLQ8pSVTZWHZs6WW4PRbIP4MOvJNHHbpYImhbTpBggxl/Kr3hwFbEsY
	 ce3QcsTDNj/MnV0PyZvy3bU5dAAO9z1y4Q+CFbprZYMlgDvOQnEqj2L80JbvpD/oeK
	 umQ05RlUfV85rh8X+Ixqzw6VbsqAm3jrDa6SAacI6wQv2mE/BzVZhTbDLiwU0PbmAs
	 fsgrWQgjJLTYa/1pb0f20P8aMet6rpTOQ2TkGhmArp8xAKDqvly4aVJqjPDq36J/Vu
	 7t2SpgY2yyrSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 727FA3805D84;
	Sat, 21 Dec 2024 19:30:04 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.13-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQ_Mm0cCxU-TUqkuW67Wif1nPb+nnBfoLgTRwHnvCf3-Q@mail.gmail.com>
References: <CAK7LNAQ_Mm0cCxU-TUqkuW67Wif1nPb+nnBfoLgTRwHnvCf3-Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQ_Mm0cCxU-TUqkuW67Wif1nPb+nnBfoLgTRwHnvCf3-Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.13-2
X-PR-Tracked-Commit-Id: 9435dc77a33fa20afec7cd35ceaae5f7f42dbbe2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a016546ba60cbf3243f10670ae24fbd0bb343c08
Message-Id: <173480940413.3212866.11403152475475162551.pr-tracker-bot@kernel.org>
Date: Sat, 21 Dec 2024 19:30:04 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 21 Dec 2024 23:08:05 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a016546ba60cbf3243f10670ae24fbd0bb343c08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

