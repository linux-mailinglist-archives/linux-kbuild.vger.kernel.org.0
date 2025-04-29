Return-Path: <linux-kbuild+bounces-6792-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3007AA0CFC
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 15:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62C80188D4A1
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 13:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067762C2ACB;
	Tue, 29 Apr 2025 13:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="YjFoloqp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC653B2A0;
	Tue, 29 Apr 2025 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931905; cv=none; b=hLP1eYHjJnvv6ibE0hml8qUXzwZTNJ2bx5nLUiTltJkhT8ajFFPn2GNOgevO6qEFvO576afzmjnENvnUIW5rF4uvV5RLyTnHbJykVKltHLY+LaSY2QY+jeochFHKZkFdka8bndrqXF5D+4VlVY4FagvprfDjTwnKyLHkS/MeIsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931905; c=relaxed/simple;
	bh=2oCW7m9ifAETTD8BGa4ZwZTAQDr4NgniCQNg5GmjRAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DTO7atwnFl63Nrno0xHjx7mVTAuecGrXrvipfBrg36ycMN4Q6ME7uEDBgN+uW6MIgACeojoyHA2/xXCgmM/b+mYOwY+XuMjk0WxOJrUniEKo+KG5gt9X+FSDioe/nXE4iogqnI6WHa2jl4zT82sRpHyipifkXcxWQLi1umbpMuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=YjFoloqp; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1745931564; bh=2oCW7m9ifAETTD8BGa4ZwZTAQDr4NgniCQNg5GmjRAw=;
	h=From:Date:Subject:To:Cc:From;
	b=YjFoloqpivBQWbE2WbnVfmpW9INRZv5pF97PSlPvPpjYmE5QnLma127gievqZpwLn
	 awLAmpdVAlI9GiNBwWETkl2DXJgX4SvT7RRiDrXZk+iHRj6wOaYXbcG3GDYhj3xn/F
	 hxDj6DBJ+so86j1avhozwnD2lEFWKcIDlSvnawCE=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.52.1)
	(envelope-from <n.schier@avm.de>)
	id 6810cd2c-0395-7f0000032729-7f000001d2ce-1
	for <multiple-recipients>; Tue, 29 Apr 2025 14:59:24 +0200
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 29 Apr 2025 14:59:24 +0200 (CEST)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 3397880838;
	Tue, 29 Apr 2025 14:59:25 +0200 (CEST)
Received: from l-nschier-z2.ads.avm.de (unknown [IPv6:fde4:4c1b:acd5:7792::1])
	by buildd.core.avm.de (Postfix) with ESMTP id 1038F181BA4;
	Tue, 29 Apr 2025 14:59:24 +0200 (CEST)
Received: from localhost ([::1] helo=l-nschier-z2.ads.avm.de)
	by l-nschier-z2.ads.avm.de with esmtp (Exim 4.98.2)
	(envelope-from <n.schier@avm.de>)
	id 1u9kYh-000000089kf-3Z1r;
	Tue, 29 Apr 2025 14:59:23 +0200
From: Nicolas Schier <n.schier@avm.de>
Date: Tue, 29 Apr 2025 14:59:13 +0200
Subject: [PATCH] randstruct: Rebuild completely if randstruct.seed changes
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-rebuild-on-randstruct-seed-changes-v1-1-16a74fe65538@avm.de>
X-B4-Tracking: v=1; b=H4sIACHNEGgC/yWNwQqDQAwFf0VybkBXrdhfKT247rMGZC2JFkH8d
 xc9zmFmdjKowOiV7aT4i8kcExSPjPqxi1+whMTkclfnlWtZ4VeZAs+RtYvBFl37hQ0IfAvGT1/
 VKF0z+LKgFPopBtmuyftzHCfjBAZUdAAAAA==
