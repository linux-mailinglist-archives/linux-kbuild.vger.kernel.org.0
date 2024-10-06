Return-Path: <linux-kbuild+bounces-3935-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECB1992094
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 21:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9EFD1F21777
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Oct 2024 19:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9C8189F56;
	Sun,  6 Oct 2024 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGVy2ieq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4C18991C;
	Sun,  6 Oct 2024 19:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728242032; cv=none; b=uYG6WvsjixjTZBtNgGVe03oKvGOjBzOV8xkljZ2orYV6DAY0XD2F6eVnojvehBMco2mRaWJI/SxeyGTh6JaF6qpVK0Od77WF6s+n+hWr1xXztdoDmvGGjIKYyHWTsH9X9CZaxPFYStxW5jSsLdYq84Pl5vyy1EkMZUBEruuK+6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728242032; c=relaxed/simple;
	bh=lLuddPwHrdfKRBge2NAHOlrXBZxWjhbrKXwNE8/eL6s=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=JoUjgPlNjLZRFEs7EKotX/4EXlrqNeigvaPcAvuKFAm6WpUpIOxF6tXTEqDX74Et4umo9BNO69Z07B7S0jfQvk03bRhhLctKaeq+MPNHII2yckvX/JB3I9xTupF6NpmQaF+9RWbuOouS9jzZalZZ2eLYFCti6ec6XFJimWLVLcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGVy2ieq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BC4C4CECD;
	Sun,  6 Oct 2024 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728242032;
	bh=lLuddPwHrdfKRBge2NAHOlrXBZxWjhbrKXwNE8/eL6s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aGVy2ieqrU3bgv6WdXs4LmmDLzzowcVbHEDzvF16QUBIW2YAzPxEXef4tdqrkEZAh
	 4yDnmysL08doYIalKIQphRxEqsuV1jihs5JpySLmpckYT+hWWZPbe+u3rsyu4hdXED
	 839cWEbmRAjKHlXLBPvybb8WOSk38HP555EMkzUlGyMs/qKyQT4aH+VENffeEVDUYS
	 jxew5N6tvwyII2Y3EuPIbpG1nF9Pt2DjcUc46kuAkI0wtlT+W7wBeUpYbLUyyiTv10
	 tgOqd9sTen0lKnxZjqizGEy+Xj0G1T/UpfRdZ84u3sGLeUz+lcpdMUi+iYAGrZ/rHN
	 MpNxXVkK7PsOw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E6F3806656;
	Sun,  6 Oct 2024 19:13:57 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.12-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATWKzHUxHofwZx9NvcR5hTvxyBSxJLW8GMsZNQgXUQcwA@mail.gmail.com>
References: <CAK7LNATWKzHUxHofwZx9NvcR5hTvxyBSxJLW8GMsZNQgXUQcwA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATWKzHUxHofwZx9NvcR5hTvxyBSxJLW8GMsZNQgXUQcwA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.12
X-PR-Tracked-Commit-Id: 82cb44308951ad4ce7a8500b9e025d27d7fb3526
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a130b7e1fcdd83633c4aa70998c314d7c38b476
Message-Id: <172824203581.3486601.4148870681854408704.pr-tracker-bot@kernel.org>
Date: Sun, 06 Oct 2024 19:13:55 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 7 Oct 2024 02:47:12 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-fixes-v6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a130b7e1fcdd83633c4aa70998c314d7c38b476

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

