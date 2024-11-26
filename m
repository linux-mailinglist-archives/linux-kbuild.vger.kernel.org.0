Return-Path: <linux-kbuild+bounces-4873-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D739D9B65
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 17:26:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05142B2C1DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 15:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5181D63EA;
	Tue, 26 Nov 2024 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYnrILdj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430871D5CEE;
	Tue, 26 Nov 2024 15:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732636722; cv=none; b=JUsFBHOCVRfwgP1y8nRrkeicX+CYbumKCSYHfysuHeqEcOJJnKkXGW5g6gUQBk0VrCXt6YTxM7lV28T8UCY4pGCefpiz/E/MOzwkE6jagAk5X2Pti3QNCrYr/mCo5LBgDYbrQJk01WPEUTtQwJ5s2qt/8TD7lKmkBGAGYlHxlew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732636722; c=relaxed/simple;
	bh=OTycc2XgyJHTw70iWBJjpBngBVT+yBZQqdAmzsv/iE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=elHdQQYIgOC68LWyMUXFgfs8gmYVejIu6J/sCrk8HaxO3wcWBRVsmPwJJlh73csa6PMLEVfcJSnmMrroIdl+pEHeIzr/J0tLgAhPwC91itSmOBjAUdxn/lHSFXrfsA7Rp1ZFuNl7ilfS3Oej41muy7kxzcPyKpFMtEzMcC+X//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYnrILdj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa549f2f9d2so346595366b.3;
        Tue, 26 Nov 2024 07:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732636718; x=1733241518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T8n2wI4oeSut/Jjcn1/Mxbg5PONj2bv4bv/HeAUJ8aI=;
        b=bYnrILdjs1WxVi1FUdJeakb0MKVmpphuklje0MEyttUlE/8z7Tb8Ul1N7dVR9k/23C
         dN8NGVaVOGfyXn0EB5RhFyV4BAPrYlw2WW8gLJNasZllQvz1AOMMNXk9uuQqiyJoPIXu
         5ch+2t2OVyCZ0NgTNwy08WoT6Hjb4Dr3uZ5KUzFmu7toBMKwrGTuofqSHzrud6aqFTom
         uaorX9WZ7CVYzdt03VaD1gb1ilUcU1QR35zWJyFre+LOMgNeccFl34US5ltleAPT39Kp
         hR3vdT9B6FhpnbxvsdJ1oR86FsroNavfS9oFry9W9BHDe0y8TPlRlky0gSSX6W+URl7k
         W0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732636718; x=1733241518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8n2wI4oeSut/Jjcn1/Mxbg5PONj2bv4bv/HeAUJ8aI=;
        b=YQlo0CRfzJJVYZBmJDQYjH2eYy2329gf3VoZWEBb2RNVwuuqkxHir8xGrv++gcUSh+
         zOft2sMa0K6O6pK3dNi951wp9dspCbpzormkhr1t+O4pBNKpPeS9vSp/bsrPUJHhVWtd
         Wqi10XPmnoeQDCGwyoIDmGBc/qMHtl+o7mMcms/+JX0lZlRgn/r4VDT1x2AKgxyeXjnm
         /xmHMjumXTIjDhnnxFRV6cmFgtPF/o8evEQ+a5tCBavVh0YBSgeuo4oU47QOzwIJBt8S
         62di34h8sQc+VSwWKc+XhEDdGPm6TDA3jk2jJQGSemFdfEJHMXlxtq9zyHGIqzr4As1T
         G19A==
X-Forwarded-Encrypted: i=1; AJvYcCVHoE0PWSYZosYp976BVKfIK7MsNJ9yjobTqmOZ2Bm9ROoHkC5n3Qwx24aqAS06N6AaLz2uF3O0CyUrMLaZ@vger.kernel.org, AJvYcCVvzpRgJ0Rwk+phDAD3/nwBSr5J8lxZJk3xEYmW9rwRnmD2s+lqwXTGYt0MZMSbUrz27ZmxYQqPol/Dg3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqT9GVryVYIGcgr/mkDdMdZ2c0fuOw7bUsdWJOwJY0eAXtzCh
	DSvIr5ty0G8dyVY5rIMiq9IZFWpY/7xUZt+sAuXw+av7gWLWmDdP
X-Gm-Gg: ASbGncuVrfO8A9AklT/wzLryqtT7zWeIoPwRyrNxWqcNQoKMumMv1Lw1eQwad7hMVSK
	7mFc1OKhsh4VFcwHm5D31Nq3XwDS9T3ky77SSU2JmDDg8XUI1q1au6CwRiqydh4yDq8Ms1jC198
	U5y2iAQ2+yWWHNqTHTSLvF/kebD4zK3H5Fb/QJdFecGzVrBqkhd2Je9QP2nwdDQxl8xv1QTGMjI
	2RLmcT9s61hmHizVgu6VTBh8N3gsD7zmXjO/uXJtqJ29KAhmXGwGKb0CdodFioa