X-Change-ID: 20250429-rebuild-on-randstruct-seed-changes-6b45e327fb31
To: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, linux-hardening@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Nicolas Schier <nicolas.schier@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2055; i=n.schier@avm.de;
 h=from:subject:message-id; bh=2oCW7m9ifAETTD8BGa4ZwZTAQDr4NgniCQNg5GmjRAw=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBoEM0r7k1GoafcbnAfvnDJSYJVnnD7bEOXWjP81
 0bR68QzE3aJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCaBDNKwAKCRCIxryciJpt
 uIRGEACOJz1v3io+I/0Iq/QaOAt9e5NEWGXdxwDGtLA7Y2x68gbBJ/vP8LbsdBaWWsxB/UFbrQY
 vvKHTmvRJAS3/giVw19jr/D/Owa5/B6r3AtW4mFjot52X021vK4TjKgQGpeW6c3qiSJGaMx8K4J
 X8eeq1HaBiXV8TEBW/eTOL4fX/OtkdP0T9wNRkccBc+u9eVFX0PUSGt/6i/CrvbV76FGBDE76rI
 SsIB/gWyB13ao6UrnTjnubpLsff+3B5kOV57e6kpDNmv0tqDsWa8X25IaDJrB8s3rGHo0AFhXWF
 trhjeBANONIXzGZlzbpR6KYx3a2nJwB3INiQOxp1iLrPUohT4bky0u8OOArvzfBvTzmMlOvAsXh
 nViGbseZ6QVGYU6UIlf/o/zMXQyrZJ1htk9lbHXWGCryqLxK0XxxYxMRQcey+QFzzmU9wEhoua6
 klLOyP9K5U0Wh0cpUOxt6dZxA3H2b+IMtdPhstfopAk1j0/dIe4gpKW5b91VlXTBThesRZXMfTQ
 1pfz+D3NnkU84IWXW2XzSU4wTNkjtnd/1ljrM0vkc8i8ulMtbAGJMScE4CoAxf6mxwMeJiGSfTf
 CY+XVxQcmGdVtMfUtCj7E/TGWWmdVFjcFz//pCo1cGQrcMnRQNWXTaGBywMoHr2lfAMmkWXUlKw
 om2l5UNdKfJ8Ekg==
X-Developer-Key: i=n.schier@avm.de; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1745931564-2D629E09-1E870DB7/0/0
X-purgate-type: clean
X-purgate-size: 2057
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

Include generated/randstruct_hash.h in linux/compiler-version.h to force
a complete rebuild if CONFIG_RANDSTRUCT is enabled and randstruct.seed
changes.

Removal or change of scripts/basic/randstruct.seed leads to a remake of
generated/randstruct_hash.h.  As linux/compiler-version.h is a
hard-coded include for every kbuild induced compilation, conditionally
adding generated/randstruct_hash.h there adds it as build-dependency to
each object file.

Reported-by: Kees Cook <kees@kernel.org>
Closes: https://lore.kernel.org/linux-kbuild/202504161928.17A90D9B@keescook/
Signed-off-by: Nicolas Schier <n.schier@avm.de>
---
As I have no rust experience at all, yet: Do we have to consider
something for rust?
---
 include/linux/compiler-version.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index 573fa85b6c0cd314dfeec66e8c77342798aa7e62..523eacf80c1a6149c513dccfd0dd9fd388e909a4 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -6,9 +6,19 @@
 #define __LINUX_COMPILER_VERSION_H
 
 /*
- * This header exists to force full rebuild when the compiler is upgraded.
+ * This header exists to force full rebuild when the compiler is upgraded or
+ * the randstruct is changed.
  *
  * When fixdep scans this, it will find this string "CONFIG_CC_VERSION_TEXT"
  * and add dependency on include/config/CC_VERSION_TEXT, which is touched
  * by Kconfig when the version string from the compiler changes.
  */
+#ifdef CONFIG_RANDSTRUCT
+/*
+ * If CONFIG_RANDSTRUCT is enabled and scripts/basic/randstruct.seed changes,
+ * randstruct_hash.h is updated.  Including it here, makes it a build
+ * dependency for all build objects.
+ */
+#include <generated/randstruct_hash.h>
+#undef RANDSTRUCT_HASHED_SEED
+#endif

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250429-rebuild-on-randstruct-seed-changes-6b45e327fb31

Best regards,
-- 
Nicolas Schier


