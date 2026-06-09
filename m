Return-Path: <linux-kbuild+bounces-13685-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1kX3MCGmKGqBHAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13685-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:47:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B734664D7B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:47:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fDUI2Fgu;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13685-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13685-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97BF830830AD
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 23:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD00D34250E;
	Tue,  9 Jun 2026 23:47:41 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2692248F57;
	Tue,  9 Jun 2026 23:47:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781048861; cv=none; b=WEMzDdTyFAKfnXRbtESdqHzWu8UUN9pJAGWHtp35+mHmPNcvCuqNPWJxpyGCfmn3IjoWZLinPWX1LTwZcXxrkJsmRcKkpcHKbgVTVrsqlifqBbQXX4+KBTmR5nNC9i8To0+wDN+A/HThpLuL/EIrH0uaUH5thfs0zQvzc4N4ths=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781048861; c=relaxed/simple;
	bh=xyvZSfANfzwob45aEYEgsFp7Rm1LenbyUR14Tph2xlw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rpXG6x8lPzqkBELxYsNeNBhzA84JTGK31H9mA5yT3U03ITmqX8DXDTA1yijYkOnLJWPkIuRJJub+fBioPFNhSMceRwfzUwSIfgtEdFr5mNBJSkG+KmiF8OTOEoTSLTa21I502B+LLr8VslOTcgmAgczHs8yuhuYdqCn+vbsk5Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDUI2Fgu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944951F00893;
	Tue,  9 Jun 2026 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781048860;
	bh=qBkxIyUYviGYhbJDgZkW3tzAsMz1sZjwOrEzHE3Husk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fDUI2Fgug7VX+8/QSBJ9LFTQt1F8cmPWAgiHV2xUbUZAApOZZ56bbPPlyiFSC3umR
	 i0TCao7PufOOijoLO9RlkT+RB1dIou2//qaoCWZHJwQkGaBJ1G6hxjtrSFzI34Cwqi
	 k/y9/3rWoHoZe2aetGwYXw8tCuXSBZuhGip0P1wcSI5aN7KXevpEagP8b40w/DESfk
	 +5OB/7s+5+z0n+QvNhvF4PjysL023XLNojvY/qZNJwMVPTl7mQWDUyOCWbAltoM4Pe
	 dN+YVvr3IFNnTBnIS4svZHyX7E5iNdalMu8IzUsmoltGFAw8boxFWxnVLNfUq8ZSh1
	 T1p+0mrGM81wg==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andrew Jones <andrew.jones@linux.dev>
Cc: nsc@kernel.org, andriy.shevchenko@linux.intel.com, 
 rdunlap@infradead.org, julianbraha@gmail.com
In-Reply-To: <20260527142703.107110-1-andrew.jones@linux.dev>
References: <20260527142703.107110-1-andrew.jones@linux.dev>
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-Id: <178104876973.2707941.12816857648925597603.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:46:09 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=nathan@kernel.org;
 h=from:subject:message-id; bh=xyvZSfANfzwob45aEYEgsFp7Rm1LenbyUR14Tph2xlw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkay6SChaaGlTmaCqRsOLdkyZZt+Rx3b66R2r3phrG+Z
 ZZIW/q6jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRAx4M/9SnPDp+fsrL2Jf3
 Z1tL5jTuOlN2RlJXdfPbWx//lwv+6O1h+B/VzrF2UoJcDx+TFOPPExb6MlySc8UfyXglHBKeuGj
 PQj4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13685-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew.jones@linux.dev,m:nsc@kernel.org,m:andriy.shevchenko@linux.intel.com,m:rdunlap@infradead.org,m:julianbraha@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,infradead.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B734664D7B

On Wed, 27 May 2026 09:27:03 -0500, Andrew Jones wrote:
> kconfig: add kconfig-sym-check static checker

I took this in its current form since perfect is the enemy of good but I
think some of Nicolas's comments are certainly relevant, so please feel
free to set fixups on top of kbuild-next as you see fit.

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kconfig: add kconfig-sym-check static checker
      https://git.kernel.org/kbuild/c/f58316a441b46

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



