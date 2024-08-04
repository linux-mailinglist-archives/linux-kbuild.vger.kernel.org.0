Return-Path: <linux-kbuild+bounces-2803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53789946C8C
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 07:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC6DE281B8D
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 05:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D5D848C;
	Sun,  4 Aug 2024 05:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AU53/l5n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C335320F;
	Sun,  4 Aug 2024 05:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722750665; cv=none; b=f+ytkaVfdYxlgHYXuIAxTY+uzEACKPdS+zxDavvD5D0em/J/LbO+Ni7UOgsq5tDzbNyJALmPI4eFygogS3DCNwkheL5ARKAfpX2M/mPIN/r+A6F1DdwZRHPwWgA1poLRA2UWi/IE2zZxriNIENSoo1RiR/NoQPmNbJzUvyRs99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722750665; c=relaxed/simple;
	bh=CHx67+AWIMhwksb0gUufS+ozdzIpl8bCGpgTob7eu3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ORHe9cS8+Ie5WSQkvS85JqshrcNceoWav9f39mf/Q/f10W9SqNxY6mwd1ngRFUirb28Lv1cBFZ9qPy9ItO/tlRi7HulaT+1MouYZoNdiY2Yr3vPpBM3RASsBeLnDuYp3Jy1uv7CrZa+6LI7Foe4Z60hOiusHZYf5OuF68X08EuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AU53/l5n; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso7937138b3a.3;
        Sat, 03 Aug 2024 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722750663; x=1723355463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Sxku0HqR8yKKcKYUQ0hg4O8X0+yABmWMgJK9/GJXNA=;
        b=AU53/l5nnj1x0JAeVIUdRF0nWGOAgz84RzXH786rtRwLNT+/SuDhbUb0CDXTY0QHpM
         cIpMRe4l6uAZrk1a1mTqhD6HU3i2LOpEsDxC/B/yJ6kGKyTXJlsJ2GfXhGJcCqcKpUC0
         ZnFcPxyXv7F0Bd/MORrvZmw3CbN7/nGlpxpfbew/7XruutUP0RuyDn6oRqSwEuYl9/S6
         ZAElXRQVrsYPv30PlsSpI6zj+YXNgRdHqCKDAB0PuKhDZJ5M8b3eGesv+0WEQPaTTvDH
         9mqZBK3wak+I1V2ihf4NwVpRkhoNFxK5AZjOOo8tHZQbyqIW8yWED/FgHc6A2kzSyGNs
         djbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722750663; x=1723355463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Sxku0HqR8yKKcKYUQ0hg4O8X0+yABmWMgJK9/GJXNA=;
        b=qjImXWccJBru/mYzNeqtyeIhkL5Igwz7khqnQf9CHcUzxU+Cdi2DcfoBxT5oi8qA71
         Lij5wC3ZyTuZbsU0pO7GBOphbq4R1cO10KQx1BOVqaOIlng6syi47W9uBfIB1sADii8+
         2U1bHqocTivbvPHhnlZ0bSD7aPJvEgLaefkD61AZylIFXr+UMITsgVsphEDNBjZGkWVt
         Vvo8uCcyHogm4EghrP5mHy8jJGgVwbJTCGkxqnI7I2rDXc2BZRSFae1QRPO+g+2xSyIg
         oa/IfhkCwhcyeUNIx4nBzv/rqsORYypKs8+KswdVZowtP5eE9GFGL08jtivC4vi/FTDc
         5M6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzD8yqNOpGM1ldvbpIrXhEFkhrh3gaGNuzPb4uB5vcNazE6vPAtaqjVSrqtKDu2hM0vMDlkpNDYZ/pRf6hFvO+cjNJEyFxqmFIDl3E
X-Gm-Message-State: AOJu0YyLOO/4c0PJh4WboeQTXP6nhArZnWSaRrWhmpzSSxqN8DgDKO0N
	c3No+LWhnzCxOdTdPOnID4IAAI66e84mUsr24Ok4Q+PS+bgVhaep
X-Google-Smtp-Source: AGHT+IHYjStS0OYmvyzheM8+FSb5kSepsj3t7rXV5SL9QSn3bNiQ/hktRWAWjbzk3EqVcvWVp4pinw==
X-Received: by 2002:a05:6a00:240f:b0:705:6a0a:de14 with SMTP id d2e1a72fcca58-7106cf8bf93mr10855632b3a.1.1722750663262;
        Sat, 03 Aug 2024 22:51:03 -0700 (PDT)
Received: from localhost.localdomain ([240d:1a:f76:b500:4431:46e3:c76b:79bc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7107f9a46d2sm1880148b3a.130.2024.08.03.22.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 22:51:02 -0700 (PDT)
From: Alexandre Courbot <gnurou@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH v2] Makefile: add $(srctree) to dependency of compile_commands.json target
Date: Sun,  4 Aug 2024 14:50:57 +0900
Message-ID: <20240804055057.262682-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When trying to build the compile_commands.json target from an external
module's directory, the following error is displayed:

	make[1]: *** No rule to make target 'scripts/clang-tools/gen_compile_commands.py',
	needed by 'compile_commands.json'. Stop.

This is because gen_compile_commands.py was previously looked up using a
relative path to $(srctree), but commit b1992c3772e6 ("kbuild: use
$(src) instead of $(srctree)/$(src) for source directory") stopped
defining VPATH for external module builds.

Prefixing gen_compile_commands.py with $(srctree) fixes the problem.

Fixes: b1992c3772e6 ("kbuild: use $(src) instead of $(srctree)/$(src) for source directory")
Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8ad55d6e7b60..52d7dfe4212a 100644
--- a/Makefile
+++ b/Makefile
@@ -1980,7 +1980,7 @@ nsdeps: modules
 quiet_cmd_gen_compile_commands = GEN     $@
       cmd_gen_compile_commands = $(PYTHON3) $< -a $(AR) -o $@ $(filter-out $<, $(real-prereqs))
 
-$(extmod_prefix)compile_commands.json: scripts/clang-tools/gen_compile_commands.py \
+$(extmod_prefix)compile_commands.json: $(srctree)/scripts/clang-tools/gen_compile_commands.py \
 	$(if $(KBUILD_EXTMOD),, vmlinux.a $(KBUILD_VMLINUX_LIBS)) \
 	$(if $(CONFIG_MODULES), $(MODORDER)) FORCE
 	$(call if_changed,gen_compile_commands)
-- 
2.46.0


