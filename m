Return-Path: <linux-kbuild+bounces-13684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8n1wL7ulKGpRHAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13684-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:46:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E6F664D74
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:46:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Xrw3TOTp;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13684-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13684-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEF783045DFA
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 23:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7853A2E7386;
	Tue,  9 Jun 2026 23:46:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3640D573
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 23:45:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781048760; cv=none; b=VzhCBzKjdn6VMZXBrALJQ0aoITG4rOSsqRw92gZ0d4Ka7cVgEAaPxj2xc72NDc4egK+k5S9Otrltag8UNUop34lcnxRJx/XoVtCRwfP3GHQCU/q9NLHM2077OECkJBRUv15S5zqLAIduKZqtQSxmclNq3ulDrg/sQKHSCdwz/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781048760; c=relaxed/simple;
	bh=oF1RjhrSJ4R7DYmQphBsOCymelSqvxKUeXvnyp3hE7Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BQiQYl9XKBhzibeVSX3apjXRKoVaQAEDyWjia+SnaI3ZTXJ+6IkxAewwujMAslv6UIsKHdqAR13471D46ltBuOlBk2REhugsbv3i0uijINLUaQovizxwl9Uef5eW1epiGZdyrGeUlvlT78qM3PkINe/BUMYZ3w2s5tpklschBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xrw3TOTp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8FD1F00893;
	Tue,  9 Jun 2026 23:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781048759;
	bh=okrdmXcbvbNBrQXbTDGEV98CkjzCpkP3tYJDsc4eTOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xrw3TOTp0vQ8OqSICV1jwfUNv0H6mHXrWyqvhva+jLrKZXzT8j+vIYKGzZdrsRN2/
	 Gj+TCakZphAinuqjQzPGQ3aBcvUcJYICoIXBHdFnuL2xB7M2WlAMmbhdse/Wh2n5Ve
	 fhDS5x4j13OvNTF8wm36pDx724BsuBWpoNWZ4kT9fzvA+Kj9rb3qNrMOi7ntOxg3yQ
	 U3iLNcxgGhPUHItOAnYrXdaUMW8++Nv8FSad02B8uMVEmPDb3B8h/sNsEUyCRskGM0
	 WI73By+K5ACuk1PNI5uid4vyDJD8evE15wNKlueCAdNnjIwWXGyn1T5zXMCGJ85ni2
	 /j8+zygD/n6kg==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Yafang Shao <laoar.shao@gmail.com>
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20260526062732.84006-1-laoar.shao@gmail.com>
References: <20260526062732.84006-1-laoar.shao@gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: append %{?dist} macro to Release tag
Message-Id: <178104872566.2707941.4360276121925795793.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:45:25 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=721; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oF1RjhrSJ4R7DYmQphBsOCymelSqvxKUeXvnyp3hE7Y=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkaS7eee1bor/HiYOypbSfe/cl1t499vuHk+9ilxwIyk
 m645gW87ihlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATufWckeGuy73X4hMl/s5S
 8HyffqNVYfPZwzdtnghf/vvG1LYsp7iE4X95fwaX/NUNtu18e3TSVnQxSH//LnItyV36SWZJU+f
 mYh4A
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
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:laoar.shao@gmail.com,m:linux-kbuild@vger.kernel.org,m:laoarshao@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13684-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31E6F664D74

On Tue, 26 May 2026 14:27:32 +0800, Yafang Shao wrote:
> kbuild: rpm-pkg: append %{?dist} macro to Release tag

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: rpm-pkg: append %{?dist} macro to Release tag
      https://git.kernel.org/kbuild/c/159921d63da16

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



