Return-Path: <linux-kbuild+bounces-5537-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F24D1A194B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 16:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53AE73A2DB7
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2025 15:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8C32144C5;
	Wed, 22 Jan 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z69nkoYj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDF4213E86
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737558515; cv=none; b=rFxjxi+hmFukyxsZZljhKgFDaI9VGu6w0VBLEM84nfeXQwXv7gHcpHLv9F4B3XShaY+l2N1dSf63TqZC7eh+LvajlD7G+8LROP7L6XpudbSXIkBcxNzCt9V8zqXK8yDnyxNrzYby/qZIM3TF+nWeUXeRWegBFLmimT8Dy3j764Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737558515; c=relaxed/simple;
	bh=mIfO5g20giNMFSCDYRYLHmw19hM3qo1s5YSzi2gUcwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TkUiu+RuuMbmPV1WrjpPm0tTQQFODvFm796pL94LrLTY5U0yORBbNo19ZoLXwExDYOnYls24cUCJZt5vuV20zDRjve51piLHCjDvN/smROi8JImSTYDjAYC2L1wNns/mU/TS8al+5ORznZRgcFuxhUpF9Bl9GntaKyRlI9Pnfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z69nkoYj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso48355e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Jan 2025 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737558511; x=1738163311; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0RZIih7WjYi0hVEVuaKdNaj1BNZPWDicrzHWuuF5r8=;
        b=z69nkoYjjRNURjbSMpoy2vwK9NhS60IP98N4J7dbBRnYoMLAFBRETqLlbRE7X0kdhM
         f4OOL2Q6JeG+GHqOjNRfQjmmhwygqM+57SgTqGeutdOs1YMy+glsAuicv1MD14vWdUi5
         Zl24yqLAN8vM7s0aQZ+YDvRutYiLzpnxew80zc2UPNUEFys0iY8zoes0+6+1jeZ8TE4d
         JSNFTkoWv1N9XWGJnL4SuZ70iCeLfnHSf/Wgg/mRa+V3W9oaVqWffXGjDO0/isLBx+oZ
         zmYTfhH+z1CT8TtAQ1pRyr7IeICfsx2f3xXF1m2h9dc/oiI6lCAi6XxSAM8VQ/OuCGDI
         4BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737558511; x=1738163311;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0RZIih7WjYi0hVEVuaKdNaj1BNZPWDicrzHWuuF5r8=;
        b=hn7AYbTV9frWl6Uw9z2W8OU48QwNjwLrK8xKMjoWOi8tTVIaMXxJNZP5LQUPU3W/Pu
         bG72W7ZIs5U/VA5X1bi/5fDS0gon1ENwSdfAs/pSBxBbPs+QGhKPxtacZJ6m8UuH3tpX
         yqSuLKqnxt6KmAWX8uicC+G9AVa9ZeyMk83CTyK27PqzFfrILB+TkIhGvoQ0jzJVphUr
         65PO4LiRPHh6f/Irfoc8Ny0ianbfxpbtM2VUMHmXbLdDyfcSBJC0LRt77usSlEOtGmBb
         4CiX366szezLggJFoub2yOEDGJmTwWoS/1VgwOTNQT9+Q9QX2ILEgWLEcnkIQ7P0SSCM
         SfbA==
X-Forwarded-Encrypted: i=1; AJvYcCVDDhAm1wWHpOHIEhMnjO8W9XuVaJ21UkelaUP3AmhQcFlZXb24p9W7b9s6JgKrUIrho27h8G7zG8bRxXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZFS/iX/bfFnAGJdgTgTNp1Ter+N7y97ldjGsuNdP4+nIPCDi
	PqceslyxcdTA6qoJPa0BBQVbI7+hezdeoFZN6Cjs3BKdy8Xzb7Fizq176BKXCQ==
X-Gm-Gg: ASbGnctwpGmYF25GrwRLTunYjT3YFFNwM3Nt7uEndx6V9Lj3VDEEHrmWSmdgHRis32c
	UpU28HTbhaYili55mSsAflaOu4rMZwWwK9YWwRQBNpX9kFtBDt/+IBlIq+PUxQlXMULfgQ0a4q9
	jzuJAJmbp6oETqu050vZuAAFo/rOQHN7Avas6DU1QH3gxRa5B5X1GotUBzovUW8JFQr23j2qpp+
	aYM2n+/28XebrlHyTzK2kXzznM+/S/3oMVvOjzqV1+KmZx1XDTjrf9So4g=
X-Google-Smtp-Source: AGHT+IGvIq1YTotbrGriLyTyE1rH5IkBL9GKfK4t9P3PDG7MadYCY/MTsrLlbOQ/obSbQl5+UKcXbg==
X-Received: by 2002:a05:600c:314a:b0:42b:a961:e51 with SMTP id 5b1f17b1804b1-438b214a8afmr1350895e9.0.1737558510926;
        Wed, 22 Jan 2025 07:08:30 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:93eb:28f6:6b52:a48e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b7fsm16357689f8f.27.2025.01.22.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:08:30 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 22 Jan 2025 16:08:22 +0100
