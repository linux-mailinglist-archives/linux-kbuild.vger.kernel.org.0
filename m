Return-Path: <linux-kbuild+bounces-11422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFVOFNvjnmnQXgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11422-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 12:58:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E7196EB6
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 12:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C7A43029A84
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 11:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E743A1A48;
	Wed, 25 Feb 2026 11:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wildgooses.com header.i=@wildgooses.com header.b="TQT4Mz3H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail1.nippynetworks.com (mail1.nippynetworks.com [91.220.24.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8928C854;
	Wed, 25 Feb 2026 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.220.24.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020695; cv=none; b=CHuJGCaAUJCA1w+wnObpYZNU2rHqyZ3vkSnTJJUvXtHWEm7K+l2QJUiKjbb6KX+QOiWPXOvIe5zKQ2unPW3dCnL1gW9S97YGmHS+L0tftAzqkxFaE2B1tSSnsT10y34WVxCBS46JgI5mhcatUjdjSvOMa5+4ppRQSpHS7gT/Cp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020695; c=relaxed/simple;
	bh=X3BSEY6AMfvsOuJKktRiDrIuSjEyA7gBe5/TNzodbaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWcYdxTcXNDbzZI8nA21nFQigN1Ef7/9Qwpc8dC8AOp8d8dalyl3ozclhMePLRFAOrmU9mzRBiDx7IBKeioCujdEiQcIXW7z0Jj+Qx1BSyMsAEjmfS5J1iD34lf+rWO7TgGxta8sjpuytuSJMNPRDeAWlsygCAm4nM19KFaVnuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wildgooses.com; spf=pass smtp.mailfrom=wildgooses.com; dkim=pass (1024-bit key) header.d=wildgooses.com header.i=@wildgooses.com header.b=TQT4Mz3H; arc=none smtp.client-ip=91.220.24.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wildgooses.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wildgooses.com
Received: from [192.168.8.152] (unknown [94.228.36.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ed@wildgooses.com)
	by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4fLY1R2Nkxzkd2v;
	Wed, 25 Feb 2026 11:55:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
	s=dkim; t=1772020507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3BSEY6AMfvsOuJKktRiDrIuSjEyA7gBe5/TNzodbaU=;
	b=TQT4Mz3Hby5fnHSuZZ69KpI5/a4sxu7iVH1dvVYKbrjd/CNwofShcqtTFNJPjExZNiNei3
	EveEcEQcAtH3Vval1zSRUCBNurpNBzTok8BgRcJdn5z+wT4Oq/GP7fzk4Dq44tuRiU1gQa
	8Y4yCtiy8xtMPujx/3UzU5bIF2MASyE=
Message-ID: <4ff9d8be-ba4c-4698-abe8-31fcf2717acf@wildgooses.com>
Date: Wed, 25 Feb 2026 11:55:06 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: extlinux can't boot kernel after commit "kbuild: keep .modinfo
 section in vmlinux.unstripped"
To: Nathan Chancellor <nathan@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 masahiroy@kernel.org,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <587f25e0-a80e-46a5-9f01-87cb40cfa377@wildgooses.com>
 <3ac876ca-0038-41e8-a1a0-3d5434f30473@leemhuis.info>
 <20260224204632.GA3510750@ax162>
From: Ed W <lists@wildgooses.com>
Content-Language: en-GB
In-Reply-To: <20260224204632.GA3510750@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wildgooses.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[wildgooses.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[wildgooses.com:+];
	TAGGED_FROM(0.00)[bounces-11422-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lists@wildgooses.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A29E7196EB6
X-Rspamd-Action: no action

Hi Nathan (and Thorsten), thanks for replying! Appreciated

On 24/02/2026 20:46, Nathan Chancellor wrote:
> So I will deal with this one, as I committed the series.


Thanks so much!!


>>> My guess is that something has moved or become re-ordered such that t=
he extlinux is rejecting the
>>> image??=C2=A0
>>>
>>> At this point I'm honestly not quite sure what I am doing, so would s=
ome kind soul please help me
>>> figure out what is happening? I apologise in advance that I've likely=
 not given enough information
>>> about the problem, please be gentle...
> I think you provided good information off the bat, so no worries on tha=
t
> front. I am not entirely positive that this is the root cause but now
> that I am looking at it and have some additional context from a recent
> 7.0-rc1 commit [1], I think 3e86e4d74c04 adding .modinfo to ELF_DETAILS=

> and removing it from DISCARDS results in .modinfo appears in certain
> places, namely arch/x86/boot/compressed/vmlinux, where it may not be
> expected. Why that breaks this bootloader, not sure, but I don't really=

> think it matters. I think we should move .modinfo from ELF_DETAILS
> (which may be used in other non-vmlinux linker scripts) to its own
> macro, add that to all vmlinux linker scripts, and discard it from
> places where it used to be properly discarded. More code but I think
> it will result in fewer problems. As far as I can tell, this is the
> reason that commit d50f21091358 ("kbuild: align modinfo section for
> Secureboot Authenticode EDK2 compat") was needed and that change needed=

> a further follow up fix in commit a26a6c93edfe ("kbuild: Strip trailing=

> padding bytes from modules.builtin.modinfo"), so we could have saved
> some headache from doing it right from the beginning.
>
> Ed, could you test the below patch with your setup (it should apply
> cleanly to 6.18.13, 6.19.3, or 7.0-rc1) and see if it resolves your
> issue?
>
> [1] ddc6cbef3ef1 ("s390/boot/vmlinux.lds.S: Ensure bzImage ends with Se=
cureBoot trailer")
>
> Cheers,
> Nathan


Yes, your patch works fine against my 6.18.12 kernel on my AMD64 machine =
and booting with extlinux
(previously not working)

I also played around a little with some variations and it seems as though=
 the adding in of the
=2Emodinfo into the strip is the key, caveat that in my messing around (b=
ased on inspiration from the
commit [1] that you mention), I needed to reorder the macros to get it to=
 compile. Note, I'm not
suggestion this as a solution, just illustrating some extra info:

--- arch/x86/boot/compressed/vmlinux.lds.S.orig=C2=A0 =C2=A0 2026-02-25 1=
0:42:45.040655315 +0000
+++ arch/x86/boot/compressed/vmlinux.lds.S=C2=A0 =C2=A0 2026-02-25 11:06:=
32.907372114 +0000
@@ -80,17 +80,18 @@
=C2=A0 =C2=A0 =C2=A0. =3D ALIGN(PAGE_SIZE);=C2=A0 =C2=A0 /* keep ZO size =
page aligned */
=C2=A0 =C2=A0 =C2=A0_end =3D .;

-=C2=A0 =C2=A0 STABS_DEBUG
-=C2=A0 =C2=A0 DWARF_DEBUG
-=C2=A0 =C2=A0 ELF_DETAILS
-
=C2=A0 =C2=A0 =C2=A0DISCARDS
=C2=A0 =C2=A0 =C2=A0/DISCARD/ : {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(.dynamic) *(.dynsym) *(.dynstr) *(.dy=
nbss)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(.hash) *(.gnu.hash)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(.note.*)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *(.modinfo)
=C2=A0 =C2=A0 =C2=A0}

+=C2=A0 =C2=A0 STABS_DEBUG
+=C2=A0 =C2=A0 DWARF_DEBUG
+=C2=A0 =C2=A0 ELF_DETAILS
+
=C2=A0 =C2=A0 =C2=A0.got.plt (INFO) : {
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*(.got.plt)
=C2=A0 =C2=A0 =C2=A0}


Thanks for isolating the issue!

Ed W


