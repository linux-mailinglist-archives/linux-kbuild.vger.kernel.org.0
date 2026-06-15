Return-Path: <linux-kbuild+bounces-13751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lWyqFGd1L2o+AwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13751-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jun 2026 05:45:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B695683135
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jun 2026 05:45:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=efDeQr8y;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13751-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13751-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A2343011F2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jun 2026 03:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89EF28D8D0;
	Mon, 15 Jun 2026 03:45:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C164D296BBA;
	Mon, 15 Jun 2026 03:45:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781495106; cv=none; b=MfRbVomdDXJ1aR8fw11BCtlAIPk2q2lf5lErjGoI4xg7rBeGqNFkgWgavtup/3brA5uzWtu2y4KkRQW6BQS0lNThecXbkRShU4F/zL98y4gbxBFjGIk82eIB0O83SKvua3muxtwt6TCIZEEc/yvcgU81N8OP5mSjw29I/ykWS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781495106; c=relaxed/simple;
	bh=nluWJjpq2xf1WZcpK8PIJL4setrzirRoFQnn+Tdmqmg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=odgPXty7Ne2N4mS1sBYq2V9F5ECw3JSd0WRpVJl+EctIG14vqtamcxnYjOZvEHv1T1O/ST57PQiphyI5FtBSd3NN9EL3mjHc7Oh8vwxUz7KvCQZWDcJ941u+VZwyT8UXTD9n9lccuHbFM+v4zA5siub1OgqHj1IrQoR5txu0Lr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efDeQr8y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A77E71F000E9;
	Mon, 15 Jun 2026 03:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781495105;
	bh=D84xD2dDaLcxksKXrxjRyeze7C7pPTzI8aYyBngxF8U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=efDeQr8yebzKMV4xeYFGHz3rlr/FwCBn/30FyzFaOlpkt2zT96mnXmFf8DYRnQT24
	 8wd90oWgTn/IstFD31A7qakVL50mryozgASC8vXgjqT/vs6SZMBdG+R8kdwcasnUnm
	 rpvCUz4Gx1IJZidb0gx2VUe7tt+g+1N7U19ANcmLHyQXg3GSqTUZuKs2z8lG04bXmY
	 mm8sbU7Ww1Q/KKhgCl5uKqEH9ep2qH7p+fQSC0CtWmuRF1M1ZLcW8aDA0l6iaKMQ+J
	 S8yMd3FoazZyzMqa6bzbsw7rZIpVWiuMUV5NCXZj4gKNRn9cCDqDieK542cBplCMYg
	 /YHx/hLh2M/CQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569D83A566D6;
	Mon, 15 Jun 2026 03:45:02 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild / Kconfig updates for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260610235818.GA873456@ax162>
References: <20260610235818.GA873456@ax162>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260610235818.GA873456@ax162>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.2-1
X-PR-Tracked-Commit-Id: 1a1e62a5a48494cdf33e3bfb82fb8f408da7c4cc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 73f399414a84d715bb1794182aaea852b11d0962
Message-Id: <178149510097.2410512.13591390033523058488.pr-tracker-bot@kernel.org>
Date: Mon, 15 Jun 2026 03:45:00 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13751-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B695683135

The pull request you sent on Wed, 10 Jun 2026 16:58:18 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/73f399414a84d715bb1794182aaea852b11d0962

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

