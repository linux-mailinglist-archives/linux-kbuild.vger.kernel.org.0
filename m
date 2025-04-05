Return-Path: <linux-kbuild+bounces-6448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A77A7CC2B
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 00:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC4143B0C63
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Apr 2025 22:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509051DD88B;
	Sat,  5 Apr 2025 22:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7UePR2v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277571DC996;
	Sat,  5 Apr 2025 22:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743893385; cv=none; b=Z3n0ekCA0dP5v3MljSEpcBQPeZXRPpiQNh2kTNKqo3Pav7y++61ubD9ypoIGfs39ZR6/WWRoKM+npCCE6nwlEUM5H1GRzE5wogIJJF4L3Z8Uj5B2FFFmcrJ7opUm9xgdDJKmEL/4H3YUV720b8oCIpZrZkJ9e/RfwzczAr7hW70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743893385; c=relaxed/simple;
	bh=Y0HgV8TgWCzCkwSe3/ohxB4SRAMb+PsDRGEHFBBuLh8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Izp/jKRU+tsWvu+9DQN5TpNTqMsBh2xC2TxmAzf5EWhF6FZBUOtOWzOLd1cGhyLdx73n9l0WBwIV0SN/uk6zrNA/XF9rADtV7aMDj0TXqbYDsb1PqJop12VVFR2ZP7bOdO5/ThzzwXbjxR7sXhrRLcrq7Ep9VIRr8SXbyHKsCnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7UePR2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3DEC4CEE4;
	Sat,  5 Apr 2025 22:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743893385;
	bh=Y0HgV8TgWCzCkwSe3/ohxB4SRAMb+PsDRGEHFBBuLh8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=P7UePR2vY2jIk6npgu7euvjJDAp08jJkphADBWya7ExD4y1IwbOBfAfQ7Gz6SNklb
	 zgXyJ7MHUqTWT+aRiUh1TTxjOqQ7UJhnrJh8CPKfRvRCqEnR2IR0LSnyF66YRH35iJ
	 MdzloNYgWTecIdAJSi3gAvv1BAoy3mPLm7u4PR0R/09E6COJ4vnuUN16P+QFeWtq/Q
	 yIA7736QCKP0C+b4DHJ6iFYeq8kI+KMLu62aPeruEgJaQSAEAlT+ZCUe73lMVnyC/w
	 QVjkZ1osOvBSjfkYuCMZGpC8YWfeSaw3ikmDBz4AVAAWnlA3nPlpo4fOA8B8GPTo2x
	 8xHsBChw1Ig9w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71214380CEE3;
	Sat,  5 Apr 2025 22:50:23 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
References: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.15
X-PR-Tracked-Commit-Id: a7c699d090a1f3795c3271c2b399230e182db06e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4d2ef48250ad057e4f00087967b5ff366da9f39
Message-Id: <174389342201.3728862.7501817550844218829.pr-tracker-bot@kernel.org>
Date: Sat, 05 Apr 2025 22:50:22 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 6 Apr 2025 07:04:27 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4d2ef48250ad057e4f00087967b5ff366da9f39

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

