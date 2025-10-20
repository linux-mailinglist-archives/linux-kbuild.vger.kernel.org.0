Return-Path: <linux-kbuild+bounces-9219-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B73DBBF1D1D
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 16:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 89A314F63AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Oct 2025 14:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F0A322C8A;
	Mon, 20 Oct 2025 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="A3hzCIp6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F3320A14
	for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970158; cv=none; b=fY4+8mlbeX/XcCy97IE6Z6ytoJnzxCOlW4Y0l4v7CAOE06NBynuaODm9plj5iplT5i5ctXSl9GxpxQIUS9VYSrB0OTBEVq93xqPOyQKX2eReeDkbYrVAoBqHlW5GTHNa1FufiQveCu4RKrMAjQr7nUX3WctIpjFQz/HkNmR45V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970158; c=relaxed/simple;
	bh=zVDPi2NmZxQInX/GIfLgtCtgKG78R8OLu0rkid/eYv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zn+j6JPEYKlqb1Xrw1JzmpSAZpa3+XqAt99Vl69ndB8BU9t6Rlb6IiUY6r4Xl38LSIUjXmrb/2fMw1pyIwsnE8Qmj7orT8IXJTN/wF/iREw2s8xfNcMepJ+h3ZIj44WdzKhgLv8Pv+gFSRMwsiQCEwnjKpZ7vre3VZ0Hz3K1JlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=A3hzCIp6; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-363f137bbf8so39829551fa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Oct 2025 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1760970154; x=1761574954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxGnzL84bOBveKtOjo7P4XxhPFp2ZO6oIYqNAjS+rn0=;
        b=A3hzCIp6o83N/f1BHNdDEheVfppO+VUPyiwv2q/uJpXLKzkvhPYPRFaRaqayvGrVUU
         eCUrMWZN3frZ/C2vT0uh1T38MYyNcElVnvJlP6LazEWDcXD5Q8okypDsgrpquN6uQG45
         VyoPyAi4o7NLQOPUjeemgqhpJeNW+HtLKBmog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970154; x=1761574954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxGnzL84bOBveKtOjo7P4XxhPFp2ZO6oIYqNAjS+rn0=;
        b=L0id4u00YcOUgRJMfGoWV4tJdVoM1l6jLGifB71WHAP3dV3wl7Aeizb6YwP996Qka1
         Fh8+cNQVQKBlo3X/lu1MH7uDxD2zxgMQrV4/8+CPKipbEPDQmYj9Kpvet6LWda2fj0jk
         IorXAUVgM24evUIXNonHvMOOuPjbNCvrDkoPGTnhMCuC8rUV+S3fL8GYoSTY1Davsnv9
         3FRo9OmDqMVBiIH0ZGt5JwRgkH4ZNcsCaz+1nLacdbchcaNl0Gb1eTqRxVOzh5RAe0+7
         7hvt44OISVoXT/QD4PujOF+heDqyKFZwJY9GIuaWB2Qy8tbcgB57WdZiMURssd2tffS4
         Lr7w==
X-Forwarded-Encrypted: i=1; AJvYcCWiOTHBZltKOPFaJ/1dQZwbQhUKHfGRlmQ5Fl4dDD+sUY209j5VgT/UmOEq8mbLPWPyPVt0dKAOY9B7ksc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRx88AJ3aCIJljWrfIx7trWkOfT6f9zIyDTN48XWOn9aovjH+o
	jfzaTy8pkeOXZ/Tty8LtH/3y3/INnMqro0dEW8i/GFWUzf9f/tjhG8p3JOPgN+eRwIE=
