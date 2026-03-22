Return-Path: <linux-kbuild+bounces-12133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAWyJlwawGnmDgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12133-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 17:35:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB702EA053
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 17:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E76330053BB
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 16:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F95A367F52;
	Sun, 22 Mar 2026 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cKJif8Dr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36B03D76;
	Sun, 22 Mar 2026 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774197335; cv=none; b=XZx26UC4aDMTycZ1a1dacTu2nMIxy1M4w2J5QZnR7Me/zHR3rmh03YEQjR/1GNIH2KiI87WD6MVFC+y3GPEicclgHgfh5O2vhpHGamP2kyIv8MNMfCua7WAC0+sEywFOiOxOdkkrl7/XwkqdY5nZRQy97zBOtbi3mJgmQ0qvEMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774197335; c=relaxed/simple;
	bh=OhFmczSWdRSHv/PJPv1Hi/xrwWK7ysEMMY4lS4c0YV8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kQeM9awa84PhEFoMB5Fc2zH5MgN+D+wbS+60uzgz6F7BuP8omahbwzQb/lp67PnAH8zjaha/PrbEyBDo0TP0rD+pUAcPctbGNcPZkZcuvCoY8QhbrLsp7IlVWpUK36J4U4iMuUNhX96x5RxnJTtWrLKx9tl/e7ixoIl1LhJoUhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cKJif8Dr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C6EC19424;
	Sun, 22 Mar 2026 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774197334;
	bh=OhFmczSWdRSHv/PJPv1Hi/xrwWK7ysEMMY4lS4c0YV8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cKJif8DrRkdnjQvQpQ1ROtGFR6SXXhGNHyUc69cnnJ1Sdksze188JdndUhybUB3bo
	 Ab5Rl9JPtYSZqu5BrVRWTU9CduRNpLRZefkx+V5O6pTPO83blx7cJ1Bla/qlKyVQh6
	 SU64HJVBhsXQ8Z/AeQKwL7LTrncj7VIOY0VHC808=
Date: Sun, 22 Mar 2026 09:35:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Greg
 KH <gregkh@linuxfoundation.org>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>, Vlastimil
 Babka <vbabka@kernel.org>, Helge Deller <deller@gmx.de>, Randy Dunlap
 <rdunlap@infradead.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 0/4] kallsyms: embed source file:line info in kernel
 stack traces
Message-Id: <20260322093533.c0aab4ed9f5eef9536d14c21@linux-foundation.org>
In-Reply-To: <20260322131543.971079-1-sashal@kernel.org>
References: <20260322131543.971079-1-sashal@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12133-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,nod.at,suse.com,linux-m68k.org,HansenPartnership.com,lwn.net,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-foundation.org:dkim,linux-foundation.org:mid,sashiko.dev:url]
X-Rspamd-Queue-Id: DFB702EA053
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Mar 2026 09:15:39 -0400 Sasha Levin <sashal@kernel.org> wrote:

> This series adds CONFIG_KALLSYMS_LINEINFO, which embeds source file:line
> information directly in the kernel image so that stack traces annotate
> every frame with the originating source location - no external tools, no
> debug symbols at runtime, and safe to use in NMI/panic context.

Sashiko review hasn't completed yet, but it has things to say:
	https://sashiko.dev/#/patchset/20260322131543.971079-1-sashal@kernel.org

