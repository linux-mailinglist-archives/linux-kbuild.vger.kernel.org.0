Return-Path: <linux-kbuild+bounces-13602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9DtkDxEWI2rKhwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13602-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 20:31:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 258C364AA2D
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 20:31:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PfTDqO5c;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13602-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13602-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 17E093007B2E
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 18:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11148364943;
	Fri,  5 Jun 2026 18:20:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BBF30BBB6;
	Fri,  5 Jun 2026 18:20:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683648; cv=none; b=OFKqTK2faNvsGWbgwyrUYZ7p6sz1MGYdv63tuyZit24Duq3NmDLmnROBeRMwMkB5aKB1rDcUV8O6mygqhieX/+MlJ4NUAgJ8L/3pdXlB4y3I1OV0O0Lz3r7BqBnm9QodEiFXhQYaTCq5VNNVeiCwn+fEieC/agXf/WT+U22CyuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683648; c=relaxed/simple;
	bh=mZ3fTA4iI4vWT2dtk2vCxFzWoW6f7mATzi20qOyNJd8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uwipLINmzjzr8/qyuCWuw5J8k6py1fa6T/TS9BqMb6IGXIuK6885L9i4rm80NjTLrE/8exdoCKFrzhnvALvdDNv5yybUvNXyah2qYfGyxB9TyaSWWg4bjI74kIbFRt8IJc1EesCtrqEUIv/ydh1n7Dh9MYw6ejZQA3M2rhLp0VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfTDqO5c; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C584F1F00898;
	Fri,  5 Jun 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780683646;
	bh=NHnk9A1yfW3eDwkIsjx32vubqNfD+idAZp9HhZfrS1Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=PfTDqO5cQspgXbu/3v8YFUvIEl6p4x0QRQTpDipms1j1vYlW4xIcubOxcgLd/L4+W
	 y6+tRXoHW/VfrO9xKUbA2YsXMGcBePQXcT/M2ilwTbO8oauwmDT6pzdd3rMp2OXnIy
	 fW0eYBtqDi3aPZ2wk5zUyyGeUn+vghoWVzL/E17qzpdfYMUJZgRHj9iYwg9uW/8OK9
	 E4uDyqNV4TmCo51DQXZQS6fC++BqqblkEAQPKlhxYNPaeUnSUYehTE2UpopZXOPMcf
	 J4w3fHRsL9wKF6Ck/1JjBQh/Nq4oSJbFijz2a9yFlGZSLuGjZqVXQjolb4xghOXjKQ
	 Pd2wcbKeqZiqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569943930BB0;
	Fri,  5 Jun 2026 18:20:48 +0000 (UTC)
Subject: Re: [GIT PULL] Kbuild fixes for 7.1 #3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aiMJm3Fcph8hwlul@levanger>
References: <aiMJm3Fcph8hwlul@levanger>
X-PR-Tracked-List-Id: <linux-kbuild.vger.kernel.org>
X-PR-Tracked-Message-Id: <aiMJm3Fcph8hwlul@levanger>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-3
X-PR-Tracked-Commit-Id: 65b09bfa8aa7ebe087093b591525385efb2d58b0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06121e12c27aef6e1a09b4cdec809b9c91f6eb59
Message-Id: <178068364707.3872199.15625876309594355666.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jun 2026 18:20:47 +0000
To: Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, Zhou Yuhang <zhouyuhang1010@163.com>, Zhou Yuhang <zhouyuhang@kylinos.cn>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,163.com,kylinos.cn,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13602-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:nathan@kernel.org,m:zhouyuhang1010@163.com,m:zhouyuhang@kylinos.cn,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 258C364AA2D

The pull request you sent on Fri, 5 Jun 2026 19:38:35 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-7.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06121e12c27aef6e1a09b4cdec809b9c91f6eb59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

