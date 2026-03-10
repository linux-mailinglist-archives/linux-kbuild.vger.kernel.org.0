Return-Path: <linux-kbuild+bounces-11791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFsNLbNbsGn2iQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11791-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 18:58:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF7256055
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 18:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C4DD3096EC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 17:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A263C65E6;
	Tue, 10 Mar 2026 17:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="OCZ8/RHk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4016E39DBCA
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773165231; cv=none; b=RmZKAcUUVteBqV9iTLvj0fVVVYuP1crGgX8QkosifoNnf2INCzp9v0xWvkuD04+pIML269f3vnPiHjUjdgRCcBGkFUA5nAVVUNcfxMlcEnXOcbrsb6inUq/+jjq4opdL56IcicBO2gayCGm8Zxqj+PK8DHtXLEn89ejVI3Bef4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773165231; c=relaxed/simple;
	bh=dx/n2ZSnVbr5KLV93z31YExmyUZ4EQEgGgGeMkJk0wo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qj+aOyKSR66ah0WdwkXcnZrquGwXEF1bN2rs775LQzOVAWkhHFf3iUbBgI0Dh62FuVssnNwMkxpxvZM5Cd9vCjFVYxN9dFeg4uok1Y9Xc7xHR9XWEe/bdV6Nn6qdZkNSbwyNGBX3AC973rp+TS0i0slB/S8puSQ+ugV9kNQ40Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=OCZ8/RHk; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773165228; x=1773424428;
	bh=xt/M6F0af0Aewj/HTy9bWBamZzfKiE3bbOG01o2uFtM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=OCZ8/RHkyI35Q6A0yR+RlSOPGPYSk95DfrWBIY7p8V/viEvmzGZvUe8tjlMy+xUAb
	 YZxSyBFVgunZn7wwh/cKKrJcpyOKdnJ8r3p0QarhThx67GQf5jtz6G5YUJ7oN8xy8Y
	 gwCy+JoB0+WB81UMeFRkjNeFijQl7HDVHIH2yXFKehOcCWLk1PwOuT3kzta6lrLPbO
	 ce3uP5sGBRxTzJYtMjqNV0eDGTI6tg3UD3pmNtXcNWqjcLwNp5Dv6h85HwMc0V7944
	 2NIOQgqQrciyfov6UbBS2oicOp2uhu8o5KV8TSes8yhIMlTRLul5B3gA/2Op2P9oi+
	 1bCHAPg1pxXnw==
Date: Tue, 10 Mar 2026 17:53:41 +0000
To: akpm@linux-foundation.org, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH v11 03/15] kasan: Fix inline mode for x86 tag-based mode
Message-ID: <257e64c7cf5ee94a5010bed60ae5f39d41af59cb.1773164688.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1773164688.git.m.wieczorretman@pm.me>
References: <cover.1773164688.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 594cb8d8a1a8fb1968c30ad4a796e272e7b30e4e
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1DFF7256055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11791-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,gmail.com,google.com,arm.com];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
inline or outline mode in tag-based KASAN. If zeroed, it means the
instrumentation implementation will be pasted into each relevant
location along with KASAN related constants during compilation. If set
to one all function instrumentation will be done with function calls
instead.

The default hwasan-instrument-with-calls value for the x86 architecture
in the compiler is "1", which is not true for other architectures.
Because of this, enabling inline mode in software tag-based KASAN
doesn't work on x86 as the kernel script doesn't zero out the parameter
and always sets up the outline mode.

Explicitly zero out hwasan-instrument-with-calls when enabling inline
mode in tag-based KASAN.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
---
Changelog v9:
- Add Andrey Ryabinin's Reviewed-by tag.

Changelog v7:
- Add Alexander's Reviewed-by tag.

Changelog v6:
- Add Andrey's Reviewed-by tag.

Changelog v3:
- Add this patch to the series.

 scripts/Makefile.kasan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 0ba2aac3b8dc..e485814df3e9 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -76,8 +76,11 @@ CFLAGS_KASAN :=3D -fsanitize=3Dkernel-hwaddress
 RUSTFLAGS_KASAN :=3D -Zsanitizer=3Dkernel-hwaddress \
 =09=09   -Zsanitizer-recover=3Dkernel-hwaddress
=20
+# LLVM sets hwasan-instrument-with-calls to 1 on x86 by default. Set it to=
 0
+# when inline mode is enabled.
 ifdef CONFIG_KASAN_INLINE
 =09kasan_params +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
+=09kasan_params +=3D hwasan-instrument-with-calls=3D0
 else
 =09kasan_params +=3D hwasan-instrument-with-calls=3D1
 endif
--=20
2.53.0



