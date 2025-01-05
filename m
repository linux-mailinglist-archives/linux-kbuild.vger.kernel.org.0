Return-Path: <linux-kbuild+bounces-5391-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D38FA01BBE
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jan 2025 21:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45A643A2D98
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jan 2025 20:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC9F1D619D;
	Sun,  5 Jan 2025 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I0Z5GHWd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32121CEAC8;
	Sun,  5 Jan 2025 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736107425; cv=none; b=kMLtiRNXSXHTx8G5RXMg+KfSeiZhIOvzz7WcC5hJe9DUgWdt5fsN+jFEjRuJ3ror4Z90X2L2nZFZmkKJbUbuAcSkH927St0n0qe+/xWacL5asnqVValsRacINovyUd6TKcAhzLKNACbt0AthmEst1WTs0OOVInY7e60QVPMS310=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736107425; c=relaxed/simple;
	bh=K83FmScb1EpoeUjh+1QgX6UBLKMVxc2vAMBxfeNr9l0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=sb2tSIx9k5nCtQ6DBsLLGMDbQkzO11Eb0Ke4lwTVvY4bC6Nbuv3yW9THFf/irDzG2i/wgJqVFOh9DoIUcDfUKlzHhpAFXzvKZN46yF9CVakO6jTB6IdrmelM5VSmo5ubiwYGv5Z4BWAa1I3BSEZm9NO5B+7KlOOr9AAJD5Ys9ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I0Z5GHWd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D6EC4CED0;
	Sun,  5 Jan 2025 20:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736107425;
	bh=K83FmScb1EpoeUjh+1QgX6UBLKMVxc2vAMBxfeNr9l0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=I0Z5GHWd+OhHxT+v5M3kAb7PSr8E0iG7+aZKHNzGdyDaHIpcxYyswh1spVXBYAcLL
	 f/HfwxNullST+zJ/Fp8mX8Pc18MfAvIq/TA6TH2HMxS20/znncgeVUU+4TpaZiev/U
	 /wuH5GURu2zWbuvHp62BgFRlyzSewrIqkuETTO/VOx3yqNOwRw++W4aYktVlJrA15w
	 5FAivFk1IWY+hzXrtIN1GxSMtbS9Vj+MXTOuf8j0UhzivhvNzUXytqI93xEFLCOnzL
	 VEB8llMgmnuw9XVxtFjedRZ5TxnA4kqyH9x0mHJ1qBeTJwcdzoAxtOvouarYlOFhj6
	 M+ulbywuk6vrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C58380A976;
	Sun,  5 Jan 2025 20:04:07 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.13-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQe5cn_Jnr++a4Dg0Qhrxc88dvwTji1Z-JbYimE3xD39A@mail.gmail.com>
References: <CAK7LNAQe5cn_Jnr++a4Dg0Qhrxc88dvwTji1Z-JbYimE3xD39A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQe5cn_Jnr++a4Dg0Qhrxc88dvwTji1Z-JbYimE3xD39A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.13-3
X-PR-Tracked-Commit-Id: 385443057f475e775fe1c66e77d4be9727f40973
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9244696b34f2a626d7468864420ab6a47289bf10
Message-Id: <173610744607.2663043.10264399457694415133.pr-tracker-bot@kernel.org>
Date: Sun, 05 Jan 2025 20:04:06 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 6 Jan 2025 00:00:49 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.13-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9244696b34f2a626d7468864420ab6a47289bf10

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

