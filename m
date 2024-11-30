Return-Path: <linux-kbuild+bounces-4916-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5529DF3CC
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Dec 2024 00:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91B6163115
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Nov 2024 23:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D5319307D;
	Sat, 30 Nov 2024 23:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzR+eSlG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E276C156C6F;
	Sat, 30 Nov 2024 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733008533; cv=none; b=V/LyPaapgOmGYvulFkjTn2SkSeTAZkgE8a9TdWmYR4rz2xP+Eh4L/ZJuHxOL9OH3WRdeY4CDCbkSLddbqk9ZuWy+FCJ7aIEsOezrksu2+/vWqRqy22NsMYsbjyW05ZHuM0Bn/pr14oQCsF5J2+znlLg3uf6PRA4BrJT+zJtOq+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733008533; c=relaxed/simple;
	bh=HTfq+tB22oOqkSgaBGDztlLThc2x3K2eSvOG8DolEwY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=e3/8UtIC2RFPBxc/khPK5LqIurXdQvqO6Bqq7VT6ujx8s9twiE6hyePNmGXQipKqx4KP4g9fKZ2ppap0dnjNANCfjVkN17w850cTBjZRHg75Y0Nk4Of2mqLKKhYawfZalQ4D27J6VbzgCqENw0c7r9wa+pxaHQ6oHESjestyNQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzR+eSlG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76286C4CECC;
	Sat, 30 Nov 2024 23:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733008531;
	bh=HTfq+tB22oOqkSgaBGDztlLThc2x3K2eSvOG8DolEwY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QzR+eSlGnxfDKX6t8NGHN7U8DQvJbBpyw+QkptWNdIto+bmDOQKqlRNKQWcWNn2SC
	 ZHU3mHrmHg2PZYxylyRmBG9yQE+NF5AmGIaCZkpiodv3zUWEhuJtK0K0bKe4Onvt0j
	 nKKQ7FSgCUnMrocUVoEzYIXS12m24h0DXsLklwTvlSfoaUjCCDd4xgUMXV4uQcX9DX
	 m9lHZFRDAKRQUU3ORsREkoWIbjGtlvv7rHpfTJM2CYxV5pcYXE8pg+zZJn9O1AnUnv
	 ct9gtzlnsmlgjpNvULt0aYh+7Gbbw4OXnAd504SUti77mAxXz03uW8T62PUp3skzn9
	 uTS0vb2Xr6jlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C29380A944;
	Sat, 30 Nov 2024 23:15:46 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAShSZrZh_-0wpUA2=FpnomQTBzhxY2bJbGwkYf+kyTzLg@mail.gmail.com>
References: <CAK7LNAShSZrZh_-0wpUA2=FpnomQTBzhxY2bJbGwkYf+kyTzLg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAShSZrZh_-0wpUA2=FpnomQTBzhxY2bJbGwkYf+kyTzLg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.13
X-PR-Tracked-Commit-Id: e6064da6461f989a357f2e280d7f8d4155267c4c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6a34dfa15d6edf7e78b8118d862d2db0889cf669
Message-Id: <173300854499.2503582.14475164349857844645.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2024 23:15:44 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 30 Nov 2024 05:21:53 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6a34dfa15d6edf7e78b8118d862d2db0889cf669

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

