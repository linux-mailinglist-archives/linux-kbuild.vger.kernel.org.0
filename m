Return-Path: <linux-kbuild+bounces-13683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tRdzDEOlKGpCHAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13683-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:44:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40D664D64
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 01:44:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WWzSGPIy;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13683-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13683-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6525309E949
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 23:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3AF35B62C;
	Tue,  9 Jun 2026 23:42:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AF33DE43E;
	Tue,  9 Jun 2026 23:42:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781048569; cv=none; b=azyGcBH4vkGh2AxQFYAu4CJEaQnaTDX4JIWAzM2HP6B+ijWq6+rKbhkmSKGVxVv7pki3777aywktL0IAW4hClC1KkBAySQW98comb9l2i/CU+vYvGWV/sSz5CpHgjOeFKW83FJlCWvInNWsyZTNG2R5qfY6EH2agTb4dwGgL0M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781048569; c=relaxed/simple;
	bh=QkOukaD62/6729HeqHX3CRcThRH96lR0vkjEb3HWdu8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nxhQMkdTf4w6MQUOV/uLh+tbz79lWh+cz3fKYjDJqqwAWBgOMefkceEw4KfotzaToXZCRuzK9hCFmY67PNQJY72KoQvk0w+90hvW/4tk0fpZD1lMeRhO2E3P0ryaRfKEQAFHCghX1JnglaoShk7osTfSujJTwlSNjE+Vttw0PMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWzSGPIy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836501F00893;
	Tue,  9 Jun 2026 23:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781048568;
	bh=xubkKUavs48CwLWB6rIAtyrQ6LrYd1wcxPCTWiLznys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WWzSGPIyTNcQ9B78fY7ktB5q6d6AgUVADFX0XykqvatRY5LBVgUGPguBoZBSzbOnR
	 fMM2z3rjDgO2k9N51Ivog2tZAlddAfGipBkTneh3NwFBid2TKRhBWa1732gL63mk5h
	 v/3gGTnu9rchBVK1K3RWpd/0bxY2ya9vhZLHREnseit3TQPGwV2fqZZyzGvc9qd97j
	 kGKAfiiALFaU59TGCrON2ZvrG13rOO+lzxR5ABEtJx0HEDXODNbHOXEp7hpBiz12hy
	 7lvWFm7JewlpbdS57/XdQENSotab33tOAgBJB+6g9aWe7eefANiHDiZAgttX4Ss43s
	 MzOVh6Mpba8mg==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Philipp Hahn <p.hahn@avm.de>
Cc: Philipp Hahn <phahn-oss@avm.de>, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <40180613bef84946c45d6fbeb4bb274573cd0beb.1778849135.git.phahn-oss@avm.de>
References: <40180613bef84946c45d6fbeb4bb274573cd0beb.1778849135.git.phahn-oss@avm.de>
Subject: Re: [PATCH] run-clang-tools: run multiprocessing.Pool as context
 manager
Message-Id: <178104854408.2704789.17704419269230550087.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:42:24 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=736; i=nathan@kernel.org;
 h=from:subject:message-id; bh=QkOukaD62/6729HeqHX3CRcThRH96lR0vkjEb3HWdu8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkaS75JJ7J/XF3KunpGaM9OKXl26dPTttzjTAwyXHfyz
 oMlX64+7yhlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQAT2fCY4Z/h56Pezrz875WO
 pDB0TGUVsAuef9l59qcD2evuvkoTKtNkZHhobBUudc+AbXvTtHmy069b3dGKvSTlcPrQLZEwJfU
 jl7kA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,avm.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:p.hahn@avm.de,m:phahn-oss@avm.de,m:linux-kbuild@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13683-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B40D664D64

On Fri, 15 May 2026 14:47:50 +0200, Philipp Hahn wrote:
> run-clang-tools: run multiprocessing.Pool as context manager

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] run-clang-tools: run multiprocessing.Pool as context manager
      https://git.kernel.org/kbuild/c/c10ba5c9c62e2

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan



