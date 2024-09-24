Return-Path: <linux-kbuild+bounces-3705-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C28CD984C1E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 22:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7851F1F2490F
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 20:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AA513AD05;
	Tue, 24 Sep 2024 20:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKJ1Tdfq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8B182488;
	Tue, 24 Sep 2024 20:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209288; cv=none; b=PpEhDAottXlhIibQr+YljFArwBlIlKBWdzL4Su+wvHRroQyfQ+z4EPZf2uPNgX3tCwi0nZLJUG6PMABTuOUBV4VxQU22qUE7JT3h5x/ZxW3t1KrAYOPNxAP4ZKWx7CUwQFjGGQb2sW0DO/jHyqG/MgCnDcutEoXGXQsZuctB4Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209288; c=relaxed/simple;
	bh=1L8sUNtgNOK7T1Q1e0Kj4EcVybnJ6SIUcwKPJ/VUnAE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=auLhFCGYRvxrm3wyskOWmxdHTpB5W8du4dMR+JpQNsmt1GW6EPvF6M3fY7ND9O2oK+Uyw3nGZyYyOIBIcRSNWGfJ4lwdXY9xDL9Uyb08hLiVT6vL2+sy5BroIXA1/SkcwmZiy5SWFJY75OllK0Z477J4vPa8tRpF8kY5hDCn8vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKJ1Tdfq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F747C4CEC4;
	Tue, 24 Sep 2024 20:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727209288;
	bh=1L8sUNtgNOK7T1Q1e0Kj4EcVybnJ6SIUcwKPJ/VUnAE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IKJ1TdfqV4pnP+REzExxtm+wfVkT1daKYfQrQeR2BeGKPPeYWJyzeDaXdpTsszkzf
	 PnNkVs91eNKa1QUgb/Y7Y7zvnpHKQdAGVSuTlik389zVWOT9jSiZ+FSaAA3LZVSoaE
	 wStbqzQJs1D6ijJFY5PysTfKjVxZy+4w2rVqRHpmizAVr2Lkx4vOC/5FId7hbKZqPy
	 tZejO5eO9Ys3nTr6ysYDk/7an53egRmM6/Fx8cJ6mEBwHVmY57osTFunBYxZ/epoQ+
	 O+zp7rN0OVQOR59HjwijhCuGYB6ZuHvX/8RYFYu3cn+NDT5NOVRIs2Z9TJGitko3FS
	 2VtZIPBhPRs+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2623806656;
	Tue, 24 Sep 2024 20:21:31 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAR=QwD=c1kN_VxQ-NoNoZqQWU3VPc+Xy88BDTjG8s_v8A@mail.gmail.com>
References: <CAK7LNAR=QwD=c1kN_VxQ-NoNoZqQWU3VPc+Xy88BDTjG8s_v8A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAR=QwD=c1kN_VxQ-NoNoZqQWU3VPc+Xy88BDTjG8s_v8A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.12
X-PR-Tracked-Commit-Id: fa911d1f377bbe4cc47e58afbd8fff7750b7ac62
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 68e5c7d4cefb66de3953a874e670ec8f1ce86a24
Message-Id: <172720929019.4186044.5884636763066616855.pr-tracker-bot@kernel.org>
Date: Tue, 24 Sep 2024 20:21:30 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 25 Sep 2024 00:44:52 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/68e5c7d4cefb66de3953a874e670ec8f1ce86a24

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

