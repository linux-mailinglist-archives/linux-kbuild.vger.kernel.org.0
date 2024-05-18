Return-Path: <linux-kbuild+bounces-1883-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9905E8C9251
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 May 2024 23:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CADB61C20DC8
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 May 2024 21:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B695D2BB10;
	Sat, 18 May 2024 21:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3Bz9DKY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702569D3C;
	Sat, 18 May 2024 21:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716066348; cv=none; b=UbhmHnZ0Zeny7sKxvUd1VF47BaAIGF1NsYkJVhxYsMfhb32FqrhLoOoRi/Dt+oKpEdKItVENteqycSFT2pJQT0W9HYLM/4957n7K/UkSKPsSMyUHE7Vm4WuKHmNdh9gv+nPF7rUl96DQkb/M7hJRqmAR54D1L3zIHymhbBeCR8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716066348; c=relaxed/simple;
	bh=jQLfztyfF8cnqmKfkHbL4AFfJrFQ1JIWCZyab6FwWGo=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TEGwXZ8wlrc8qohPxew4wE3GZNeQKd+hPMA8TL9tgpLpOneO4pDVNyvzWnykpgtkMRjKUieEOQVMe6myBKDKwzEbESA6tp++UWiSYem6+PKX+ukB8FSuIag+rrP/lHMoJB3UXIouStd8ixsg4B/SX6q6PUCnQFNmPXp4FEiZnSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3Bz9DKY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67B03C113CC;
	Sat, 18 May 2024 21:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716066348;
	bh=jQLfztyfF8cnqmKfkHbL4AFfJrFQ1JIWCZyab6FwWGo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=s3Bz9DKYhWdQM89MT1wZCQApfJUGWpo9iNSideDbWtJ+tzj1zzVsTyXG/fYa7FBF3
	 YO62nmXoimEovZHycK9aW5d5UJ4WiURv+3ZtC/A1FXk315IKPedTn6hEcCsM/8e5sW
	 XFakNahcHKlGr9pu5bU4rT9bi/lTiNVuvi/7fTXVkcDwmJ/8r1WntRexqzMm5Yt6Yb
	 8OKpv3P4ekLMUjBRM+A2/GTCBxZmIP7/0A8d2GsKHJAAuPx+oWeFy36KxIrppp6TzN
	 0V13/U7DDloldptE5hzWtiBYyWTzcgKLBPUWUichf4MN1Ak8drmKghjWSPs09spY5p
	 uTFhNKPgqJ8AA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56E36C43336;
	Sat, 18 May 2024 21:05:48 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQ6HRC42sL7TT05k6Y8N4jFcxfz5JY4EYAGLeP2sNGgRg@mail.gmail.com>
References: <CAK7LNAQ6HRC42sL7TT05k6Y8N4jFcxfz5JY4EYAGLeP2sNGgRg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQ6HRC42sL7TT05k6Y8N4jFcxfz5JY4EYAGLeP2sNGgRg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.10
X-PR-Tracked-Commit-Id: 6ffe4fdf8901dc0a15d7278531503ecd4522ae15
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff9a79307f89563da6d841da8b7cc4a0afceb0e2
Message-Id: <171606634834.2260.8505219137566092333.pr-tracker-bot@kernel.org>
Date: Sat, 18 May 2024 21:05:48 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 17 May 2024 22:52:45 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff9a79307f89563da6d841da8b7cc4a0afceb0e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

