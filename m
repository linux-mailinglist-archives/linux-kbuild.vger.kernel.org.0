Return-Path: <linux-kbuild+bounces-5772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 672F9A3779E
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2025 22:02:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C95E188FD51
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2025 21:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9379A199FB0;
	Sun, 16 Feb 2025 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWaYp0XF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF1518DB03;
	Sun, 16 Feb 2025 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739739735; cv=none; b=BGRx4vdKQp2nLOidkPLeAo/iukVcJ9ubgmIPDAwydo5IIEG9eHHF7o3VK4VlQipjfQP3LDQHNS5gnEFwxXSyFrphXq/E/ULtWBNOPEU/Ze3eQcXlBabP4U4ZRFlsRh+0EtfmwvEPsCKreuNXjpX5jqu2DgKQaKWIvPPpljDNfMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739739735; c=relaxed/simple;
	bh=XUNNOAuWuiEbxNOXCMPcYX7OkJp5alR9wSQ9fO4e9Os=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ruYJnhe9h3RgoyBj7Ib0mIIHtq2BqfxPqhXNEfPerbFVjoPSJUqxee5AtW0t+iiN02hbwlu7CPFfNkIU+RtGrykUc/rvFdFCLYUOmR/NY6EyM31dMSbvUE9Z6qctMV7t8yaPsODbdHrnSOLMzQLmeTQ5ivbFFH+P4TQf4byBerQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWaYp0XF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D456C4CEE9;
	Sun, 16 Feb 2025 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739739735;
	bh=XUNNOAuWuiEbxNOXCMPcYX7OkJp5alR9wSQ9fO4e9Os=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GWaYp0XF58R62N8bxIdAed7hEW6XnLMmc6GEFWq8wZ8LyiFwG2E7vNDEuiK2TT9ry
	 2+rDRpaUtbHv7wMwM+GntQ8S8mWlvKiwZaE4vM7RQ01BXlkTlLW3aAQJVVHHHHZK2q
	 8aRNqCk9g/iGoUpWEAFIRXlq5jd1/MeN66ATDIDjAsjZd1tfgD+TM9cJaQhfISJkP6
	 Nnvx77tTYq8VgGax0o3US+nzuAE9yxWRaF05O/x0jfYfaalmMSU4/i/vP2ngPasnIz
	 j0X/zbpPuZiPmgSX9k98j7ErzpB/iAaOngXdlZSQUErGzzYFmlT6g45WYhQcqSg7OH
	 LgoXat8QSx7Bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71338380AA7F;
	Sun, 16 Feb 2025 21:02:46 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.14-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARNw193tNyEd_2SmY4m-z7NYWd9k+GTEi8Ck0f5RtOm_A@mail.gmail.com>
References: <CAK7LNARNw193tNyEd_2SmY4m-z7NYWd9k+GTEi8Ck0f5RtOm_A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARNw193tNyEd_2SmY4m-z7NYWd9k+GTEi8Ck0f5RtOm_A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.14-2
X-PR-Tracked-Commit-Id: b28fb1f2ef45eeef1cd2c23149b50d184d545a3e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 224e74511041c2d33dcf24adf54d447eb72399c8
Message-Id: <173973976517.2568330.3311585462460696345.pr-tracker-bot@kernel.org>
Date: Sun, 16 Feb 2025 21:02:45 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 17 Feb 2025 01:43:03 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/224e74511041c2d33dcf24adf54d447eb72399c8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

