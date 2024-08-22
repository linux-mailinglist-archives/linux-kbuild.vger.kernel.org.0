Return-Path: <linux-kbuild+bounces-3165-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6DE95C1A0
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 01:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B1DBB21443
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 23:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A11187357;
	Thu, 22 Aug 2024 23:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKzJEKvt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0CC183CC8;
	Thu, 22 Aug 2024 23:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724370748; cv=none; b=Enipyo+SmD3rfP0DaPVY2Y64VUVtZg85R8JXTjr+lDOzk/NrS8/UvLyjNuYfCOwdsXwl2kWfl0sVGjy1TpxKU5HEwKdVDRXwb+HyPONDmfSjKpcNPF0kYPJSGRBacq7cZtgro8pKohan8kSnBiKz4j0fGYI6Piwl2ARBat8gTTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724370748; c=relaxed/simple;
	bh=LNieKC6xgbaFVwLkeUUk3p0kVjmPpzy0yw9beXEAKo0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JlWttkxyFuGuOYY5KELK9pIclHo4wBYEK+hQkaMepUT9Vs9Oa7pVmuvPXN9PILocvezdYjDsLQ8ztThD6OokTwbgkrM+K8MJdFHBXsIn8czJvn4RN6QMbLPj4bwjrqknQ8jTvy+C7xdXEl21DgD8G+feJHcUMbpS8C3EjIPsetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKzJEKvt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F057C32782;
	Thu, 22 Aug 2024 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724370748;
	bh=LNieKC6xgbaFVwLkeUUk3p0kVjmPpzy0yw9beXEAKo0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=KKzJEKvt14BwEk1KSNIrOQ9TGM9cJy3KwKX4BLmEOS1Kb2MWwGUXqpLMuYZ3ijvlD
	 ydBvo7DuXhTpgNBh0WW1A+Ms7sg36buIV61z8nQOHAPQ0DTgn08Nx3ecU2Pi7o1YQQ
	 BfBDd8tEOuLIyj2GZ+/RxE3jrbZzxhzO/ACsNs301TWKffpKQMJvdbFg2oImAxiTzn
	 95iMd2Yr3KDGPu4ajpZRqwyqw6pmMuk5DNfZ/mD/zOOIGB4gbR5JsMOhuuiGG6Zcmd
	 AohDIFZuhn+lnUaUO8qZdH5SilvBI8uUg+w64a8uvDxyq/UdbwfnOy8zE7I5aZXrOU
	 j8gZqRNRg8q1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E2C3809A81;
	Thu, 22 Aug 2024 23:52:29 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.11-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNAQX2tTZNnUD519Y1Kx5YxtnHy8WHPUB+L9K7ji_8nT89Q@mail.gmail.com>
References: <CAK7LNAQX2tTZNnUD519Y1Kx5YxtnHy8WHPUB+L9K7ji_8nT89Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNAQX2tTZNnUD519Y1Kx5YxtnHy8WHPUB+L9K7ji_8nT89Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.11-2
X-PR-Tracked-Commit-Id: 8fb4ac1cee88a57e7a56faba49b408a41a4af4db
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f44ae972ae5cf6a75eb40314a6a81bd694d0f53
Message-Id: <172437074794.2507685.16231677961145337450.pr-tracker-bot@kernel.org>
Date: Thu, 22 Aug 2024 23:52:27 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 23 Aug 2024 03:16:08 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f44ae972ae5cf6a75eb40314a6a81bd694d0f53

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

