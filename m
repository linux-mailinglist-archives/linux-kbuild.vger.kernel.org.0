Return-Path: <linux-kbuild+bounces-5528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ED9A187AE
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 23:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA16B3AAC3C
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 22:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194BE1F8921;
	Tue, 21 Jan 2025 22:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tarpvpuv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C831F5413
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2025 22:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737497783; cv=none; b=NWsUrDr0qv50WBOsRPbtUZkWpKC3ebipqa/R8Z44ml9IIwcK2HsR/cwa3/AkrAZJ35NsfCk/kXSVv7Vh6x7LwFM8iARQHFUZCMSmy7E3bmTIjmFIJotcL68LjTR0LaZmTABHCTuIByBODIgVpwRxFumHbtv3YI2aN6Qmpw8Qyt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737497783; c=relaxed/simple;
	bh=kuS9+usQUnoAJ7h3I+IY6V/rxzIi2s09XeV3LdJfMj4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JFQJsudraHODrvYwxKiLAsCUlCVwLQKfq4W2Tly8S9tPYn+0g0UwNQI1mlB5FPboqqZtU0E9X2wU8VJ9FTvW04RKMHDWBLN1Pw2cMQ/u7LA1LkpRIkUarFVZVT2EGPiyoaGxqJNCzknMHuC3QXblaeV+P2goE/4Raa3CfGpzzWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tarpvpuv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-435b0df5dbdso20255e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2025 14:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737497778; x=1738102578; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mzmBoQbCE7e2VTnHw9DXW5AVmYWzyx5m18uEgeNFLzY=;
        b=tarpvpuv4xiueR/p14iFdvyCevj49Rp8T0tQQfGoeZkDzqCEyza1FVCdTBTx5PBgeA
         7l2xqUS0ip+1maRwuXsaesTmiMrQDFaLkLHh1ZKemY9usfk34BqMXhR4spAXBNcXcVwZ
         5ya+5j5QdhECcdeBmGDqx+m63KRgKJkBzyrM7xRgpSCq8ppsQzd01da1gSNQTrMIpMAl
         VnMOUtpcqfnmm8RKOJ4womfftEzGZERRNIJWvqzLfSkiLuNZs32rug1eA82oNXGjSqLC
         EN6bSk/40/e1MRfZcNzQ7S/RPRHjKa1ICSBLovLGsXg6TAS+/wNeJbGJpRwRqPYBHlBb
         iczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737497778; x=1738102578;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzmBoQbCE7e2VTnHw9DXW5AVmYWzyx5m18uEgeNFLzY=;
        b=FSUZSy4FUTatmYF7BgNUR2lTjtdYgGfTTmbGyZnQZk6bO0PVVk/de7OGY/v59gKlN7
         XjsqmwqOPNpVCWjjssVV5EFHb6zKBpt1zA6zuv2uf6ot7KMfMcyqni7MV/lMljxyRpoV
         b4pzj718n1qi+Y1AN7g1pVM/fZHAaRiNiOOSP6m6hraXnVWEn/vTsVS4LVICuO7eiR7k
         siPY84xRdGIqw2Joq5s2ZfEadkQ7wqXrJIGU8HP/z0tDXk5T9O47Exjzub0Er1Xy6or0
         MMWWXicr+7bOJS3wMPmTjr8qvowjhiALmMr1wEz4KCIl/6qzio+DpUuvTVcyTNVgamjw
         hvZg==
X-Forwarded-Encrypted: i=1; AJvYcCWJbdMIHshGjuaH/40if1/2HkEYRHYPqXNZHRKk5OwCxl+tIhAzX25QoO8WxZzWSA/69XZ+V3cXmhjA+2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXSv/twAnVllOZwBsrm6OhCCcYM89RyTJ86mA8sbC6ti9m/Yby
	qx6J9//hb+gzs/lznwSA6xVDav/qMRAWLRMv1iMfw2vn5Nna3YBUaWG4yEz2hw==
