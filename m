Return-Path: <linux-kbuild+bounces-11337-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK/rIc5PlmnddgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11337-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Feb 2026 00:48:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71115B046
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Feb 2026 00:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE31B3019155
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 23:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBD12FE566;
	Wed, 18 Feb 2026 23:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbqdXnLE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABD82FBDFF;
	Wed, 18 Feb 2026 23:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771458507; cv=none; b=pkiAMBGo4Mt3cwri/hkxmGueQ6lH27cfnUt1BtzCOlfXnswatEUEr2URE7qQ4c9zIv8hmuVUVeNyu7U491vkRusvVDpLwBUGEnuuoGqaqREdi7YlU6ic2xUqYFLYlu3GDIeb2kU3YvHwUBKhjg34X+ONH9xOYM/f7MZG0X6WjNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771458507; c=relaxed/simple;
	bh=71wrSvNyFOAA9cQO8PUU3hvhbVRwWxMz/tkJyV5o5z0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AV4y2FRebKJ3GycsHYrXJvhYLoAgOFLDKWTgFQlVPz7evlaKtP2OEZJ8llF93n4BcpSMJSx21pa9gqs0kB7AQ177ZqNIUG1gsCysdYH9yYhv80p5wyULvx64+qw9TfpFKiRreEHyJ3Pkg1hWsZo2pe3zeM66gKN/9y7rNVI/XbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbqdXnLE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3D0C116D0;
	Wed, 18 Feb 2026 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771458507;
	bh=71wrSvNyFOAA9cQO8PUU3hvhbVRwWxMz/tkJyV5o5z0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qbqdXnLEhHj6J2rgah3Di03F34ogXiT9IrVAPWQzDPaHLID9dfSi+dc1rEiSP1pHq
	 nAfm5k67hU1u0j5i0pzFSUjQzBCZxlNZG4ItmTsDnADCmwGHoH4M8dEmBiegUAip+e
	 DZvdHf5xXRpjH7sJFsuvOFTXNKUrehjXa0UyxlpSJDCli666ohXv15/11agrIsT9iu
	 P2BSTPqyzcmXjYRx6P9VFSLD1OJ+5TqlhCJ4/bL4QBnMyeVcZ2jR/7x3nsDXsfJNRC
	 MaqGq+cpHGe/Sq8tX+MIOnUyqJZoRzaALEIZsz1trZ4ZaRg9b1w91rVf1S8AFJkERq
	 j9FQpVqQ2n4Jg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C2370380CEE0;
	Wed, 18 Feb 2026 23:48:19 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.0 #1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260218210423.GA3232039@ax162>
References: <20260218210423.GA3232039@ax162>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260218210423.GA3232039@ax162>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-1
X-PR-Tracked-Commit-Id: f94711255a73d8938cf3bb405a0af3a4d2700ed1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 956b9cbd7f156c8672dac94a00de3c6a0939c692
Message-Id: <177145849828.1601142.12764787322447633868.pr-tracker-bot@kernel.org>
Date: Wed, 18 Feb 2026 23:48:18 +0000
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11337-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org]
X-Rspamd-Queue-Id: 0F71115B046
X-Rspamd-Action: no action

The pull request you sent on Wed, 18 Feb 2026 14:04:23 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.0-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/956b9cbd7f156c8672dac94a00de3c6a0939c692

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

