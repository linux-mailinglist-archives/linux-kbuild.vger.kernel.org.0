Return-Path: <linux-kbuild+bounces-2291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C820B91D2FE
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Jun 2024 19:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72AC91F211E4
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Jun 2024 17:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95272CCA3;
	Sun, 30 Jun 2024 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOzX6t5i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA75282ED;
	Sun, 30 Jun 2024 17:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719766987; cv=none; b=o56FGYOkm/j1Rg/uPoz7Z4f3mqIFqC7e+hlDsZ2DIoynsgDVbZ0zTes8y6mkJ8JBXHC8ttLxtLVXmBZ8F59FT+9NrJ0ytSh/HtZ5g3FrBghokpDu9CMMjYAY/5sfzmekK/CjCFOT0xTK7K2w2/C6NuTFwhaXJLffgaTCsKXKkBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719766987; c=relaxed/simple;
	bh=rcZ9MgnQ7vv3/1/0xHCwYBWnkrFoOy7LWYwosnP/jnA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QEA/HOQRxiwjaJFz1L8v+tFydy4Oqpnv9rX5Z7p0HTs5ZWWnPnvW0KP9lkDQobxsFtZvyba+6r4RyprtHnnZl7Ko5B7ORvz+mMuKY3WyRrPd4yThXfXxOXdEk1jB/hlOMv8XoV6MZCJxc3NFLbmJFEdwmcQjODz6oZeWreNcJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOzX6t5i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F389C2BD10;
	Sun, 30 Jun 2024 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719766987;
	bh=rcZ9MgnQ7vv3/1/0xHCwYBWnkrFoOy7LWYwosnP/jnA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UOzX6t5ic0vzadYuZneJHghylnuC/sLmA1Lcl5Tq4Mq87vMMAwmTsHyvhQe9UByeF
	 TvaEO75etdceuHZ1deEl9QWT2eFD/AN5b32npvc3E+/29OSxkRxZw8sri+oHXcSz3j
	 9JtkI5y+nul0aVGCK0yKL9nb0VOIHWhouHJRjFdJcWNV+Z5LuBYl4KGVvCUEAFPzIt
	 LUJGXAqxNrcV2jSloJz+yaRUhucdrXMGAwZj//EdobvKctmOwhxVUbtvcTjpiAAJ0I
	 UY1Flqp0s+xXlukcGG72+K1Uwz/ie76Q1HBNE0d+ALmyTcfurI8eK4h9M2TBt8ZDtp
	 vsbsg/wrPe1Mg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D73BC433E9;
	Sun, 30 Jun 2024 17:03:07 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.10-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAT79u14memh31qEJJ4JsuXruqS1PRN9x9w2GPLBZbf5Kw@mail.gmail.com>
References: <CAK7LNAT79u14memh31qEJJ4JsuXruqS1PRN9x9w2GPLBZbf5Kw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAT79u14memh31qEJJ4JsuXruqS1PRN9x9w2GPLBZbf5Kw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.10-3
X-PR-Tracked-Commit-Id: a11aaf6d0bb4282ce1989e388b13f8d87154ba75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e0b668b070348c36e0ab83af12987b6390f9ec26
Message-Id: <171976698717.9977.11006623477375028073.pr-tracker-bot@kernel.org>
Date: Sun, 30 Jun 2024 17:03:07 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 1 Jul 2024 01:55:40 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e0b668b070348c36e0ab83af12987b6390f9ec26

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