X-Gm-Gg: ASbGncthsslOixYihIEsxrDG5BhoIl88S1BfxkFrKWgM85SfhVS07A9XyTY2y5z8OrV
	XkUj23bYll2GcEbkOEWWBrTPS711oM/Jfe1hmCVHrpHYc4Rsv9uKL1dzK9sZ2hQx85kLX31p1cM
	hlj0JoWbnHHMiBrhVPW3348Wqlp8T1H5STU++h/gHfqPJ3Kj1C51m1NTIh5RHpiTfSojaSB12k8
	ONcpkOKHZwqH5CQEgoNvRG0XKv/l3mB0/p5w/ZX71SeC20mWE+pghKC7KFzkIgJFq8jT/mmwIK4
	FhQiVPNAFYTzpcXLblSBDV/yWHkK1CsUtc8hAdvDE9pMIEsYgS6FbTPats390jvxLe2LvBFXsMO
	ZJ1wj+QZYlGiA/qvojrutTf/rAsnqwbf5VrFVOaER4r9Uc4o4jdp616obY4xtJAWtKVlW2IXWN9
	X3Qe18vBr0yURiWg==
X-Google-Smtp-Source: AGHT+IGb7T77vI29R8Q/U3A3JcdQs8FTAE7qJEZ47X10i86VYJPY3TK8jaZUwjb647q8hByJNP2BBQ==
X-Received: by 2002:a2e:bd86:0:b0:372:88fa:b680 with SMTP id 38308e7fff4ca-37797a3b322mr39705961fa.29.1760970154270;
        Mon, 20 Oct 2025 07:22:34 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a950cb1dsm20951171fa.35.2025.10.20.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:22:34 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	David Sterba <dsterba@suse.com>
Cc: linux-btrfs@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 2/2] btrfs: send: make use of -fms-extensions for defining struct fs_path
Date: Mon, 20 Oct 2025 16:22:28 +0200
Message-ID: <20251020142228.1819871-3-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020142228.1819871-1-linux@rasmusvillemoes.dk>
References: <20251020142228.1819871-1-linux@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The newly introduced -fms-extensions compiler flag allows defining
struct fs_path in such a way that inline_buf becomes a proper array
with a size known to the compiler.

This also makes the problem fixed by 8aec9dbf2db2 ("btrfs: send: fix
-Wflex-array-member-not-at-end warning in struct send_ctx") go
away. Whether cur_inode_path should be put back to its original place
in struct send_ctx I don't know, but at least the comment no longer
applies.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 fs/btrfs/send.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/fs/btrfs/send.c b/fs/btrfs/send.c
index 6144e66661f5..1fe4a06e6850 100644
--- a/fs/btrfs/send.c
+++ b/fs/btrfs/send.c
@@ -47,28 +47,30 @@
  * It allows fast adding of path elements on the right side (normal path) and
  * fast adding to the left side (reversed path). A reversed path can also be
  * unreversed if needed.
+ *
+ * The definition of struct fs_path relies on -fms-extensions to allow
+ * including a tagged struct as an anonymous member.
  */
+struct __fs_path {
+	char *start;
+	char *end;
+
+	char *buf;
+	unsigned short buf_len:15;
+	unsigned short reversed:1;
+};
+static_assert(sizeof(struct __fs_path) < 256);
 struct fs_path {
-	union {
-		struct {
-			char *start;
-			char *end;
-
-			char *buf;
-			unsigned short buf_len:15;
-			unsigned short reversed:1;
-			char inline_buf[];
-		};
-		/*
-		 * Average path length does not exceed 200 bytes, we'll have
-		 * better packing in the slab and higher chance to satisfy
-		 * an allocation later during send.
-		 */
-		char pad[256];
-	};
+	struct __fs_path;
+	/*
+	 * Average path length does not exceed 200 bytes, we'll have
+	 * better packing in the slab and higher chance to satisfy
+	 * an allocation later during send.
+	 */
+	char inline_buf[256 - sizeof(struct __fs_path)];
 };
 #define FS_PATH_INLINE_SIZE \
-	(sizeof(struct fs_path) - offsetof(struct fs_path, inline_buf))
+	sizeof_field(struct fs_path, inline_buf)
 
 
 /* reused for each extent */
@@ -305,7 +307,6 @@ struct send_ctx {
 	struct btrfs_lru_cache dir_created_cache;
 	struct btrfs_lru_cache dir_utimes_cache;
 
-	/* Must be last as it ends in a flexible-array member. */
 	struct fs_path cur_inode_path;
 };
 
-- 
2.51.0