X-Gm-Gg: ASbGncvt3X2TX9DHTSUBHhBwnyeTM0R1C81Jq1zkF/N30o9AuIbskG5h0HbXJLjM8Jj
	hOHmgG5aglYc+B6UskafSIb4Iv+c59ASjBdBN9owiIeXgnZxJEdE0xKAlUle1QaaS1wK2hgN6ZW
	hWKa5HD/ZBfyFIYSR3bUd90Zh6GT4UXpJgy8JM8A+EWrPSXbzNOqh3Qg7ptlIU/frS+7CaV9avY
	ctOdGrzt5Nr0rRJ+7HuOYkvL3+TAzrcJzz9Sh/RjRvlHg2rq+x57ruqM18=
X-Google-Smtp-Source: AGHT+IEqPNSzuNcGCyt683L4AIyW1+5qRuiQlVD9dVHlSQohAlvQuzg66TxKiMMiLwQ9SGS4xTcpSQ==
X-Received: by 2002:a05:600c:4f0d:b0:435:921b:3535 with SMTP id 5b1f17b1804b1-438b2da754fmr74955e9.3.1737497777602;
        Tue, 21 Jan 2025 14:16:17 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:93eb:28f6:6b52:a48e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318aae1sm274245e9.1.2025.01.21.14.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 14:16:17 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Tue, 21 Jan 2025 23:16:09 +0100
Subject: [PATCH RFC] x86: Add CONFIG_KERNEL_UNCOMPRESSED support
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-kernel-compress-fast-v1-1-fa693b6167d4@google.com>
X-B4-Tracking: v=1; b=H4sIAKgckGcC/x2MMQqAMAwAvyKZDbSVgrgKPsBVHKRGDWqVRkSQ/
 t3ieBx3LwgFJoEqeyHQzcKHT6DzDNwy+JmQx8RglLFKG40rBU8bumM/A4ngNMiFhVWObKm0MyW
 kNKmJn3/bQdvU0Mf4AVU57VBrAAAA
X-Change-ID: 20250121-kernel-compress-fast-350ce5801c28
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-efi@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737497773; l=5794;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=kuS9+usQUnoAJ7h3I+IY6V/rxzIi2s09XeV3LdJfMj4=;
 b=vFk+qsZp8iDibxHFL/PkhT2fOb37LGRH19Iyz9tA2NghkFd8EcF3616hnZCM3I52KXUPZrI3s
 Jo5gw+7fi1PBsepq8YqzxMUxrU4ZYo7v/qp55xb5Z4kegUMb2Sy/6uF
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Support storing the kernel uncompressed for developers who want to quickly
iterate with one-off kernel builds.
Store it in the usual format with a 4-byte length suffix and keep this new
codepath as close as possible to the normal path where decompression
happens.

The other compression methods offered by the kernel take some time;
even LZ4 (which the kernel uses at compression level 9) takes ~2.8
seconds to compress a 110M large vmlinux.bin on my machine.

An alternate approach to this would be to offer customization of the LZ4
compression level through a kconfig variable; and yet another approach
would be to abuse the existing gzip decompression logic by storing the
kernel as "non-compressed" DEFLATE blocks, so that the decompression code
will essentially end up just doing a bunch of memcpy() calls.

Signed-off-by: Jann Horn <jannh@google.com>
---
 arch/x86/Kconfig                     |  1 +
 arch/x86/boot/compressed/Makefile    |  3 +++
 arch/x86/boot/compressed/misc.c      |  4 ++++
 arch/x86/boot/header.S               |  2 ++
 drivers/firmware/efi/libstub/zboot.c |  2 ++
 lib/decompress_dummy.c               | 15 +++++++++++++++
 scripts/Makefile.lib                 |  3 +++
 7 files changed, 30 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index ef6cfea9df7333c52e331f487a0b29f037a6bf14..6d468d47861ae0b6ec6b7649af6ab4dd123eb5c8 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -250,6 +250,7 @@ config X86
 	select HAVE_KERNEL_LZO
 	select HAVE_KERNEL_XZ
 	select HAVE_KERNEL_ZSTD
