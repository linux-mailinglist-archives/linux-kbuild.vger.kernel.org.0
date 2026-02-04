Return-Path: <linux-kbuild+bounces-11037-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG1rKNqbg2nppwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11037-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 20:19:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E647EC05A
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 20:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A1E030055F7
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 19:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4781734AB16;
	Wed,  4 Feb 2026 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Q376kZR8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECBD37F0FB;
	Wed,  4 Feb 2026 19:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232788; cv=none; b=P5ZuoMFgdGTWl234Iom5r+4k2jybtwa/hwfsyZ7aQtXmiXrEer2gJC6SF7kT824oWb6oPLP5lc7yjoU9br81Pc3qUeYpe6HFPl/LptY6bn3wvL0Kl+MqtuwpBM8aGoGsvmd2PaoduGAptTYi/fqMoPB5SqaJ0zLVEnMGhmg7gwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232788; c=relaxed/simple;
	bh=dx/n2ZSnVbr5KLV93z31YExmyUZ4EQEgGgGeMkJk0wo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=axOrC59i2eIt4a2xF6tFsq3WYQ70zxSM+4Z4ttjxUMERxt4b2hsOcwgp/+XbjE5WeMk7fTxT24raONo+YS7oU8qVSu5KW+AUzZcjIcmaiZRxOcK5iuGGzjqGheuo+2vQD4Ug/mQWWnALB41+8v+Lvsuev4/dlMECRsemYY385js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Q376kZR8; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1770232778; x=1770491978;
	bh=xt/M6F0af0Aewj/HTy9bWBamZzfKiE3bbOG01o2uFtM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Q376kZR8Pto71tvnj6n7GjgscdCs98sLMqjUgRQmz9oAx5a8WwuDDn655K2JU1/3d
	 1lMyY7iBcsrKZHLByNeh4kVrYx30qm7/xA/xsxMWjZajX5jn8vPtm410ZakXeZOLaw
	 Ze935eM/LjnMXgNX7dBQ12NTbWpSBCfrM8816cZ6L0oKa37a8AVJGSu64pldMMJjoe
	 7wN047NUvVO51ok7tpvhmhsiBOhrSJ7rlesDsanEpDeOK8wOsBfmN6xh76pzz8gpkg
	 zydmErghLTkxQgzLSmB/NZJttJzrCRmrWQWWN4hpag/EUbtp/feJsVr/CdHNp7YH5C
	 4TulsISPmxZJw==
Date: Wed, 04 Feb 2026 19:19:34 +0000
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH v10 03/13] kasan: Fix inline mode for x86 tag-based mode
Message-ID: <2ee8abb956de90ce843a3fb7b971377887fe7a79.1770232424.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1770232424.git.m.wieczorretman@pm.me>
References: <cover.1770232424.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 4be30621188735452b609f7e3a4c7ebd98176383
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11037-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,arm.com];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,pm.me:mid,pm.me:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E647EC05A
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



