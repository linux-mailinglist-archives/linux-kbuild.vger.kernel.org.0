Return-Path: <linux-kbuild+bounces-2172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8349B90B8D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 20:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7088D1C23C1A
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 18:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F7119A286;
	Mon, 17 Jun 2024 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ntve6mM6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF30194C70
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647133; cv=none; b=pnSQ6S2v5JsqBDhYozQVzvM95VELjPRPiAhBsvG8qwX6qFvJDdNDQ+b2kj93TCHMuV987FccmBqxdhp9wpeDFQ9BY/XyMNZ1ZTE5CEStEXog4GIyFpMVvac3wPOq0dCXxjroAwfhjnkak+RQ0ovBtR7xe8cWdq7jzleul76tDes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647133; c=relaxed/simple;
	bh=qxjnDPhbkT2bqk3JUgXG+OMT2L0q9TuqyeH9xgQXlZY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fuSDumGWKOcMD9GkoRFX15fIgQNqeF8ZSV5UHPzVG6wcj+eukr/EWtN9GEyrdzWZQIWUfKEH0+PlPcLcStrtam8syRwm6ZSWhWd7tNnt725PeQ3XrISpdVNvqjzx5j1mtmqLi99vfgK4V1RIOTkYiITNhX12s03W/oSAWd4VIfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ntve6mM6; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62f46f56353so77591777b3.3
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647130; x=1719251930; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FepdhZeTk2P/UGpz1yHjDkWXnUR5Ic7EpV5t8vA3VJ8=;
        b=Ntve6mM6DKbaoATCL/7rMMqKbS9RdvB9UiL/y3A3x3g0guz27tUYPP8v5pFjwjQ0Le
         X2SfN8OMi80AMvct+25h3aXEXiNgkl49ZzSBD5zMWU5tef8xdOxr7E82rWpOTGj90of+
         uSD6IaLzoa9In3pCqBjrYBPldTfG3+FEHgArJ8dk3NzpRtQZGnqHl0CyVvNXDzoi93tL
         zXerhRSEUfiaO2aEtmsntV7ZEXdUiQ77hTjOvKvYFBH1VW0vzMHnV5444J3A928kzmmU
         p7qltGWrgmjeR77D4Yc/MqPP3CGGM9WOHZgB4uu8SiR78Xl11lHDTaWCql62P91C8Kbn
         fKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647130; x=1719251930;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FepdhZeTk2P/UGpz1yHjDkWXnUR5Ic7EpV5t8vA3VJ8=;
        b=DRSO1wuTJnalh6sxuFJhiJ+4XaLEFseLu52S9uw5teBfQ8KPlAcZt86aHfG7VbtZmu
         V2k24/hVrLNGxZOR5+c23SkFWbVlOgjMsIc/kSXuAn6QXirTKVX0ZQfOgHWHV0a04ux8
         N6VOCh82SCackw47OkRyHSo5wBOFmRGEfZgY7+1eQEEo0d1bcYYJCfqNAAxkIvYS/VOh
         PfSbNHa2trTKNX+Z/yqn/B1YpDU7JVr55d7cs4iFH0D+ApncWAwcDhEh3sFGJcJ2aW/T
         sPN/3o9A1Wo1NwTgnMDRo3YsBA6UexTUl0iw4myAQbgRpKIdRn1oK/ib+yIwOUPLflYl
         ro4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3LkeD8M9gLgOJAtGzNjLx2M1l3lXjV4nftHOB5yy4pHyfFg1MZ7YTMzfxYDOQP2es4IBV4cP6J+y09dh9Oq0nu63eylL51fTa4BE/
X-Gm-Message-State: AOJu0YwXw8SMJGBZrFAiL7xSL/n5eiORe+a09DED9Kte7q9Ls5YDFVrY
	JMbc5KVBOkjze5lRTBwirOxYNomiMIaNOZpXHfYV8WDM1vXcfWXUAbj2o9/fOfZkgQF9WbupKk1
	DOU2W2MBIDxr/CMbJuIcCKZiXqg==
