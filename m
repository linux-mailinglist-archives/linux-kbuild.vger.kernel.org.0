Return-Path: <linux-kbuild+bounces-12784-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id d6kkCIRv3mmDEQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12784-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 18:47:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC193FCB36
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 18:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FCD5301BE9F
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 16:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BB63ECBD1;
	Tue, 14 Apr 2026 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3XzHspl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A701E9B3D;
	Tue, 14 Apr 2026 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185217; cv=none; b=pdAgQP00W7aV2qmbGWK04+Z3zCePLB0FWteitwDEtyuNNCrCP6sP9uLEXvje4/U6KXmcZ7SqZf1e7YwQx71bh6bxOTztWyW+5nJib09n7JlHwarLVEWadKzMz9mstKVVrOolEB+7Dc5hQb3aNxQZQDDApn/Vy0x+z8IblB77Xws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185217; c=relaxed/simple;
	bh=h5CUHLLZGJj1sqfzAOFN24P+lZAUpLgJCzAIP3pIVak=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=TJhsYDc1LuI96g4Pv3IOMy2YMu/9qwD8xm320Qnk2hMx8UnP6vfyf2YR/hM3ZdNmrz1Nlh7jOycQQlUkIhy2E+9K1x5Od9YMZZYmXTjzi1bL3JRY4Gf+atjw9jAACsb6aA1uIjN0YeK/JJyXPY+rk6Xt/2OPo9OoxKAYH41xD6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3XzHspl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B62CC19425;
	Tue, 14 Apr 2026 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776185217;
	bh=h5CUHLLZGJj1sqfzAOFN24P+lZAUpLgJCzAIP3pIVak=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=M3XzHspleh86r3vzAE6YUI8iX7fuNondhwJgpVrbrS0Op2mj2wIUHrH6fREXFKsIG
	 pem7Y2vx+7Y7xwcrJ53ciAxItrD22RLU7qrf8Hp2j1xmoJc8hIvngurUvXyS+qkBub
	 09nlGhcwM6sBuxJtfeY0yNha/v0y2nM1OpuMFM/Zr94Pf2tTnISy5Y3xt0Ci2EKXuG
	 vKqkWXd08DrAsFfVL/8q1rNyTPsVxR/M6KO84zqoDqRYb4tOiaVJZBICeda8HWuSed
	 ECCuMdETCSR6E3e0oPEVWgRNlqQU9u7DIt6JDR+Yv+2AaB+z66VFmF1bo5P7C02lT1
	 Sx30d41kHGYgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1313809A07;
	Tue, 14 Apr 2026 16:46:28 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild and Kconfig changes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <adu-ZyIv47FnsVLI@levanger>
References: <adu-ZyIv47FnsVLI@levanger>
X-PR-Tracked-List-Id: <linux-s390.vger.kernel.org>
X-PR-Tracked-Message-Id: <adu-ZyIv47FnsVLI@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.1-1
X-PR-Tracked-Commit-Id: 404927758daac5ec4594071e033c1fa6ee9ca9b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d0d3623303775d750e122a2542d1a26c8573d38
Message-Id: <177618518744.1376142.6209842916194520385.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 16:46:27 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alexander Coffin <alex@cyberialabs.net>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, David Howells <dhowells@redhat.com>, Dodji Seketeli <dodji@seketeli.org>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, John Moon <john@jmoon.dev>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, Song Liu <song@kernel.org>, Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Yonghong Song <yonghong.song@linux.dev>, kernel-team@fb.com, linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel
 .org, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, loongarch@lists.linux.dev
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,cyberialabs.net,kernel.org,arndb.de,google.com,redhat.com,seketeli.org,zytor.com,gmx.de,jmoon.dev,lwn.net,gmail.com,linuxfoundation.org,weissschuh.net,linux.dev,fb.com,lists.infradead.org,vger.kernel.org,vger.kernel,lists.ozlabs.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12784-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ABC193FCB36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pull request you sent on Sun, 12 Apr 2026 17:46:47 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d0d3623303775d750e122a2542d1a26c8573d38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

