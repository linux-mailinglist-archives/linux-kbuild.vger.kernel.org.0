Return-Path: <linux-kbuild+bounces-2711-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2064193E9B0
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 23:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF1401F21F48
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2024 21:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4081479B99;
	Sun, 28 Jul 2024 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGp6Qb0e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172C378C9A;
	Sun, 28 Jul 2024 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722201549; cv=none; b=cLk0OEQPHwdqb5YglOsSQ5xNAIZPrGvazHDnnCZLPeVB3ZpJHncRSy8j2t0QAxh6x+EgJCZpj918o1WvI2gH1iLTIthWF/nMRKXAty4QstHEBqtARi416AnBxbjoTymnRGIAacg8N4iH5pEvLxtaZ5KR8eR5kFuWewPi7hGU0RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722201549; c=relaxed/simple;
	bh=XheBFlkaJtpYXUWNkw3sBcPXmuLv3WIPyq8m3s4X54Y=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kPeAoG/flimOZ8prFNCkqr0Z7ugCBg578vpJG9s2Ujx62N0Ue39B62ppcSgmVDtFWT7/yKnru7zLMux20qMKZOIDpHAH9cgEibUrUwU59rzPuNgT+nPlBEnqVcLRdmwpIForvSG5j3Zp2VHyvP/rQk2My5M/o7PmKjs14s/XQBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGp6Qb0e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A33DDC116B1;
	Sun, 28 Jul 2024 21:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722201548;
	bh=XheBFlkaJtpYXUWNkw3sBcPXmuLv3WIPyq8m3s4X54Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RGp6Qb0eWBWWE3en6cMiOuIaRInX7AbuSbVaEz9iF7LKDNn1wGQ8QIeVgCr8r+VZD
	 mD4OyMmOPqVbcvIO863Ja0nUx/aDtdgH6BNReTi/DCA8DRq6VXaNzIR6C3I1GPruKP
	 MmkfU65o9YKmb12gZLJH+EJ1gsWlyZs+LsMBI0nCSTSX3pUjp9eTRtgon1/jw8R2MA
	 GXsfb7sF8WtHdQbUhSsOJRRl9SLOT+LBRvLvmhU9HqBgUuEe9sqmCMG+wM8FmqzYIj
	 ZEXSOLsJL5FWGE41Sg9v9N8wIPyKapcm/9M6dIiXjtJGWOSr3ztj47q1b9ia6jRhJe
	 x3LIlPVpaLq6w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9155CC4333D;
	Sun, 28 Jul 2024 21:19:08 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQa+SNKqYtvqQT+QPcH8NW2sD+JxOShNzZrfRzRWRUXtg@mail.gmail.com>
References: <CAK7LNAQa+SNKqYtvqQT+QPcH8NW2sD+JxOShNzZrfRzRWRUXtg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQa+SNKqYtvqQT+QPcH8NW2sD+JxOShNzZrfRzRWRUXtg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.11
X-PR-Tracked-Commit-Id: 3415b10a03945b0da4a635e146750dfe5ce0f448
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a0c04bd55a467aee3eb647555343ad6971106e86
Message-Id: <172220154858.7359.2264170309744314492.pr-tracker-bot@kernel.org>
Date: Sun, 28 Jul 2024 21:19:08 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 29 Jul 2024 04:01:49 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a0c04bd55a467aee3eb647555343ad6971106e86

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