X-Google-Smtp-Source: AGHT+IEKWMn41cQguv0qNaedPOXvzvvCPGUBW2Ai4IEXCZr+AQfjcwobN3pE2EUdIwaI2VHKh5POsClBLW5Uwl1z0o0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:4a0f:b0:62c:de05:5a78 with
 SMTP id 00721157ae682-6322402cc6cmr27980207b3.6.1718647130513; Mon, 17 Jun
 2024 10:58:50 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:33 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620; i=samitolvanen@google.com;
 h=from:subject; bh=qxjnDPhbkT2bqk3JUgXG+OMT2L0q9TuqyeH9xgQXlZY=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk8BkgxPBOcTFd109aXG7GZv2GPe3nQuIQTV
 +Ps+2NQwXmJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5PAAKCRBMtfaEi7xW
 7jz9C/4irEUBFYs+I2aOmFliiJGDZqYDERdlWQJY/S2Kbp2uY4rgt0ooq54+mWm/RT29dZRw1qu
 wzZiFq3yJ5kfWTI7Em5p8rOwLLsAlr8cATc+M//wemnhZOM4pYjVxleLdFdht0Smp1bVohtkM2Y
 6x+zf+KwjcDE2nYxWr8hqpjFF6idGlQnuBq47MhzEJaSmyy1WJjtqddvn3gxNCaBcwcBv4Vnp4Q
 fyDZHNKoqZGdfiwqWKvgOynjGMAotjb3BvoI9d9AkP/qR3F1pN7IFWM6xgqCDeGCaDl9Eu68/rQ
 kbPtux6ew2Ox0cVDiVjQOLDnxLOHyDgFsK2a9JCSJaJzMxyugaZIRPpv7fyLYrsK/hCI/y0q+GM
 uKT5ReLVoA31RS7SnoKjUGgYi0DOUw+OIuPcX5qP11TCp4+Y8hrnzAXxNy6zByYL3wJujL5fTCV 7m+q7O8nwVMrXXoKTpARpZ4LqG+8Ui3OUm+s92JY1f3ZicqYMkl4sJUtTMrAc9Q799oLY=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-31-samitolvanen@google.com>
Subject: [PATCH 14/15] module: Support hashed symbol names when checking modversions
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

When checking modversions for symbol names longer than MODULE_NAME_LEN,
look for the hashed symbol name instead. This is needed for Rust modules,
which frequently use symbol names longer than the maximum length
supported by struct modversion_info.

Suggested-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/module/version.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/kernel/module/version.c b/kernel/module/version.c
index 53f43ac5a73e..0b33ca085138 100644
--- a/kernel/module/version.c
+++ b/kernel/module/version.c
@@ -8,8 +8,36 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/printk.h>
+#include <crypto/sha2.h>
 #include "internal.h"
 
+/*
+ * For symbol names longer than MODULE_NAME_LEN, the version table includes
+ * a hash of the symbol name in the following format:
+ *
+ * <hash name>\0<binary hash of the symbol name>
+ */
+#define SYMHASH_PREFIX		"sha256"
+#define SYMHASH_PREFIX_LEN	sizeof(SYMHASH_PREFIX) /* includes \0 */
+#define SYMHASH_LEN		(SYMHASH_PREFIX_LEN + SHA256_DIGEST_SIZE)
+
+static void symhash(const char *name, size_t len, u8 hash[SYMHASH_LEN])
+{
+	memcpy(hash, SYMHASH_PREFIX, SYMHASH_PREFIX_LEN);
+	sha256(name, len, &hash[SYMHASH_PREFIX_LEN]);
+}
+
+static int symcmp(const char *version_name, const char *name, size_t len,
+		  const u8 *hash)
+{
+	BUILD_BUG_ON(SYMHASH_LEN > MODULE_NAME_LEN);
+
+	if (len >= MODULE_NAME_LEN)
+		return memcmp(version_name, hash, SYMHASH_LEN);
+
+	return strcmp(version_name, name);
+}
+
 int check_version(const struct load_info *info,
 		  const char *symname,
 			 struct module *mod,
@@ -19,6 +47,8 @@ int check_version(const struct load_info *info,
 	unsigned int versindex = info->index.vers;
 	unsigned int i, num_versions;
 	struct modversion_info *versions;
+	u8 hash[SYMHASH_LEN];
+	size_t len;
 
 	/* Exporting module didn't supply crcs?  OK, we're already tainted. */
 	if (!crc)
@@ -32,10 +62,16 @@ int check_version(const struct load_info *info,
 	num_versions = sechdrs[versindex].sh_size
 		/ sizeof(struct modversion_info);
 
+	len = strlen(symname);
+
+	/* For symbols with a long name, use the hash format. */
+	if (len >= MODULE_NAME_LEN)
+		symhash(symname, len, hash);
+
 	for (i = 0; i < num_versions; i++) {
 		u32 crcval;
 
-		if (strcmp(versions[i].name, symname) != 0)
+		if (symcmp(versions[i].name, symname, len, hash) != 0)
 			continue;
 
 		crcval = *crc;
-- 
2.45.2.627.g7a2c4fd464-goog


