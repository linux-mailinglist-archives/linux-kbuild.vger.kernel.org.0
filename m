Return-Path: <linux-kbuild+bounces-2161-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F6C90B8B0
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 19:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B363B23871
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2024 17:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A878D197A89;
	Mon, 17 Jun 2024 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eitwI3sh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA361957F4
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718647113; cv=none; b=oA0sQcO4dN1/Kh0SmLMcuab+PUX687Z3N6MmrjTwHqm4XKhDC564Xm0/JCYaEvJLwX/7Maq26GwNRRbsNCHB+JP7Mf4X0y7XLjJOcCrHGrtQIvaJVk3KJoglvPDVF9wLNB9V+UplfgPtSTfYv7gb3ADVxhjMGZzCwWzqo4ZuPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718647113; c=relaxed/simple;
	bh=fbwuwqk6CBs6GxSLKW1YVstmYpQxC2PKUQTmM9ZWc3Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PCn2DPxSoXaic7B8kIm3UJjW0pXRgRtRJLjmzf8HG1cNJDLkA1e16DzAkUiHzDo0YSGZ1R7QIsI8ksc+ArCg5TZkve3pU6JY3VlO08itKKC/NxLKq5K6Cv6qtZifmxmJSZxfP+LHujWLzxxnSgdX7PTp+oHkTLZFX76oVWWJZBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eitwI3sh; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1f711de167eso43552985ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2024 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718647111; x=1719251911; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yQQ8muIrU64lKPhl98I11AYavN8wWVSXjeR/8aXPik=;
        b=eitwI3shRewtdSV6/OF5GwOcnTvODTfhuF+nekKiz05AEq02eCLZsFsxcZa6Y2rNO5
         gcQL7EvbvcGssNj74GADc1ZiVs2/jrOEveU8Ymcqv0/a0Ld/P6Dei2QkrXcLqNfgbq7F
         bJdjILsBGVdLjzbiYgNPyrAF/4GYE7MBmv10OF2/kkvaxczp4/BcHsPjtJrl/gL/ez4z
         HfSqvprY6qw9rpGZYdatZ1sGagPBsWemO4ThuGcc7vgwEESzDmcuS4KerXcztAqgtyW6
         EXpBX1tWfA1MQdmuk0X6Qgi3M0hOziSyzXM8fT4Ic1+Z743BuGT9d0DbaJ+vqhoWWXB4
         GCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718647111; x=1719251911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yQQ8muIrU64lKPhl98I11AYavN8wWVSXjeR/8aXPik=;
        b=FrR3cQfoosDbgJu3GXI37xO+i5ysivjCUcacFxoWPqIWWPnOaanMiPNyMKnv0jmB5d
         J+PGQV7EIyZ9AzR1mEu6fvXLbDK7v7HGoa+9gt9ZNbht0fhsoMta1x1CPeHVb1MeJryY
         EJw9DZux8n4ggrw4jJJRv2IgFk7xTpros0J0q/nh6bDqKTwSFKVPeM47+ZUQr5b/Fvr6
         gmwzBvAEU5bEyP3H9DJdW3jkE8prsnhyh02NxTpDhuv4XjHFtG75g8eJFXs/tm/tBYI0
         zigEL09iXX5sAGJ0XDUIqyh2R3+4TjCWY7PG4DXPlrL/vSdHwlFetyB6NKQLi0wxTCSe
         qkVA==
X-Forwarded-Encrypted: i=1; AJvYcCXANKGVPfe+J+Oalz1pwotUIKBugq2V9wXtLb5UEuBSSV5Skqv/TTNEDHPsYa7mdFpQ9/+9j0De6Vk0EO75WYsMQbeeqW5B1aQQZVMq
X-Gm-Message-State: AOJu0Ywy8dbBpUHB1YXKSV5KQl1/D4uYS1s6aPuXMLV51ca30sIVlomY
	QhiVdS+GssF1MiRS39ysrGdvVxYNM3GG2ePD6PKA3tS9vZWkdaHt2kDoes5efjQRxZWuMN0UfMu
	UmUaUxYkoQvRZBlQb4ASmrZnxIA==
X-Google-Smtp-Source: AGHT+IFK8KoS179LjP4Kh2WPYtoL4z47JnrJOp2742SzH3XkeLnWMFebk1mDJfKA5lS/HKcLScCvGfD9qICWKoeLaJY=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:187:b0:1f6:5631:4eb4 with
 SMTP id d9443c01a7336-1f862806058mr4168515ad.10.1718647111118; Mon, 17 Jun
 2024 10:58:31 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:58:22 +0000
