Return-Path: <linux-kbuild+bounces-4497-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B54B39BA770
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 19:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77D72281141
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 18:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3649D1411E0;
	Sun,  3 Nov 2024 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1SssiLf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F27929A0;
	Sun,  3 Nov 2024 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730658916; cv=none; b=eOFsLvcpdIl1OVh8bZgeqtNh4N7SL4Vr4PsGSVmhxIs22RRE4IxpsEEqkeiS9mP7pFBXDUaySB1YQL5IHx/pSqNsyOZuQL9Z7mNsFQfwj/rn1Iotekv48uFV0YZGwnLqtEZxXXNiIVbIUGsDOr6HVuIr+5u4CcGcShQSO0iAJH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730658916; c=relaxed/simple;
	bh=05jwQj7CUbuGCUMs71/1J9QO3eJLdQeimhzsGmpaS3M=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kgqLBX+WhrdOxh/x9RXYJXuY72pIliLCbOk6lGnkHTu7qzZKZkew3fJoCK0wawFddBGQ+q4l83vXwSoa4yJEpd9Qecve4ZDTonC0h/jy8cJYyHnSxevtvC6dbsxlfRWnrv+OSUD+RoCLYvnEru1DEJ6IB70h+X4kI3yVkQ3DxRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1SssiLf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6C4C4CECD;
	Sun,  3 Nov 2024 18:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730658915;
	bh=05jwQj7CUbuGCUMs71/1J9QO3eJLdQeimhzsGmpaS3M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=N1SssiLf2bcj/LL17g7nlBP/vfoQ1/LesnvKiKtgdigOTKMEHOvHa/VuVAwTQQ0Uw
	 txiiGCjA4+0vdOGxjZCMxA8eHp4ftokiR2F0Cu4VoS99fzdWjj9QpI5RQOkmRCh0rH
	 dj8zrgBuul3ocECoZ7OPbUJo8JoQNwU8amQXa2NCNHB8NIZlSWlIT3HGOt3RlFgbvy
	 Bc1Ypipn/R26kj8zt1ihHvbR04ZGqHvK1RL3jGm/meBOxtChwgXjPigK2rpsU7Hy/J
	 wmYuBU32o2w5mqeV/+rHLQlU5sgIs0+PtlxxJTJ98nw1wA8haRFoUgPcULLMBDQQhv
	 jZWADmHljtMFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FE138363C3;
	Sun,  3 Nov 2024 18:35:25 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.12-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNARe1AnzxumbfOD7y2CpRXSa59RvsEDTw5YAjCTim9-5GQ@mail.gmail.com>
References: <CAK7LNARe1AnzxumbfOD7y2CpRXSa59RvsEDTw5YAjCTim9-5GQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNARe1AnzxumbfOD7y2CpRXSa59RvsEDTw5YAjCTim9-5GQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.12-2
X-PR-Tracked-Commit-Id: 77dc55a978e69625f9718460012e5ef0172dc4de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a33ab3f94f510b5bc6b74b2d1e9bc585391c2861
Message-Id: <173065892375.3228425.9747194733183108580.pr-tracker-bot@kernel.org>
Date: Sun, 03 Nov 2024 18:35:23 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 4 Nov 2024 00:49:28 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.12-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a33ab3f94f510b5bc6b74b2d1e9bc585391c2861

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

