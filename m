Return-Path: <linux-kbuild+bounces-13908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IISdIyErQ2qZTAoAu9opvQ
	(envelope-from <linux-kbuild+bounces-13908-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 04:34:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB5D6DFCDF
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 04:34:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JZo5zSnd;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13908-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13908-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 122123007CA2
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 02:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210BA25B0B7;
	Tue, 30 Jun 2026 02:33:50 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210B01E5B88;
	Tue, 30 Jun 2026 02:33:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786830; cv=none; b=hrX6x8gp7yhhHoEtls6W0YfVgcr0QeHimmDOR97bRaYVe1krOqGsLEZBYkw3Qce7obHJH+OCVuWE+6+Wf/S4xFDr/W8edw/3i+gR3z8vnzaSTgcYnWYleKi0NaV3SnCs025MBE0q7PPQ1D/1GtP88PAKPG6N81/05lK2WixOfnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786830; c=relaxed/simple;
	bh=3zTrDEmKCd6Jl18ZIrzETpP+APzN28i1iocnAWakA0Q=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PPHvtH975qwnxzTQ0SjqJ5OAdD/ftGvkOhjZuDpnCs0kudDO/zyTozqqURhM0Npg07Tk45nj7pFV+3w9NwLuYGu2UTfc3PIX+Wlz26T1Dtlc+Cyt32GlcribOwbRCeo5FK+qH+7tPiWgIsw3BAP4zyr/o+sg5PnyyWrpSNaXUG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZo5zSnd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6299C1F000E9;
	Tue, 30 Jun 2026 02:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782786828;
	bh=Gtcrm5aKXsptYwYQW9c71HOpswU4kLbcGQAhPy8GojQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=JZo5zSndpAtM+OaTcOOoBKx2NTfYBqxVrvzwN+ZmQ2vOGNdNu48JTFTA+5eOxkRRO
	 4BVbCDPhGaqbKVteWmncck9mIG6/uhYtEzAfP4A+JkRun9ySW6vEmN14+bd7NJQ038
	 u6HFmlfvLmdqwHIMVodbJlgj00PE0zkaba+pOIfCTjLjEXKHp3bR8RE4rmKgabAbcg
	 23SzfX/SfSC7LTJkRm1VfTizUME5F1X8i/LZGOEfEhh3viad73GZpwrpBCMvbsv/dX
	 bp24+UoEeRjKr+ZFWgHcFNq9Ny3+rXwHUmaVzq4Ob+Ny6Gh/refAI5+bf9PcFEkymC
	 62KbpNc2/FpCw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] modpost: prevent leak when early return no suffix
 .o in read_symbols()
From: Nathan Chancellor <nathan@kernel.org>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
 me@brighamcampbell.com
In-Reply-To: <20260624044742.144852-1-robertusdchris@gmail.com>
References: <20260624044742.144852-1-robertusdchris@gmail.com>
Date: Mon, 29 Jun 2026 19:33:40 -0700
Message-Id: <178278682007.3414597.2722879998608613962.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=582; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3zTrDEmKCd6Jl18ZIrzETpP+APzN28i1iocnAWakA0Q=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnO2lwb18bu2RRxYQ+vjpdGqaSl3kmrwyruXvkzi00KJ
 /w4o7ulo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEyki5Hhn7Zi006OW2fvfc17
 Y/59Z9+qVa2fvz13qi+2irf5utjhlTojw9Oep4/abcJmrt9tZ6YZviAkb3Fvn7ntKU1TDrnMR1c
 tGAA=
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robertusdchris@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kernel-mentees@lists.linuxfoundation.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13908-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEB5D6DFCDF

On Wed, 24 Jun 2026 11:47:42 +0700, Robertus Diawan Chris <robertusdchris@gmail.com> wrote:
> The allocation for elf info symsearch and hdr from parse_elf() haven't
> been released when return because of modname didn't have suffix ".o".
> And it seems like the suffix ".o" check did not depends on parse_elf()
> to succeed first. So, move the suffix ".o" check before checking
> parse_elf() result to prevent resource leak when the modname didn't have
> suffix ".o" and return early.
> 
> [...]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan


