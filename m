Return-Path: <linux-kbuild+bounces-5590-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D71FBA24415
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 21:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34F4E3A5E46
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 20:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E719C1F37D2;
	Fri, 31 Jan 2025 20:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFKcMzaM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083C1F37A3;
	Fri, 31 Jan 2025 20:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355196; cv=none; b=TpRoYUWPrGLVUI7xeUvWlx1Nz6EryJyZECB4XQavb0j77+Mm5Bc2KOnbl275kJjH3+VTuYfVPQMsqW3+guWKJ203xOw//NqNrF0H+TlYOiSmRhoR0mndeTG+KHe+R5OVnMP6gALAfMShzBNyvCSbcpaRmD1WK5ksU83bb9m5GgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355196; c=relaxed/simple;
	bh=adHHiLIPTwQQIGz+wIkYFuF1t73pjM4yRiIE+rWiWi8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Sd9TAr2VnGcU3UUNjJLCb0yNuAxlNgCQ0lWbkX2QgjtQpdrEGwHH6FqwN4nPKZhTy5+5eoraubpkvRi9BuN+PL1Dut5N+PXLgThwFR7eoAyOZAhvcX8ykK48CC9QVwmJsjBP5b6+5tNxoQZnFDBI8SldES6bSoBIxOKdTrho+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFKcMzaM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C0FC4CED1;
	Fri, 31 Jan 2025 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738355196;
	bh=adHHiLIPTwQQIGz+wIkYFuF1t73pjM4yRiIE+rWiWi8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=FFKcMzaMAyhY9iq7qjzvxTEcvau1dul9CujFGtt78jSxXjrf8XzBOQp9Eh2MB/D7H
	 xO3NHFlIwfDnBVMYTaimbQLGS2OwnvdRYcB9PO/ni/7GiZEM+FFKRgVvJOeGsdqIxo
	 K2AST5Zov0h2TPLOMFuO/cXrw3TO9Ax5J9K8It7heb95Bqht+5CfbDaO/AXp1hmMc5
	 SWlJEQyJPalCWn1D700qhtCSxu2P7QJaj1B4ZRnAwvJtm8/bu2DWvq5hPi5Q1SAnNE
	 KZFFwO3RQwDekQwkcr/nSkLqVnNYNMhuL5oQ+yCdrRy2rJ53LwE2ameEzKSaZF8Mwk
	 4NsIuofXdKWEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE41380AA7D;
	Fri, 31 Jan 2025 20:27:03 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
References: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.14
X-PR-Tracked-Commit-Id: 695ed93bb30e03e9f826ee70abdd83f970741a37
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd8c09ad0d87783b9b6a27900d66293be45b7bad
Message-Id: <173835522255.1719808.12150045798968187928.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 20:27:02 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 1 Feb 2025 04:44:38 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd8c09ad0d87783b9b6a27900d66293be45b7bad

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