In-Reply-To: <20240617175818.58219-17-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=13960; i=samitolvanen@google.com;
 h=from:subject; bh=fbwuwqk6CBs6GxSLKW1YVstmYpQxC2PKUQTmM9ZWc3Y=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmcHk6W7swSMlMXEfHHZ4lDet9yNrknEg65M0/F
 kJ95lvbatGJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZnB5OgAKCRBMtfaEi7xW
 7o2RDACryqWKB0s4mkpnv7sidxnwYF/2IZ7pM9CR+UnhHvbTmVWJWEz/vxUw7ewA/CVqHM7yEfH
 0xju2BYdvgQyJCw7Z+QbKtQXw6wfzJZVmjZQfDR2g19sv4OAxVjB8uY6QiC6veeyHbA9zeELh/n
 SNLvcrgEjjkEjGuyFETAomolBAGnPfbm8wBsApAPs5qUiYBslRZ6+AVeNlxqD2tetw88zxn0KGC
 H1ihgqDx452proTcjdmQZ6YRIfOan6lpNx4sQ2o1hnaYkDNVe2Yw2YFeJJFqSml3zfC1CK5elma
 RZaZ45QdCNFGuYJfmuolIhZiY1OH5Ur+oP7yF13xWAIphvOYSBAfwtuvu4RdN+iI8qK/FVzxkOn
 QCA9xh29HUjiH+Ef2DncDSwbeB47+W9PLR3Aw9EwVRkMvZirfYig7pVP6yZcpC4JqvAlSiOPdgD 1GMr38SUX0Nsn3ojyyAsUWkrgzcbp1pgsvsbzHZbdYTJRcEzQE4rrLVV3CR6tiESWI2co=
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Message-ID: <20240617175818.58219-20-samitolvanen@google.com>
Subject: [PATCH 03/15] gendwarfksyms: Add CRC calculation
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a basic CRC32 implementation adapted from genksyms, and produce
matching output from type strings.

Example usage:

  $ nm -p --defined-only rust/alloc.o | \
      awk '/ (T|R|D) / {printf "%s %s\n",$1, $3}' | \
      tools/gendwarfksyms/gendwarfksyms rust/alloc.o

Output:

  #SYMVER _RNvNvMs_NtCscg2doA4GLaz_5alloc3vecINtB6_3VecppE11swap_remove13assert_failed 0x985f94dd
  #SYMVER _RNvXs1_NtCscg2doA4GLaz_5alloc11collectionsNtB5_15TryReserveErrorNtNtCs5QSdWC790r4_4core3fmt7Display3fmt 0x985f94dd
  #SYMVER _RNvNvMs_NtCscg2doA4GLaz_5alloc3vecINtB6_3VecppE6remove13assert_failed 0x985f94dd
  ...

Note that type strings are not yet expanded, so the CRCs can only
distinguish between functions and variables for now.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 tools/gendwarfksyms/Build           |  1 +
 tools/gendwarfksyms/crc32.c         | 69 ++++++++++++++++++++++++++++
 tools/gendwarfksyms/crc32.h         | 34 ++++++++++++++
 tools/gendwarfksyms/gendwarfksyms.c |  1 +
 tools/gendwarfksyms/gendwarfksyms.h |  6 +++
 tools/gendwarfksyms/symbols.c       | 71 +++++++++++++++++++++++++++--
 tools/gendwarfksyms/types.c         | 19 ++++++--
 7 files changed, 194 insertions(+), 7 deletions(-)
 create mode 100644 tools/gendwarfksyms/crc32.c
 create mode 100644 tools/gendwarfksyms/crc32.h

diff --git a/tools/gendwarfksyms/Build b/tools/gendwarfksyms/Build
index a83c59bfef8b..518642c9b9de 100644
--- a/tools/gendwarfksyms/Build
+++ b/tools/gendwarfksyms/Build
@@ -1,3 +1,4 @@
 gendwarfksyms-y += gendwarfksyms.o
+gendwarfksyms-y += crc32.o
 gendwarfksyms-y += symbols.o
 gendwarfksyms-y += types.o