Subject: [PATCH v2] kbuild: Add CONFIG_LZ4_LEVEL for choosing compression
 level
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-kernel-compress-fast-v2-1-bde9d71b6b88@google.com>
X-B4-Tracking: v=1; b=H4sIAOUJkWcC/4WN0Q6CMAxFf4X02Zl1yESe/A/DA44Ci7iZlRAN2
 b9b+QHfenpvTzdgSp4YmmKDRKtnH4OAORTgpi6MpHwvDEabSqNB9aAUaFYuPl+JmNXQ8aLKSju
 qao3O1CCnEg3+vWtvrfDkeYnps39Z8bf9I1xRoUz2Ut4t2nN/uo4xjjMdpQZtzvkLHmS1rbkAA
 AA=
X-Change-ID: 20250121-kernel-compress-fast-350ce5801c28
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tor Vic <torvic9@mailbox.org>, 
 Ard Biesheuvel <ardb@kernel.org>, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737558507; l=3842;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=mIfO5g20giNMFSCDYRYLHmw19hM3qo1s5YSzi2gUcwY=;
 b=EHpqF2VeXIfOZeqvZneHZA7iA7vQOo+LruhqHrl3gAmPw8qY+VBvaLBKfQyCw8jt2fU2coZsW
 +wx8hrz5HgWBLP3c1I7DTUVUkUIxBaJ7a8U5Ll/kUxhsNN6tFtRl0sv
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Allow choosing the LZ4 compression level using the new config flag
CONFIG_LZ4_LEVEL.

This will allow developers who want to quickly iterate with one-off kernel
builds to speed up kernel compression at the cost of creating a larger
kernel image.

LZ4 at level 9 (which the kernel uses by default) takes ~2.8
seconds to compress a 110M large vmlinux.bin on my machine; LZ4 at level 1
just needs ~220ms wall clock time.

Signed-off-by: Jann Horn <jannh@google.com>
---
My patch provides kconfig for choosing compression level of LZ4; Tor Vic
mentioned using kconfig for choosing the compression level of ZSTD.

Does my current approach of having a kconfig option specifically for
LZ4 compression level look good (and we can add the same for ZSTD later
if necessary); or should there be a single kconfig option that sets a
compression level that is used across all compression algorithms?
I guess doing it separately for different algorithms makes more sense
because different compression levels might mean different things for
different algorithms?

Do I need to somehow make it explicit that cmd_lz4 and cmd_lz4_with_size
rely on CONFIG_LZ4_LEVEL, or does the build system figure that out on
its own somehow? Experimentally it seems like the build system triggers
a rebuild when the config option changes, but I'm not sure how that
actually works.
---
Changes in v2:
- removed x86/EFI subsystems from recipients since I'm no longer
  touching those
- rewrote patch to make LZ4 level configurable instead of offering
  uncompressed builds on x86 (Ard)
- Link to v1: https://lore.kernel.org/r/20250121-kernel-compress-fast-v1-1-fa693b6167d4@google.com
---
 init/Kconfig         | 16 ++++++++++++++++
 scripts/Makefile.lib |  4 ++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index a20e6efd3f0fbdd7f0df2448854cc30734a0ee4f..3fd93bbe98390997e7e2d41426241b90d3b33053 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -358,6 +358,9 @@ config KERNEL_LZ4
 	  is about 8% bigger than LZO. But the decompression speed is
 	  faster than LZO.
 
+	  If you are working on the kernel and recompiling frequently, you can
+	  adjust the compression level with CONFIG_LZ4_LEVEL.
+
 config KERNEL_ZSTD
 	bool "ZSTD"
 	depends on HAVE_KERNEL_ZSTD
@@ -380,6 +383,19 @@ config KERNEL_UNCOMPRESSED
 
 endchoice
 
+config LZ4_LEVEL
+	int "LZ4 compression level"
+	range 1 12
+	depends on KERNEL_LZ4
+	default 9
+	help
+	  This option controls the compression level used for LZ4 invocations,
+	  in particular for compressing the kernel image.
+
+	  If you are working on the kernel and recompiling frequently, you can
+	  set this to a low value like 1 to speed up kernel builds at the cost
+	  of using more disk space.
+
 config DEFAULT_INIT
 	string "Default init path"
 	default ""
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7395200538da89a2f6e6d21f8959f3f60d291d79..c3eedbc4acf133d5f9e7f13d637af09ad1968930 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -425,10 +425,10 @@ quiet_cmd_lzo_with_size = LZO     $@
       cmd_lzo_with_size = { cat $(real-prereqs) | $(KLZOP) -9; $(size_append); } > $@
 
 quiet_cmd_lz4 = LZ4     $@
-      cmd_lz4 = cat $(real-prereqs) | $(LZ4) -l -9 - - > $@
+      cmd_lz4 = cat $(real-prereqs) | $(LZ4) -l -$(CONFIG_LZ4_LEVEL) - - > $@
 
 quiet_cmd_lz4_with_size = LZ4     $@
-      cmd_lz4_with_size = { cat $(real-prereqs) | $(LZ4) -l -9 - -; \
+      cmd_lz4_with_size = { cat $(real-prereqs) | $(LZ4) -l -$(CONFIG_LZ4_LEVEL) - -; \
                   $(size_append); } > $@
 
 # U-Boot mkimage

---
base-commit: 95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
change-id: 20250121-kernel-compress-fast-350ce5801c28

-- 
Jann Horn <jannh@google.com>


