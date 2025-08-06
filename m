Return-Path: <linux-kbuild+bounces-8305-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE0B1C012
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 07:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBE2E1886FC4
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 05:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27DA1F5842;
	Wed,  6 Aug 2025 05:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8feBBD4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B960F1E7C10;
	Wed,  6 Aug 2025 05:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754459373; cv=none; b=RytSiFmpevRmOedK12N+e0ctNnAEKl1wpfZZqWGZ+eGPAYbzfuIYX+dEPY1mynpFwpE5uWCEb0IUdJouZiLnO7ANe5SyVslXFR8h4/HSuUOh/JotgtubeYo3s6KnnV723lNywy/z9TLtB+A8jJNYCsU6mkxHfxJbZdLx51isJ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754459373; c=relaxed/simple;
	bh=xSDD4pGcqN4c/nwuSAp6YDjZD4NL/TiX3zsWRHDiftU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Nnw6/pF4jq768+JlW6fBEmWU4bN/SbPq7GCFVJsOvtjZhaxPMl85qKbFwA433bY/OvNgdBO2dpPK6uT8hNyj/ZXxi+X4UBXB/WZnziQ+E7e4pH/uJEvmfS8QVyyzCmQhkJcz/1BfPIU2Nnx9LXd1XRhC78BmLxII2mk9ks85yII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8feBBD4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF02C4CEE7;
	Wed,  6 Aug 2025 05:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754459373;
	bh=xSDD4pGcqN4c/nwuSAp6YDjZD4NL/TiX3zsWRHDiftU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=W8feBBD4TdXvN7wz5aInAOBki75e2FmQcUbuI90XSDybWzj5spWoBTh3ND1Cd5JzQ
	 K3HeGaemiWJWq9cDPsNee7fV39i9y78cC8d8Eu7rp+bmSCyJrZncmi1JWooQ4J3sR/
	 YjL+56ZQEiP4YMXnhh7TC8elHtQdFtLRkP0YHgKRYZQKNfCFDOXFGZHrrvTI6wagZy
	 PyfOS7pOlalhbJsCbx5x3/vcXFfoanwb54DltgLpCOF+MaQaoumngfD9zvAFaHckzM
	 /vut38pBLeMWzXxiul4jjqQ439Dk/m7gIwT1a6aAGJqtpKx5HI3iHWFNIdDE1PZtb0
	 ukX6RqQ8iUygw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710CE383BF63;
	Wed,  6 Aug 2025 05:49:48 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v6.17-rc1 (take 2)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQdcpEARErjAdJLGf3whwWy-1z8kGtmEDKq3M6qqJQx6w@mail.gmail.com>
References: <CAK7LNAQdcpEARErjAdJLGf3whwWy-1z8kGtmEDKq3M6qqJQx6w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQdcpEARErjAdJLGf3whwWy-1z8kGtmEDKq3M6qqJQx6w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.17-2
X-PR-Tracked-Commit-Id: 8d6841d5cb20dcee7bf9ba98cb6dbcbf5bccfea5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a530a36bb548bbd441402b736f17339183ff53fd
Message-Id: <175445938690.2647103.7951051318452984036.pr-tracker-bot@kernel.org>
Date: Wed, 06 Aug 2025 05:49:46 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 6 Aug 2025 12:50:57 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.17-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a530a36bb548bbd441402b736f17339183ff53fd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

