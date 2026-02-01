Return-Path: <linux-kbuild+bounces-10963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP/HJR1Pf2nangIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10963-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Feb 2026 14:03:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE515C5F20
	for <lists+linux-kbuild@lfdr.de>; Sun, 01 Feb 2026 14:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0F6A830022E2
	for <lists+linux-kbuild@lfdr.de>; Sun,  1 Feb 2026 13:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AD42FF646;
	Sun,  1 Feb 2026 13:03:21 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEF32E0916;
	Sun,  1 Feb 2026 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769951001; cv=none; b=uMPng9YK3Hz21Dq78U6A6Z73xJtlBHtiZSrAOWyFkpGPpQIX2rfvjtt2vp75BgtLC+LVKnzAxkvBnV5KTwc1agKcbd7svDsXl6uE2nvDhGtQGoXP6Cl3HSpPCnGfNqa3RfV80Wgs9DgRCkJ0KFfgHB5lCUVmqKxkZ8YbY4paJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769951001; c=relaxed/simple;
	bh=5lI0Qs1WhgJFgcxoXzwGq8XatThoD6keIsnSZjdGSWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fAw3su5GGc5L9DgJRek1JAkdINzjcjJdn566jdYpjapmSx0f098LsSvAnuPty/uSIjpmsFRyOzMRsum8Rvc8T6cMn1enVV493zzqiQpRNPGC62nFEo0lIS0Ld+uUsh3uOrHlNuCBBe4XPrwgxTeUK24O42aHSIycXrOx61ewOyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.235])
	by APP-03 (Coremail) with SMTP id rQCowADX9t0IT39pWm5wBw--.13929S2;
	Sun, 01 Feb 2026 21:03:05 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Mingcong Bai <jeffbai@aosc.io>,
	WangYuli <wangyuli@uniontech.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	James Le Cuirot <chewi@gentoo.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Rong Zhang <i@rong.moe>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH] kbuild: install-extmod-build: do not exclude scripts/dtc/libfdt/
Date: Sun,  1 Feb 2026 21:02:59 +0800
Message-ID: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADX9t0IT39pWm5wBw--.13929S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw1xKw1xuw1Dur15JrW8WFg_yoWkKFc_KF
	yIq34fAa1Dt39Ikw1IgF47JrWIk3yrJan5K3WF9F1DZ3s5GF4qgasrKryUAF47WF4Ygr18
	Can2qryxGw4fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10963-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,icenowy.me,rong.moe,iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,iscas.ac.cn:mid,iscas.ac.cn:email]
X-Rspamd-Queue-Id: AE515C5F20
X-Rspamd-Action: no action

There exists a header file in include/linux/ called libfdt.h that is
just a wrapper for libfdt header file in scripts/dtc/libfdt/. This makes
the headers inside libfdt copy at scripts/dtc/libfdt/ part of the kernel
headers for building external modules.

Do not exclude them, otherwise modules that include <linux/libfdt.h>
will fail to build externally.

Fixes: aaed5c7739be ("kbuild: slim down package for building external modules")
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 scripts/package/install-extmod-build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 2576cf7902dbb..d1e448d7f59f6 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -11,7 +11,8 @@ is_enabled() {
 
 find_in_scripts() {
 	find scripts \
-		\( -name atomic -o -name dtc -o -name kconfig -o -name package \) -prune -o \
+		\( -name atomic -o -name kconfig -o -name package -o \
+		   \( -path '*/dtc/*' -a ! -path '*/libfdt*' \) \) -prune -o \
 		! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o -type l \) -print
 }
 
-- 
2.52.0