diff --git a/tools/gendwarfksyms/crc32.c b/tools/gendwarfksyms/crc32.c
new file mode 100644
index 000000000000..23b328cd74f2
--- /dev/null
+++ b/tools/gendwarfksyms/crc32.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Based on scripts/genksyms/genksyms.c, which has the following
+ * notice:
+ *
+ * Generate kernel symbol version hashes.
+ * Copyright 1996, 1997 Linux International.
+ *
+ * New implementation contributed by Richard Henderson <rth@tamu.edu>
+ * Based on original work by Bjorn Ekwall <bj0rn@blox.se>
+ *
+ * This file was part of the Linux modutils 2.4.22: moved back into the
+ * kernel sources by Rusty Russell/Kai Germaschewski.
+ */
+
+const unsigned int crctab32[] = {
+	0x00000000U, 0x77073096U, 0xee0e612cU, 0x990951baU, 0x076dc419U,
+	0x706af48fU, 0xe963a535U, 0x9e6495a3U, 0x0edb8832U, 0x79dcb8a4U,
+	0xe0d5e91eU, 0x97d2d988U, 0x09b64c2bU, 0x7eb17cbdU, 0xe7b82d07U,
+	0x90bf1d91U, 0x1db71064U, 0x6ab020f2U, 0xf3b97148U, 0x84be41deU,
+	0x1adad47dU, 0x6ddde4ebU, 0xf4d4b551U, 0x83d385c7U, 0x136c9856U,
+	0x646ba8c0U, 0xfd62f97aU, 0x8a65c9ecU, 0x14015c4fU, 0x63066cd9U,
+	0xfa0f3d63U, 0x8d080df5U, 0x3b6e20c8U, 0x4c69105eU, 0xd56041e4U,
+	0xa2677172U, 0x3c03e4d1U, 0x4b04d447U, 0xd20d85fdU, 0xa50ab56bU,
+	0x35b5a8faU, 0x42b2986cU, 0xdbbbc9d6U, 0xacbcf940U, 0x32d86ce3U,
+	0x45df5c75U, 0xdcd60dcfU, 0xabd13d59U, 0x26d930acU, 0x51de003aU,
+	0xc8d75180U, 0xbfd06116U, 0x21b4f4b5U, 0x56b3c423U, 0xcfba9599U,
+	0xb8bda50fU, 0x2802b89eU, 0x5f058808U, 0xc60cd9b2U, 0xb10be924U,
+	0x2f6f7c87U, 0x58684c11U, 0xc1611dabU, 0xb6662d3dU, 0x76dc4190U,
+	0x01db7106U, 0x98d220bcU, 0xefd5102aU, 0x71b18589U, 0x06b6b51fU,
+	0x9fbfe4a5U, 0xe8b8d433U, 0x7807c9a2U, 0x0f00f934U, 0x9609a88eU,
+	0xe10e9818U, 0x7f6a0dbbU, 0x086d3d2dU, 0x91646c97U, 0xe6635c01U,
+	0x6b6b51f4U, 0x1c6c6162U, 0x856530d8U, 0xf262004eU, 0x6c0695edU,
+	0x1b01a57bU, 0x8208f4c1U, 0xf50fc457U, 0x65b0d9c6U, 0x12b7e950U,
+	0x8bbeb8eaU, 0xfcb9887cU, 0x62dd1ddfU, 0x15da2d49U, 0x8cd37cf3U,
+	0xfbd44c65U, 0x4db26158U, 0x3ab551ceU, 0xa3bc0074U, 0xd4bb30e2U,
+	0x4adfa541U, 0x3dd895d7U, 0xa4d1c46dU, 0xd3d6f4fbU, 0x4369e96aU,
+	0x346ed9fcU, 0xad678846U, 0xda60b8d0U, 0x44042d73U, 0x33031de5U,
+	0xaa0a4c5fU, 0xdd0d7cc9U, 0x5005713cU, 0x270241aaU, 0xbe0b1010U,
+	0xc90c2086U, 0x5768b525U, 0x206f85b3U, 0xb966d409U, 0xce61e49fU,
+	0x5edef90eU, 0x29d9c998U, 0xb0d09822U, 0xc7d7a8b4U, 0x59b33d17U,
+	0x2eb40d81U, 0xb7bd5c3bU, 0xc0ba6cadU, 0xedb88320U, 0x9abfb3b6U,
+	0x03b6e20cU, 0x74b1d29aU, 0xead54739U, 0x9dd277afU, 0x04db2615U,
+	0x73dc1683U, 0xe3630b12U, 0x94643b84U, 0x0d6d6a3eU, 0x7a6a5aa8U,
+	0xe40ecf0bU, 0x9309ff9dU, 0x0a00ae27U, 0x7d079eb1U, 0xf00f9344U,
+	0x8708a3d2U, 0x1e01f268U, 0x6906c2feU, 0xf762575dU, 0x806567cbU,
+	0x196c3671U, 0x6e6b06e7U, 0xfed41b76U, 0x89d32be0U, 0x10da7a5aU,
+	0x67dd4accU, 0xf9b9df6fU, 0x8ebeeff9U, 0x17b7be43U, 0x60b08ed5U,
+	0xd6d6a3e8U, 0xa1d1937eU, 0x38d8c2c4U, 0x4fdff252U, 0xd1bb67f1U,
+	0xa6bc5767U, 0x3fb506ddU, 0x48b2364bU, 0xd80d2bdaU, 0xaf0a1b4cU,
+	0x36034af6U, 0x41047a60U, 0xdf60efc3U, 0xa867df55U, 0x316e8eefU,
+	0x4669be79U, 0xcb61b38cU, 0xbc66831aU, 0x256fd2a0U, 0x5268e236U,
+	0xcc0c7795U, 0xbb0b4703U, 0x220216b9U, 0x5505262fU, 0xc5ba3bbeU,
+	0xb2bd0b28U, 0x2bb45a92U, 0x5cb36a04U, 0xc2d7ffa7U, 0xb5d0cf31U,
+	0x2cd99e8bU, 0x5bdeae1dU, 0x9b64c2b0U, 0xec63f226U, 0x756aa39cU,
+	0x026d930aU, 0x9c0906a9U, 0xeb0e363fU, 0x72076785U, 0x05005713U,
+	0x95bf4a82U, 0xe2b87a14U, 0x7bb12baeU, 0x0cb61b38U, 0x92d28e9bU,
+	0xe5d5be0dU, 0x7cdcefb7U, 0x0bdbdf21U, 0x86d3d2d4U, 0xf1d4e242U,
+	0x68ddb3f8U, 0x1fda836eU, 0x81be16cdU, 0xf6b9265bU, 0x6fb077e1U,
+	0x18b74777U, 0x88085ae6U, 0xff0f6a70U, 0x66063bcaU, 0x11010b5cU,
+	0x8f659effU, 0xf862ae69U, 0x616bffd3U, 0x166ccf45U, 0xa00ae278U,
+	0xd70dd2eeU, 0x4e048354U, 0x3903b3c2U, 0xa7672661U, 0xd06016f7U,
+	0x4969474dU, 0x3e6e77dbU, 0xaed16a4aU, 0xd9d65adcU, 0x40df0b66U,
+	0x37d83bf0U, 0xa9bcae53U, 0xdebb9ec5U, 0x47b2cf7fU, 0x30b5ffe9U,
+	0xbdbdf21cU, 0xcabac28aU, 0x53b39330U, 0x24b4a3a6U, 0xbad03605U,
+	0xcdd70693U, 0x54de5729U, 0x23d967bfU, 0xb3667a2eU, 0xc4614ab8U,
+	0x5d681b02U, 0x2a6f2b94U, 0xb40bbe37U, 0xc30c8ea1U, 0x5a05df1bU,
+	0x2d02ef8dU
+};
diff --git a/tools/gendwarfksyms/crc32.h b/tools/gendwarfksyms/crc32.h
new file mode 100644
index 000000000000..89e4454b2a70
--- /dev/null
+++ b/tools/gendwarfksyms/crc32.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Based on scripts/genksyms/genksyms.c, which has the following
+ * notice:
+ *
+ * Generate kernel symbol version hashes.
+ * Copyright 1996, 1997 Linux International.
+ *
+ * New implementation contributed by Richard Henderson <rth@tamu.edu>
+ * Based on original work by Bjorn Ekwall <bj0rn@blox.se>
+ *
+ * This file was part of the Linux modutils 2.4.22: moved back into the
+ * kernel sources by Rusty Russell/Kai Germaschewski.
+ */
+
+#ifndef __CRC32_H
+#define __CRC32_H
+
+extern const unsigned int crctab32[];
+
+static inline unsigned long partial_crc32_one(unsigned char c,
+					      unsigned long crc)
+{
+	return crctab32[(crc ^ c) & 0xff] ^ (crc >> 8);
+}
+
+static inline unsigned long partial_crc32(const char *s, unsigned long crc)
+{
+	while (*s)
+		crc = partial_crc32_one(*s++, crc);
+	return crc;
+}
+
+#endif /* __CRC32_H */
diff --git a/tools/gendwarfksyms/gendwarfksyms.c b/tools/gendwarfksyms/gendwarfksyms.c
index 4a1bd9239182..7938b7440674 100644
--- a/tools/gendwarfksyms/gendwarfksyms.c
+++ b/tools/gendwarfksyms/gendwarfksyms.c
@@ -125,6 +125,7 @@ int main(int argc, const char **argv)
 	}
 
 	dwfl_end(dwfl);