X-Google-Smtp-Source: AGHT+IG7gvH38k1p+fjTdzKM7b5HW2QekEurfaXpzofSVDWfAKvRG7yTEYHLW+DsYixuM84MPc04Xg==
X-Received: by 2002:a17:906:1da9:b0:aa5:3950:10ea with SMTP id a640c23a62f3a-aa5395015ddmr991928466b.36.1732636718222;
        Tue, 26 Nov 2024 07:58:38 -0800 (PST)
Received: from localhost.localdomain ([2a02:3030:6:ac03:ccb:c3be:6eb4:edf9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50c305f56sm612095766b.181.2024.11.26.07.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:58:37 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v2] kbuild: Fix names of .tmp_vmlinux {kall,}syms files
Date: Tue, 26 Nov 2024 16:58:01 +0100
Message-ID: <20241126155832.15560-1-sedat.dilek@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When playing with gendwarfksyms v6 from Sami Tolvanen I noticed:

$ LC_ALL=C ls -alth .tmp_vmlinux*

-rw-rw-r-- 1 dileks dileks 3.1M Nov 22 20:52 .tmp_vmlinux2.kallsyms.o
-rw-rw-r-- 1 dileks dileks  34M Nov 22 20:52 .tmp_vmlinux2.kallsyms.S
-rw-rw-r-- 1 dileks dileks 6.5M Nov 22 20:52 .tmp_vmlinux2.syms
-rwxrwxr-x 1 dileks dileks 101M Nov 22 20:52 .tmp_vmlinux2

-rw-rw-r-- 1 dileks dileks 3.1M Nov 22 20:52 .tmp_vmlinux1.kallsyms.o
-rw-rw-r-- 1 dileks dileks  34M Nov 22 20:52 .tmp_vmlinux1.kallsyms.S
-rw-rw-r-- 1 dileks dileks 6.5M Nov 22 20:52 .tmp_vmlinux1.syms
-rwxrwxr-x 1 dileks dileks  52M Nov 22 20:52 .tmp_vmlinux1.btf.o
-rwxrwxr-x 1 dileks dileks 514M Nov 22 20:52 .tmp_vmlinux1

-rw-rw-r-- 1 dileks dileks 2.1K Nov 22 20:51 .tmp_vmlinux0.kallsyms.o
-rw-rw-r-- 1 dileks dileks 6.3K Nov 22 20:51 .tmp_vmlinux0.kallsyms.S
-rw-rw-r-- 1 dileks dileks    0 Nov 22 20:51 .tmp_vmlinux.kallsyms0.syms

.tmp_vmlinux.kallsyms0.syms is NULL byte - it's a dummy file.

Further looking at the other .tmp_vmlinux syms files:

.tmp_vmlinux2.syms
.tmp_vmlinux1.syms
.tmp_vmlinux.kallsyms0.syms

Change the naming of file

.tmp_vmlinux.kallsyms0.syms -> .tmp_vmlinux0.syms

While at this, fix the comments in scripts/link-vmlinux.sh.

INFO: v2 is based on Linux v6.12

Link: https://github.com/samitolvanen/linux/commits/gendwarfksyms-v6
Link: https://lore.kernel.org/all/CA+icZUXvu0Kw8RH1ZGBKgYGG-8u9x8BbsEkjtm4vSVKkXPTg+Q@mail.gmail.com/
Link: https://lore.kernel.org/all/20241123132237.15700-1-sedat.dilek@gmail.com/ (v1)
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
v1 -> v2:
- Add commit description and follow naming consistency
  as requested by Masahiroy san. -dileks

 scripts/link-vmlinux.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a9b3f34a78d2..239fe036606f 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -203,8 +203,8 @@ kallsymso=
 strip_debug=
 
 if is_enabled CONFIG_KALLSYMS; then
-	true > .tmp_vmlinux.kallsyms0.syms
-	kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
+	true > .tmp_vmlinux0.syms
+	kallsyms .tmp_vmlinux0.syms .tmp_vmlinux0.kallsyms
 fi
 
 if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
@@ -231,14 +231,14 @@ if is_enabled CONFIG_KALLSYMS; then
 	# Generate section listing all symbols and add it into vmlinux
 	# It's a four step process:
 	# 0)  Generate a dummy __kallsyms with empty symbol list.
-	# 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and sections,
+	# 1)  Link .tmp_vmlinux1.kallsyms so it has all symbols and sections,
 	#     with a dummy __kallsyms.
-	#     Running kallsyms on that gives us .tmp_kallsyms1.o with
+	#     Running kallsyms on that gives us .tmp_vmlinux1.kallsyms.o with
 	#     the right size
-	# 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms section of
+	# 2)  Link .tmp_vmlinux2.kallsyms so it now has a __kallsyms section of
 	#     the right size, but due to the added section, some
 	#     addresses have shifted.
-	#     From here, we generate a correct .tmp_vmlinux.kallsyms2.o
+	#     From here, we generate a correct .tmp_vmlinux2.kallsyms.o
 	# 3)  That link may have expanded the kernel image enough that
 	#     more linker branch stubs / trampolines had to be added, which
 	#     introduces new names, which further expands kallsyms. Do another
-- 
2.45.2


