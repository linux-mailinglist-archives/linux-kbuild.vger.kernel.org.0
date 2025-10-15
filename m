Return-Path: <linux-kbuild+bounces-9175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1322DBDFAE2
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 18:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E41784E987F
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Oct 2025 16:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337D32D593B;
	Wed, 15 Oct 2025 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZqwX5w3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0F933769D
	for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546118; cv=none; b=t7ImUH8XBSaRxSBCUuAz1yAV8Fa6rXJG5Zd4TsKefCQEM1a0OdrWD1T3sKgRBPrfEP6CMQ/6jg6PWu9ekFoJHur6/9EEXA6fEe1zuDtariKI2OM9psGOQjxvlsE5a5aBxFOrL/JtqeYG28yxbwKMwZXp2SBCTrh2PEy+GoAfI+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546118; c=relaxed/simple;
	bh=+F9lX8BxrHM09zh4THFUGQfBA0gUrRnxZiBHFNJDoZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVs3yiPFOZaPp85PsDxEQBOnylam4j0d8ejhLcyAVv/5R+ku+VKcs96LmFMVGqpn0gqpoOvjnUQkW1gr3PL8jrU/Ked6OQ5VFZpanfrrgB3r7QXM7wEUVX02C/UiybXFiLJ1K74opszB3lrNKWRdk2N4JjVXCS2KRzaoZMiLSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZqwX5w3; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso9010523a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Oct 2025 09:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760546114; x=1761150914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bndtYUqfGIZpaVzkFCgkIe4QUYyWwzarc5JiifW+vfI=;
        b=CZqwX5w3uHcdGp6eJBbp0z+TB7KEAEkH0+W7OO+c7NO0ZjF5/gvUsf+IG5kyL95CzU
         wPeZaIeOc8k/DPXXReThu8sYqWUMQgnw6V9Vbg/IzkkIl1+NjcDNmz+apXDiL+fkSnHX
         0bk97tYHhJqNjS3zzW9eOv00gEc/zqOOOOyE9UqqsP3TlsPk4FXJyH/TqLwIVeYR93KZ
         kTWlGoqInXBUcy/lgvEQDczJPi6JM4PLq6IHVWvIAlfrurKPlpMWr4iQZ/hKy5Osd9SK
         uSuPot/oDTWNfPHlBo007kLFtsRkUSvucC7AAdeaUYbAxStCDNh8vtdSjrNSm5UXe0B2
         b3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760546114; x=1761150914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bndtYUqfGIZpaVzkFCgkIe4QUYyWwzarc5JiifW+vfI=;
        b=wJC0FuleBON98010azATRFbCm67Zb9wvO1fGZv9buVg2kAlzGnz+yIICyotZteVlIZ
         Bdi2bqTSULztQvY9rMYC5a9s5eenQP8qrPydbBKxhTN210KqwIBFQTnctmBhTJIozzm2
         9EnJpTftbGCH8lHyTSt/YqCLAqVmHaXs1+sL4nDJq+6VNziQRaQSD13rlhqWvGxf5hm7
         5pOPV80ySPU36i0QgRC8ppCbARnFAFpTux0pw9pr9Eyq/EFRduwS1l8OQiiTMr0/N294
         gEofbf4H7DTnyiy7mKiim20ezdW4bGwFN5dAmV+/GJzpQ8nWPEj8cRYspqK6gPEhXfiQ
         ouoA==
X-Gm-Message-State: AOJu0Yz5XcjrKSAkNlQXK7Fn33mmS4jT+ku9DSKrwmCGRg6mslPGwDyY
	8THQeTH9hBSkzZCSKpeLR/lXxjeC717u7z+7YXpVJj93kiTZvFMKLwMt
X-Gm-Gg: ASbGnct57DKqS5w1gMZqC0xz6r/mnZOX40p3n5w7l4JHpaAa++D0iASvYRl9bUHhZLN
	qyLiIXu7hJFGUN9JlLlLeDMMF3wFrhNAtAvSeBMeChUqwpqPDAqVarhD3Fw3kEReg4vUV5V/T9W
	/PXPY0Vu/G47mc+onzkctBvYrhOBdkfecJG53RyF/EpvR/57ht54Fpf+m3uo3Zv/O4k5ivTjeyU
	RdUwlVYD0eZMLIK4ned2jjMozP5mOSNnQ7wx403Tsw6QDIUBeAjPvS7D5NSQ5lDFHJTwEkKTIIF
	CybYqAYckBAJ/g8PXkTZ1U29AQgYPgNzQVyIGmHrvDwPan/NIdjo8yjYSFza61qJRCQ/IWvvFJZ
	5oxH08xF/qabbtcgqV6w8vGnh+uOgwzGlvtwlTsMnRaPVQn2Vr5ULKktMWw==
X-Google-Smtp-Source: AGHT+IHLZWkUlyawqyiGfLz/qEWiPSOIz5Y4RNXz5EPwgCvjjbkARO4juP6RcyZkWDgaTU50o9F0PA==
X-Received: by 2002:a17:906:c105:b0:b3e:907c:9e26 with SMTP id a640c23a62f3a-b50ac5cfaf7mr3098522666b.59.1760546113373;
        Wed, 15 Oct 2025 09:35:13 -0700 (PDT)
Received: from build-server.. ([62.96.37.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba06c187sm263576266b.31.2025.10.15.09.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 09:35:12 -0700 (PDT)
From: mike.malyshev@gmail.com
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mikhail Malyshev <mike.malyshev@gmail.com>
Subject: [PATCH] kbuild: Use objtree for module signing key path
Date: Wed, 15 Oct 2025 16:34:52 +0000
Message-ID: <20251015163452.3754286-1-mike.malyshev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Malyshev <mike.malyshev@gmail.com>

When building out-of-tree modules with CONFIG_MODULE_SIG_FORCE=y,
module signing fails because the private key path uses $(srctree)
while the public key path uses $(objtree). Since signing keys are
generated in the build directory during kernel compilation, both
paths should use $(objtree) for consistency.

This causes SSL errors like:
  SSL error:02001002:system library:fopen:No such file or directory
  sign-file: /kernel-src/certs/signing_key.pem

The issue occurs because:
- sig-key uses: $(srctree)/certs/signing_key.pem (source tree)
- cmd_sign uses: $(objtree)/certs/signing_key.x509 (build tree)

But both keys are generated in $(objtree) during the build.

This complements commit 25ff08aa43e37 ("kbuild: Fix signing issue for
external modules") which fixed the scripts path and public key path,
but missed the private key path inconsistency.

Fixes out-of-tree module signing for configurations with separate
source and build directories (e.g., O=/kernel-out).

Signed-off-by: Mikhail Malyshev <mike.malyshev@gmail.com>
---
 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 1628198f3e830..9ba45e5b32b18 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -100,7 +100,7 @@ endif
 # Don't stop modules_install even if we can't sign external modules.
 #
 ifeq ($(filter pkcs11:%, $(CONFIG_MODULE_SIG_KEY)),)
-sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(srctree)/)$(CONFIG_MODULE_SIG_KEY)
+sig-key := $(if $(wildcard $(CONFIG_MODULE_SIG_KEY)),,$(objtree)/)$(CONFIG_MODULE_SIG_KEY)
 else
 sig-key := $(CONFIG_MODULE_SIG_KEY)
 endif
-- 
2.43.0