+	symbol_print_versions();
 
 	return 0;
 }
diff --git a/tools/gendwarfksyms/gendwarfksyms.h b/tools/gendwarfksyms/gendwarfksyms.h
index b77855cc94a7..7440f1c73500 100644
--- a/tools/gendwarfksyms/gendwarfksyms.h
+++ b/tools/gendwarfksyms/gendwarfksyms.h
@@ -52,17 +52,22 @@ extern bool debug;
 /*
  * symbols.c
  */
+enum symbol_state { UNPROCESSED, PROCESSED_ADDR, PROCESSED_NAME };
 
 /* Exported symbol -- matching either the name or the address */
 struct symbol {
 	const char *name;
 	uintptr_t addr;
+	enum symbol_state state;
+	unsigned long crc;
 	struct hlist_node addr_hash;
 	struct hlist_node name_hash;
 };
 
+extern int symbol_set_crc(struct symbol *sym, unsigned long crc);
 extern int symbol_read_list(FILE *file);
 extern struct symbol *symbol_get(uintptr_t addr, const char *name);
+extern void symbol_print_versions(void);
 
 /*
  * types.c
@@ -73,6 +78,7 @@ struct state {
 	Dwarf *dbg;
 	struct symbol *sym;
 	Dwarf_Die origin;
+	unsigned long crc;
 };
 
 typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
diff --git a/tools/gendwarfksyms/symbols.c b/tools/gendwarfksyms/symbols.c
index 2cae61bcede7..71029635fc83 100644
--- a/tools/gendwarfksyms/symbols.c
+++ b/tools/gendwarfksyms/symbols.c
@@ -18,7 +18,8 @@ static u32 name_hash(const char *name)
 }
 
 /* symbol_for_each callback -- return true to stop, false to continue */
