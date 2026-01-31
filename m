Return-Path: <linux-kbuild+bounces-10962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PUYGLVvfmnEYwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10962-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 22:10:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BD2C3F29
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 22:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3944A3003839
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 21:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15540376BDD;
	Sat, 31 Jan 2026 21:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRzQMAbt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E614A239E79;
	Sat, 31 Jan 2026 21:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769893811; cv=none; b=lOvo6cjR38ghowOgOhQF5drhXq0Nff8NftMjSfRRL0ye0Qt+PQnUw1c6N6u85bAatilsytzAIJVpCpvfcCkvGyKmoH0JKhB39djM9J8O2GHiYMDBY0KkNeJ2UbvFg6S8NjXsYDMmlBAgwB8cZ6ceIlh1/NCkQn1wCvgqixnZvH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769893811; c=relaxed/simple;
	bh=+lLZJXKTfQQtShpaVjD/fphPzq1Q5whZ+fpAb7KoC0o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=UicpkQUkidxgDnI0RVeh8WIjpUojV4Jq6A1mTmfr6m0dWdYYDgY6XgOmlWn4dypnEobJtJvbV2yp4rdZ4JNcfF1uv9cd1cmns9w+YDtVsyAqLc7RCy1M5PsEs2xTvlGfneZBbks0nB/3lZuXM9PD4gNEvTUW2e8mN504RCTlUvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRzQMAbt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC93C4CEF1;
	Sat, 31 Jan 2026 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769893810;
	bh=+lLZJXKTfQQtShpaVjD/fphPzq1Q5whZ+fpAb7KoC0o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tRzQMAbtQlSWD6DwGj5JU1VeGbwf4+oNFg96NsROfFiUOVyPu7Aej7SwFngPxDux5
	 S9XgNYmfOKXYL7uqpqyhfyL6by6LWLQ1iQmivpui6SUkTda3Eule6W2sxo0KpmtfOI
	 10ddrmqI/XccRNExWiTrOeTZwHdarrkiK3oooKQ7LB+MN/IImudxQQlVThSAsYZheo
	 ipuxEYu9S5YSH+45hCU8CYtnba2HmRI3BUOGiyAmxaYOitJOZ+dNIewbDM6ybTi6p9
	 D2l3ZQomEnll9nYapaDIq+SUOF8Xg9aC+huplYIICuuBFAn8WOoJBxzvNxdLd5q6+l
	 ARjHi+kWmuXOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BCA7380DBD4;
	Sat, 31 Jan 2026 21:10:03 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for v6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <aX4fytimtNnXTzQG@levanger>
References: <aX4fytimtNnXTzQG@levanger>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aX4fytimtNnXTzQG@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-3
X-PR-Tracked-Commit-Id: 8e24994872361212531a952c93adb01c485148f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44f4119c7c6aac5f6d476b51a0bc62dcbfcaad12
Message-Id: <176989380206.4190632.10827669427649871313.pr-tracker-bot@kernel.org>
Date: Sat, 31 Jan 2026 21:10:02 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>, Ethan Zuo <yuxuan.zuo@outlook.com>, Holger Kiehl <Holger.Kiehl@dwd.de>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Rong Zhang <i@rong.moe>, Uday Shankar <ushankar@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
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
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,outlook.com,dwd.de,kernel.org,infradead.org,rong.moe,purestorage.com];
	TAGGED_FROM(0.00)[bounces-10962-lists,linux-kbuild=lfdr.de];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7BD2C3F29
X-Rspamd-Action: no action

The pull request you sent on Sat, 31 Jan 2026 16:29:14 +0100:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44f4119c7c6aac5f6d476b51a0bc62dcbfcaad12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