+	select HAVE_KERNEL_UNCOMPRESSED
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_FUNCTION_ERROR_INJECTION
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index f2051644de9432e3466ac0ef1c4d3abc378e37d3..06079e02d9e01704cc0da06c1195854c8d0602ac 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -137,6 +137,8 @@ $(obj)/vmlinux.bin.lz4: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,lz4_with_size)
 $(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
 	$(call if_changed,zstd22_with_size)
+$(obj)/vmlinux.bin.store: $(vmlinux.bin.all-y) FORCE
+	$(call if_changed,store_with_size)
 
 suffix-$(CONFIG_KERNEL_GZIP)	:= gz
 suffix-$(CONFIG_KERNEL_BZIP2)	:= bz2
@@ -145,6 +147,7 @@ suffix-$(CONFIG_KERNEL_XZ)	:= xz
 suffix-$(CONFIG_KERNEL_LZO) 	:= lzo
 suffix-$(CONFIG_KERNEL_LZ4) 	:= lz4
 suffix-$(CONFIG_KERNEL_ZSTD)	:= zst
+suffix-$(CONFIG_KERNEL_UNCOMPRESSED)	:= store
 
 quiet_cmd_mkpiggy = MKPIGGY $@
       cmd_mkpiggy = $(obj)/mkpiggy $< > $@
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 0d37420cad0259554f8160dea0c502cb7e2fc6cd..5d514a147d5d1ae252419e4c7cdc09e9c29f110f 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -88,6 +88,10 @@ static int cols __section(".data");
 #ifdef CONFIG_KERNEL_ZSTD
 #include "../../../../lib/decompress_unzstd.c"
 #endif
+
+#ifdef CONFIG_KERNEL_UNCOMPRESSED
+#include "../../../../lib/decompress_dummy.c"
+#endif
 /*
  * NOTE: When adding a new decompressor, please update the analysis in
  * ../header.S.
diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index b5c79f43359bcde2c4c3c5ed796e8780f7979774..8397470231cf571a33ac75f7ca7020608e170eef 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -483,6 +483,8 @@ pref_address:		.quad LOAD_PHYSICAL_ADDR	# preferred load addr
 # larger margin.
 #
 # extra_bytes = (uncompressed_size >> 8) + 131072
+#
+# Uncompressed data does not grow.
 
 #define ZO_z_extra_bytes	((ZO_z_output_len >> 8) + 131072)
 #if ZO_z_output_len > ZO_z_input_len
diff --git a/drivers/firmware/efi/libstub/zboot.c b/drivers/firmware/efi/libstub/zboot.c
index af23b3c502282f9bd644c38af445875c225cdf42..1c43a6ae5e665aa3bff3bd467c8a2f5525b1a6e9 100644
--- a/drivers/firmware/efi/libstub/zboot.c
+++ b/drivers/firmware/efi/libstub/zboot.c
@@ -27,6 +27,8 @@ static unsigned long free_mem_ptr, free_mem_end_ptr;
 #include "../../../../lib/decompress_unxz.c"
 #elif defined(CONFIG_KERNEL_ZSTD)
 #include "../../../../lib/decompress_unzstd.c"
+#elif defined(CONFIG_KERNEL_UNCOMPRESSED)
+#include "../../../../lib/decompress_dummy.c"
 #endif
 
 extern char efi_zboot_header[];
diff --git a/lib/decompress_dummy.c b/lib/decompress_dummy.c
new file mode 100644
index 0000000000000000000000000000000000000000..49435e199a07f6ed376ff93adeae8ee08a9dd3d7
--- /dev/null
+++ b/lib/decompress_dummy.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+STATIC int INIT __decompress(unsigned char *buf, long len,
+			   long (*fill)(void*, unsigned long),
+			   long (*flush)(void*, unsigned long),
+			   unsigned char *out_buf, long out_len,
+			   long *pos,
+			   void (*error)(char *x))
+{
+	if (out_len < len-4) {
+		error("output buffer too small");
+		return -1;
+	}
+	memcpy(out_buf, buf, len-4);
+	return 0;
+}
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7395200538da89a2f6e6d21f8959f3f60d291d79..bb8116ba8ba189d5246fcb0e71c7be6e05ce5148 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -525,6 +525,9 @@ quiet_cmd_zstd22 = ZSTD22  $@
 quiet_cmd_zstd22_with_size = ZSTD22  $@
       cmd_zstd22_with_size = { cat $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
 
+quiet_cmd_store_with_size = STORE  $@
+      cmd_store_with_size = { cat $(real-prereqs); $(size_append); } > $@
+
 # ASM offsets
 # ---------------------------------------------------------------------------
 

---
base-commit: 95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
change-id: 20250121-kernel-compress-fast-350ce5801c28

-- 
Jann Horn <jannh@google.com>


