Return-Path: <linux-kbuild+bounces-2634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C61993A8C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2024 23:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45F111F2326B
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2024 21:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC88145358;
	Tue, 23 Jul 2024 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKu26EG3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE5144D36;
	Tue, 23 Jul 2024 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721770859; cv=none; b=kIlYjz+8PCJSe1xH5d/AM1wNDbkwBCr+t0ydb80RcdS16+OcmWd1dC9Q86Pct2t8bOhRQgc35ND/J7yuHGY7aITx2Gt78Ej6PZ7Jj6EG71xeDHN4Xz3aYegHfDFA4y1Jas8fL0b2qObycLlPtwsLZ2aFsktyQH/L15FLZrK3OB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721770859; c=relaxed/simple;
	bh=MwpfngelrPqIrr5o44qDja0781lUjqrOC2N/NCVuJ+c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=m/CIcCfqc+OhAukGNCRJBQe6SOqQb8yu+PB56FekfviqU+ZAY8yid+s3pPqO+n/aHnjOdsTKLXjo7ASlvC0vGXQTKy60GgWlsIajpcqpVEazohx9hgeZJUdtQfsC5wtzWHVVayGCIUDYtbY6PH3ZVIfW4Lj4kazPyL13rfgkknE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKu26EG3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCF7BC4AF0A;
	Tue, 23 Jul 2024 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721770858;
	bh=MwpfngelrPqIrr5o44qDja0781lUjqrOC2N/NCVuJ+c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aKu26EG3wYL0CkryZc86QsN3r34WKwK/lkO5ACXYG9c/dpftCQQT0EFsmZtxGST7a
	 kStZoIRgUHM44WrL/NgusneZT6TT+3WiYlu6qbg+6kjcjKEtXoyBeoVkN4bprCui2g
	 Nyu8zdp4E7slFE7q/HpfojddO5VZqyDRk3qRxf9KXAC64F1jcrXXtyVmLowWcFUHwK
	 9DpuUn9hgtnDPkLGhtHHoULyoujc2Gvdh6mXJauAkYrEG+G4XYpTPXSRpEW5q/FRjp
	 xl9B3Q48eR7dkxumR8KpkvS9c+AKoIg+2CBIifSFp3aYRdF60S/hzYRplXaGTiUbDg
	 NeyDQVbDOfS9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD2F6C4332C;
	Tue, 23 Jul 2024 21:40:58 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild updates for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
References: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.11
X-PR-Tracked-Commit-Id: 13c239a2c088e91e453d26517b562c9a116444fa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca83c61cb3db964061ea186654bf8e1879589de3
Message-Id: <172177085876.5521.3206919534477605484.pr-tracker-bot@kernel.org>
Date: Tue, 23 Jul 2024 21:40:58 +0000
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 24 Jul 2024 04:44:06 +0900:

> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git tags/kbuild-v6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca83c61cb3db964061ea186654bf8e1879589de3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