-typedef bool (*symbol_callback_t)(struct symbol *, void *arg);
+typedef bool (*symbol_callback_t)(struct symbol *, enum symbol_state type,
+				  void *arg);
 
 static bool for_each_addr(uintptr_t addr, symbol_callback_t func, void *data)
 {
@@ -30,7 +31,7 @@ static bool for_each_addr(uintptr_t addr, symbol_callback_t func, void *data)
 
 	hash_for_each_possible(symbol_addrs, sym, addr_hash, addr) {
 		if (sym->addr == addr) {
-			if (func(sym, data))
+			if (func(sym, PROCESSED_ADDR, data))
 				return true;
 			found = true;
 		}
@@ -49,7 +50,7 @@ static bool for_each_name(const char *name, symbol_callback_t func, void *data)
 
 	hash_for_each_possible(symbol_names, sym, name_hash, name_hash(name)) {
 		if (!strcmp(sym->name, name)) {
-			if (func(sym, data))
+			if (func(sym, PROCESSED_NAME, data))
 				return true;
 			found = true;
 		}
@@ -71,6 +72,45 @@ static bool for_each(uintptr_t addr, const char *name, symbol_callback_t func,
 	return found;
 }
 
+static bool set_crc(struct symbol *sym, enum symbol_state type, void *data)
+{
+	unsigned long *crc = data;
+
+	/* Prefer an address match if found, otherwise match by name. */
+	if (type == PROCESSED_ADDR) {
+		if (sym->state == PROCESSED_ADDR) {
+			warn("symbol %s (@ %lx) already matched by address (crc %lx vs. %lx)",
+			     sym->name, sym->addr, sym->crc, *crc);
+			return false;
+		}
+		if (sym->state == PROCESSED_NAME && sym->crc != *crc)
+			debug("symbol %s (@ %lx) overriding name match (crc %lx vs. %lx)",
+			      sym->name, sym->addr, sym->crc, *crc);
+	} else if (type == PROCESSED_NAME) {
+		if (sym->state == PROCESSED_ADDR) {
+			if (sym->crc != *crc)
+				debug("symbol %s (@ %lx) ignoring name match (crc %lx vs. %lx)",
+				      sym->name, sym->addr, sym->crc, *crc);
+			return false;
+		}
+		if (sym->state == PROCESSED_NAME) {
+			warn("symbol %s (@ %lx) already matched by name (crc %lx vs. %lx)",
+			     sym->name, sym->addr, sym->crc, *crc);
+			return false;
+		}
+	}
+
+	sym->state = type;
+	sym->crc = *crc;
+
+	return false; /* Continue */
+}
+
+int symbol_set_crc(struct symbol *sym, unsigned long crc)
+{
+	return for_each(sym->addr, sym->name, set_crc, &crc) ? 0 : -1;
+}
+
 int symbol_read_list(FILE *file)
 {
 	struct symbol *sym;
@@ -99,6 +139,8 @@ int symbol_read_list(FILE *file)
 
 		sym->addr = (uintptr_t)addr;
 		sym->name = name;
+		sym->state = UNPROCESSED;
+		sym->crc = 0;
 		name = NULL;
 
 		hash_add(symbol_addrs, &sym->addr_hash, sym->addr);
@@ -111,7 +153,7 @@ int symbol_read_list(FILE *file)
 	return 0;
 }
 
-static bool return_symbol(struct symbol *sym, void *arg)
+static bool return_symbol(struct symbol *sym, enum symbol_state type, void *arg)
 {
 	struct symbol **res = (struct symbol **)arg;
 
@@ -128,3 +170,24 @@ struct symbol *symbol_get(uintptr_t addr, const char *name)
 
 	return NULL;
 }
+
+void symbol_print_versions(void)
+{
+	struct hlist_node *tmp;
+	struct symbol *sym;
+	int i;
+
+	hash_for_each_safe(symbol_addrs, i, tmp, sym, addr_hash) {
+		if (sym->state == UNPROCESSED)
+			warn("no information for symbol %s (@ %lx)", sym->name,
+			     sym->addr);
+
+		printf("#SYMVER %s 0x%08lx\n", sym->name, sym->crc);
+
+		free((void *)sym->name);
+		free(sym);
+	}
+
+	hash_init(symbol_addrs);
+	hash_init(symbol_names);
+}
diff --git a/tools/gendwarfksyms/types.c b/tools/gendwarfksyms/types.c
index f1ce7bfcf510..47ae967d42ee 100644
--- a/tools/gendwarfksyms/types.c
+++ b/tools/gendwarfksyms/types.c
@@ -4,6 +4,7 @@
  */
 
 #include "gendwarfksyms.h"
+#include "crc32.h"
 
 #define DEFINE_GET_ATTR(attr, type)                                    \
 	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
@@ -68,7 +69,7 @@ static Dwarf_Die *get_exported(struct state *state, Dwarf_Die *die)
 }
 
 /*
- * Type string processing
+ * Type string and CRC processing
  */
 static int process(struct state *state, const char *s)
 {
@@ -77,6 +78,7 @@ static int process(struct state *state, const char *s)
 	if (debug)
 		fputs(s, stderr);
 
+	state->crc = partial_crc32(s, state->crc);
 	return 0;
 }
 
@@ -101,6 +103,11 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	return 0;
 }
 
+static void state_init(struct state *state)
+{
+	state->crc = 0xffffffff;
+}
+
 /*
  * Exported symbol processing
  */
@@ -130,17 +137,23 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
 	case DW_TAG_subprogram:
 	case DW_TAG_variable:
 		die = get_exported(state, die);
-		if (!die || !state->sym)
+		if (!die || !state->sym || state->sym->state != UNPROCESSED)
 			return 0;
 
+		/*
+		 * For each exported symbol, compute a CRC of the expanded type
+		 * description.
+		 */
 		debug("%s (@ %lx)", state->sym->name, state->sym->addr);
+		state_init(state);
 
 		if (tag == DW_TAG_subprogram)
 			check(process_subprogram(state, die));
 		else
 			check(process_variable(state, die));
 
-		return 0;
+		return check(
+			symbol_set_crc(state->sym, state->crc ^ 0xffffffff));
 	default:
 		return 0;
 	}
-- 
2.45.2.627.g7a2c4fd464-goog


