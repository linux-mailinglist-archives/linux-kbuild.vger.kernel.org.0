Return-Path: <linux-kbuild+bounces-10734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DmQJaGsb2miEwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10734-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:26:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0756C47748
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:26:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C13B986024
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 14:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B19441048;
	Tue, 20 Jan 2026 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PmYwNYnj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806F844B661
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920096; cv=none; b=MdG/RzJ6QhW50hcNGGyHtvFrAMGkjvvl7EK5OGA1uDFUqk/5cme24Z0u/9UrHyEpzHzDFZVdKJYi+DjKeCwJ/argXOICo6HhizYNcCt+G4emXzCido3O8ttWO1GvO3tXgrzuqQg+e3oU6StIKSnzwHlK+LauTSOorL/rdvsgX2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920096; c=relaxed/simple;
	bh=mpaAioP9xru6B/CFoG7LGoQcykHVJkLIzdsXpgUjdj8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F1/lPZYqwbJtaYm7KoC9vh+X5K30+hy146jKXDB3ZhgDlDXNe/fWBdL7SLY0ztExRGxKQCZPMsSu5SGoEcFVjTfZI8ExAr2uTjA8kljKXUe3CGfzGS1zxfMqNg12U24stvYJcmUlaeeAQz445y4EHtpwQ9ZVmPCZoCmVHJrfL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PmYwNYnj; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768920090; x=1769179290;
	bh=/QCjh1bIysDd4v5OZ14LNkObiBtwfe/ruaYSf4e0H0s=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PmYwNYnjHnsEre5V0Q+WWJChYF2avoL+3kqOftMwwckzsmujMaXvqHZFV8Wy5wYUP
	 mhtKCYS9nkhG3lZLKDxITWaJjl9TNA0fZFlD52WHxuUGkzdfth5H2GiPdUFNIYo1+6
	 fTFX4oxnh5gtQCcSyf6OSnWQiA8kA8X9B/PeydnyXtB7QczE3435d2KhzMMATCWudh
	 dWv8Gc6g2PLzaXEaMerEHuUaj2nGiN/ziE4b1SxNDcu+zk3VpKqI4a8sTQyVtnExHD
	 jLVudsAXXBiu4fGPAx8oOj37AcI1MjyWQEsTBdNq+PR/VqNiq+HztXJBCPIQMbEnpx
	 mbFW/BVWDxAOg==
Date: Tue, 20 Jan 2026 14:41:25 +0000
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH v9 03/13] kasan: Fix inline mode for x86 tag-based mode
Message-ID: <afb50f5db054f807b57f33f591fc43d79862e9a2.1768845098.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1768845098.git.m.wieczorretman@pm.me>
References: <cover.1768845098.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: a28f2f4e8684592b68d763d58d259d63cccf2fce
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10734-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,arm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[pm.me,quarantine];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,pm.me:mid,pm.me:dkim]
X-Rspamd-Queue-Id: 0756C47748
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.52.0



