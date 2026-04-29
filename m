Return-Path: <linux-kbuild+bounces-12925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ITtLkJ48WkxhAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12925-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:17:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3C048EA57
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F9F530512B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430723859FF;
	Wed, 29 Apr 2026 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="X+VrSbh3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C065E3859E2;
	Wed, 29 Apr 2026 03:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432604; cv=none; b=GMVm7icmDU+Gok8J9Sukqu37HjU1VRk4cxA/Xxqi6dCtxQRllhBK5Vqd7kw/Qy6LbB/eHQ05jhfjiWNiyEb9oDRR4bUnpws5YwcZVuCRaMk7jwCgdyxewPve+5y6a1pTTKZsABipwBRK0b3mWo9KttKJ+Mqw0oKKa/09HC9b2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432604; c=relaxed/simple;
	bh=YeqyEWwih+JpudMJe7WdZ2kqd7sKYMVbRPVxXxthf2o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=smEpU3qFoT2UWfjj836v57KdXm4iGab73+pDP2gy1PgulBiabQA128zuPyrftUNx7Ivg5jrE5VHsDLRFMLLRe2DnMa6Se3OMSVU80H81qU2FxLHros/CD/iqxs/SiBQbOstpT4BQLu7wYBxP39SFQhkltWacFOZAWsz1Pd2/JUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=X+VrSbh3; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 63T3FPLh1390337
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 28 Apr 2026 20:15:25 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 63T3FPLh1390337
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026042601; t=1777432526;
	bh=dNQMSM3zQLoTSLRoP7qOgzDEMb+YUOOF5DSMz/bSBiE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=X+VrSbh3duqSkLnTNqGwuZMVmZ076Rtmwd4Q4ONlPhipVuhR47xNbP69ynsuj1zy2
	 c0HukEu1LYSyB1yqZ+7SYqPPzuuGw8Uz/fXKbhbi/ZxEUDWXm8OBu1RgAxfmbVhpFr
	 RIraGDCD+a0ryms+0X28lZ4USXBYCn9fBJrKZvFh+UopupcB0WpdA1gCFCRqQOd/4z
	 fDaBXYl5Dkk2GYbNgodsspeeKahxMCF3/7fA8E6g0Y83Iiu0Gqy9CHjM9sWMHmsspG
	 xL22hz+NS83IgLXjWmYRF8yNITCBR06yBP0aUp2Aj+0fU8KHYO6wr8nNXdhVyL5epr
	 jvz2Xk6+LBkCQ==
Date: Tue, 28 Apr 2026 20:15:19 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
CC: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_13/14=5D_x86/entry/vdso32=3A_Remove_?=
 =?US-ASCII?Q?conditional_omission_of_=27=2Ecfi=5Foffset_eflags=27?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-13-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org> <20260428-bump-minimum-supported-llvm-version-to-17-v1-13-81d9b2e8ee75@kernel.org>
Message-ID: <D53F1346-2EE6-4449-BEA0-83D3B65A65A7@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3C3C048EA57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026042601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12925-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,alien8.de:email,infradead.org:email,zytor.com:email,zytor.com:dkim,zytor.com:mid]

On April 28, 2026 7:59:19 PM PDT, Nathan Chancellor <nathan@kernel=2Eorg> w=
rote:
>Now that the minimum supported version of LLVM for building the kernel
>has been raised to 17=2E0=2E1, the inclusion condition added by
>
>  3e30278e0c71 ("x86/entry/vdso32: Omit '=2Ecfi_offset eflags' for LLVM <=
 16")
>
>will always be true=2E Revert the change to clean up the source code=2E
>
>Signed-off-by: Nathan Chancellor <nathan@kernel=2Eorg>
>---
>Cc: Thomas Gleixner <tglx@kernel=2Eorg>
>Cc: Ingo Molnar <mingo@redhat=2Ecom>
>Cc: Borislav Petkov <bp@alien8=2Ede>
>Cc: Dave Hansen <dave=2Ehansen@linux=2Eintel=2Ecom>
>Cc: Peter Zijlstra <peterz@infradead=2Eorg>
>Cc: x86@kernel=2Eorg
>Cc: H=2E Peter Anvin <hpa@zytor=2Ecom>
>---
> arch/x86/entry/vdso/vdso32/sigreturn=2ES | 10 ----------
> 1 file changed, 10 deletions(-)
>
>diff --git a/arch/x86/entry/vdso/vdso32/sigreturn=2ES b/arch/x86/entry/vd=
so/vdso32/sigreturn=2ES
>index b33fcc501ba3=2E=2E328bd3a4ef51 100644
>--- a/arch/x86/entry/vdso/vdso32/sigreturn=2ES
>+++ b/arch/x86/entry/vdso/vdso32/sigreturn=2ES
>@@ -22,17 +22,7 @@
> 	CFI_OFFSET	cs,     IA32_SIGCONTEXT_cs
> 	CFI_OFFSET	ss,     IA32_SIGCONTEXT_ss
> 	CFI_OFFSET	ds,     IA32_SIGCONTEXT_ds
>-/*
>- * =2Ecfi_offset eflags requires LLVM 16 or newer:
>- *
>- *   https://github=2Ecom/llvm/llvm-project/commit/67bd3c58c0c7389e39c5a=
2f4d3b1a30459ccf5b7
>- *
>- * Check for 16=2E0=2E1 to ensure the support is present, as 16=2E0=2E0 =
may be a
>- * prerelease version=2E
>- */
>-#if defined(CONFIG_AS_IS_GNU) || (defined(CONFIG_AS_IS_LLVM) && CONFIG_A=
S_VERSION >=3D 160001)
> 	CFI_OFFSET	eflags, IA32_SIGCONTEXT_flags
>-#endif
> =2Eendm
>=20
> /*
>

Acked-by: H=2E Peter Anvin (Intel) <hpa@zytor=2Ecom>

