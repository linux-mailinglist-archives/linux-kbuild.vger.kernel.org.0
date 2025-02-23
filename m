Return-Path: <linux-kbuild+bounces-5864-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA467A40C78
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Feb 2025 02:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF6C83BFA50
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Feb 2025 01:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007C8B644;
	Sun, 23 Feb 2025 01:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGRXnAqP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C43380B;
	Sun, 23 Feb 2025 01:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740273606; cv=none; b=efkXy3XHZAwaBeCN93i8F2wfXE0b2ohMejfpXWZlyq+7b2Nx6r5TwEdyNxvN0FOvFvBSWqm4tlShQX6NEAPX1i79MTOhdoGjAt3lwUaP/p7hVLP1y03znPTqRsQHVh5krP6W76wUqWUSVvSwODsKz48ipsSAWGw0sL2WL4TTrE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740273606; c=relaxed/simple;
	bh=1Ag3yiNkTYSiiXOUq2O4eAczAUnCaTPGnKXkanJ5QQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f76EFKuADSuX2yLBXfz1YS9ntB0cpSdbvoW1p1aY/nhD3OiKk2FPS26NMoKeP39cN3tNiDG3tC5q2hPsl/xfBzYkqjI5oEJqXa7Y5us4GZ3TUxxlPlllVzMfejBOUZo0KB9OkdPVyKwSz/wkoCplMPO1SppxuxCCzXr7pBUu/c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGRXnAqP; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ddcff5a823so27723586d6.0;
        Sat, 22 Feb 2025 17:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740273604; x=1740878404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5/E8h6tPt70jBikyge4qsbuUL7f0EA3xrxeSF/10MbI=;
        b=dGRXnAqPG3gHMw0AnLTN/8OjgCM+dDs5B42iwhWtaVTx8Webr+EllzB4ZunbyABxEC
         U8GK4/jQWSyCoZNp4xXs0bu6T6AIeOFnNaT6Rsa64HiV0MFJ2N4usPMYzY1TNIjF7ELp
         6mxtbO2zOfX5MkEpgBVp4mGaxuDfhMzYRIAx3J2C1yKFtV2/vo+hLzVranC4G4bKMMCp
         E2AITD5JQxgWDcWLvBlZdOQVNeK/DDF//kobGiYR8qntegRIEETRQv0d3NiPk5uGPjLZ
         f7aNAA/ai/oDhaVXyfw/bkURwSf50Du0iM5MqEsSUL5Uda2jJZqMPUw5gWVzd0Jwutbm
         OH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740273604; x=1740878404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5/E8h6tPt70jBikyge4qsbuUL7f0EA3xrxeSF/10MbI=;
        b=p+rjBaZ2pqhqJrrVeq4bHoYJAuvsdG7UyeYHlypJV0gSKMfegLU215WZa36x3uhLhf
         B5WqEK9qlrbJR5dl0+ffjjC2qyBRFTgPV/umpctxeq2UUewKcbY+dUvRsZvE7pD5TLVu
         5hNqp6BOnPoWMaWuOq56rpIzWRaHFzlXngYwm+ImR8HyqeJd44dKasia82Spgb2vg4+e
         eXQFwldHyMmAM39AMN3WK52vK8Smn1ldd3rFr2N4f9HYYXuyUtFzNH4DzQCVrQhrgwTb
         zo95zXQEzQWaXAJmeM58h1zPY4Nlos+960gwjXcEaSQSCqYwSzg8jZi8Ethfzk8aAVZs
         dCWg==
X-Forwarded-Encrypted: i=1; AJvYcCVn/Bp5h8gIu3LOncHRpsEe2Oj5LqQ8vMCgLcPKGzd22WwIVKmJU9U2XusUAUGdV0+Mol6tgI9WHdumClky@vger.kernel.org, AJvYcCWaR8k8GZffk9psOl3mk/V6l7UsOyHcOC/gdzqPhqZ3Icn9nSKn23wl8vn9y8uGKfxP5ns6xYDmqO+slng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN72UAQerz7MG1uNM5Vf8HsaWqVgZ9OUbN8S598+pr2qOHUohf
	D17LtSf+gbFKluHPgj/r7qVsJ9FcQvJ7IHNGKqH4da/fXYNV6ZIa
X-Gm-Gg: ASbGncuVxMgc7kEANt1cTqE/2ewSm/VfYNTsmwBV6fWfTfPMjF8imQ3Qdhwv5sq3Xyg
	W9B/PswUygvpuJm7qtnAKGTDM+Srh8Han3DWw2RuOBX+gF0WLbJ2uzn+FfYbAtRYhmnfC/zCQhy
	IXuRRvqhQEzPFgYwRh/G4yfLzvrC0XeJl2RMMkWuYBmvA/3uNaXHuXL2J8iHS6r1/ihp9nWAkKz
	Fyhzxd9+B3AnHQIHTQsnR4BT7EyHYNnB2QEPix7O4TLjuOhMmAuYs7AYnq3wpcQc1Df2D3bdLew
	Gw==
X-Google-Smtp-Source: AGHT+IGltQ6nyO2jkep3dzWPjLm1uU24Rp2OlIoDOrD5tZZ4WHRwWqt/UMOUxzmAGpbVsv+jxTZ4LQ==
X-Received: by 2002:a05:6214:d8a:b0:6e6:5bc0:1521 with SMTP id 6a1803df08f44-6e6ae7f870fmr119198646d6.17.1740273604178;
        Sat, 22 Feb 2025 17:20:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471f2b0476dsm74440991cf.28.2025.02.22.17.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 17:20:03 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] kbuild: install-extmod-build: Fix build when specifying KBUILD_OUTPUT
Date: Sun, 23 Feb 2025 09:19:43 +0800
Message-ID: <20250223011944.902904-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 5f73e7d0386d ("kbuild: refactor cross-compiling
linux-headers package"), the linux-headers pacman package fails
to build when "O=" is set. The build system complains:

/mnt/chroot/linux/scripts/Makefile.build:41: mnt/chroots/linux-mainline/pacman/linux-upstream/pkg/linux-upstream-headers/usr//lib/modules/6.14.0-rc3-00350-g771dba31fffc/build/scripts/Makefile: No such file or directory

This is because the "srcroot" variable is set to "." and the
"build" variable is set to the absolute path. This makes the
"src" variables point to wrong directory.

Change the "build" variable to a relative path to "." to
fix build.

Fixes: 5f73e7d0386d ("kbuild: refactor cross-compiling linux-headers package")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 scripts/package/install-extmod-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 2966473b4660..c0357ba2ff72 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
 	# Clear VPATH and srcroot because the source files reside in the output
 	# directory.
 	# shellcheck disable=SC2016 # $(MAKE) and $(build) will be expanded by Make
-	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"${destdir}"/scripts
+	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"$(realpath --relative-base=. ${destdir})"/scripts
 
 	rm -f "${destdir}/scripts/Kbuild"
 fi
-- 
2.48.1


