Return-Path: <linux-kbuild+bounces-13926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S5pvIG12R2p+YgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13926-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 10:44:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E67D87003AD
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Jul 2026 10:44:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=zCNOBjzx;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="H/v83nw5";
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=YIN6v6wc;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=oJ0bmoSU;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13926-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13926-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 549FB30C1D9D
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2026 08:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E82348C4E;
	Fri,  3 Jul 2026 08:39:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F133A00C
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jul 2026 08:39:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067953; cv=none; b=GDlppooZBg6MJOavDMi/sD/Xcr5BC5Vyg/KL9cLFQXB9R3/KYcs3OWj0mgUGZxZ4tR9XbHZ/jFMT3Gg7S+kchgfMWilGypReg7+BaHKSgzJJwqaYonuH21SYvFk+KrwHHi8I2FK17wxsjtYNm3vMG7MipCBtKw5ySZZcaTxcFNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067953; c=relaxed/simple;
	bh=cc1YF5Xt6ILBwZEpNWgVPIYMTH4RiRIUrO8CEZqCiAI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=O7MgeFhpTDWubj745NweSoai42yK9tukerDsWanUC9xJIE2twXvV17LUhJk3fHKOFIVmiidv6z4HtpXD//FODQZPj3fXjcRCj1V2y3F+DjkbjsalZtrWWs6zw6J+wEoW8kThbb9TnU7/ys6Zh01+myJbNMPjVgNwuRmCnhTWHZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=zCNOBjzx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=H/v83nw5; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=YIN6v6wc; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=oJ0bmoSU; arc=none smtp.client-ip=195.135.223.131
Received: from localhost.localdomain (unknown [IPv6:2a07:de40:b2bf:2b::1244])
	by smtp-out2.suse.de (Postfix) with ESMTP id C279776295;
	Fri,  3 Jul 2026 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1783067950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVCN46FUPtrb2rabya6kBc7h7xw67ekcKSWMFjZW77M=;
	b=zCNOBjzxpmleslMmlUNaH+UCwwGNlKkZZqDmQH8EVA9HCbEjVy4r0TpXodHevqutoi5ayV
	pYlepXhM5JI35yQY+s6HgeX8uphAI/7dndoitiDHw/dqITHdWLLGzwXi0KweziZsOOD1sL
	eXidzRLNI1WpkzM2KH9PfPXP82ook3Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1783067950;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVCN46FUPtrb2rabya6kBc7h7xw67ekcKSWMFjZW77M=;
	b=H/v83nw5Yt5xuNM/cOyvbsxd+kDhKsEBKDgE7GaxccCFyE7N2z7GZ0Q4PUY5q2rkDWtgul
	vZLWOdsDFrUHNdCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1783067949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVCN46FUPtrb2rabya6kBc7h7xw67ekcKSWMFjZW77M=;
	b=YIN6v6wcGBmPdER1DLZaFrgjXjY/QFShEFFyX+pfaLyvLyUOVHW6RI4f3E2A/13x4wf8Vb
	nSUF+tvUFtU7Xnx8xIYqgdHjY0h6dFZRBG+wkpmIqDVmaEDsW08RG+2ZduYCGoa0I/9YVb
	xCR4t0CHhw50uDZBIAX+LKKVSZkB7bQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1783067949;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVCN46FUPtrb2rabya6kBc7h7xw67ekcKSWMFjZW77M=;
	b=oJ0bmoSU8Z3ld2eavU6EN0EZOtWQJokai34GjWF+5DiD9BbvVCMOArCZG2rqVBwBigMWWn
	06UDxonY4+DYMwBw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
From: Miroslav Benes <mbenes@suse.cz>
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 live-patching@vger.kernel.org, shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, Zelin Deng <zelin.deng@linux.alibaba.com>
In-Reply-To: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
Date: Fri, 03 Jul 2026 10:39:01 +0200
Message-Id: <178306794166.34581.9718581938044856305.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=227; i=mbenes@suse.cz;
 h=from:subject:message-id; bh=cc1YF5Xt6ILBwZEpNWgVPIYMTH4RiRIUrO8CEZqCiAI=;
 b=owGbwMvMwMHYWJt9x2W1tA7jabUkhiz3Uq1DAXPUxDeGX3jLENvXlDQ38cC2ud07A6TtFZdtd
 W5X9LrVyejPwsDIwWAppsjyeq+znOGUXAPN6nd3YQaxMoFMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDx4iBi1MApvrYb/b/nq//srGJ/z4gFJtelHPny1vhla8uCQrr88x93y1b62QrtfHzbEG/Zpk
 /Gs/nvmXqvF99xlY0abLPNoOSFQceeL72SJWL/GO6rdRvygqn3lc9TVdS0loj0icU3A9/tHDDr5
 tXzea2fvEJY1wZ/YtxXqifrdK0orP93xpb4jYckP/swBCfKb54pvQy//kNWux7ygx51+d0pDpPN
 D/4I/qD1t3zzQb8Z+8nb8vvubVx273fvfyLVON4nQTCSt7EXAxRTNJiXfTT5c8uu+mV89SUnZKP
 L3apZjJ2KH284oCYuuaRewpx6+Q/ZG0N3C2p6ntvTs02zW0e/mylAif23a4QdYsMrmuZsT7MO+y
 gnjwA
X-Developer-Key: i=mbenes@suse.cz; a=openpgp;
 fpr=91BB0699882EF39D46654BB3FF98A38DA80834DA
X-Spam-Flag: YES
X-Spam-Level: *****************
X-Spamd-Bar: +++++++++++++++++
X-Spam-Score: 17.38
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	SPAM_FLAG(5.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mbenes@suse.cz,m:pmladek@suse.com,m:live-patching@vger.kernel.org,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:zelin.deng@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mbenes@suse.cz,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mbenes@suse.cz,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13926-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E67D87003AD

On Fri, 03 Jul 2026 08:04:08 +0200, Thomas Weißschuh <thomas.weissschuh@linutronix.de> wrote:
> kbuild: unset sub_make_done before calling kselftest build system

Acked-by: Miroslav Benes <mbenes@suse.cz>

-- 
Miroslav


