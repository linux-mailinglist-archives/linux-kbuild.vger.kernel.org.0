Return-Path: <linux-kbuild+bounces-4546-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A3B9C0991
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 16:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2ED4B216F2
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 15:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0654321217B;
	Thu,  7 Nov 2024 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="aqa/AA6I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF580BEC
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Nov 2024 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730991915; cv=none; b=Mu+EKjdS36mE31xHX7ab95eQCSKYKixT9vwk1dZvT98MEyHwTX9N94bUjlUZsjLceLP+2fL+0OHS6S5iGoHEo3rrjfLkoaEHOf6Lky7+bdL9oWwt+3PkTT1PjzWhi1pY53JTMpgCbm3sQ1ER7uf2Bcl5P523emtmFxudhf9BYEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730991915; c=relaxed/simple;
	bh=JYB2rONnGgA9cyzBUQh8hHxI2XT6QsjpR3+KbevXCsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IzEf1ybJAWM5vtwP6pKGyQM0x3LGctIRHjHLbT8sNP0jWeIiPKLbqYEWUJD4OhxKBPm2SL5BewJq+r7oPMbyOguu+UtJswsmZfA9zBIhtmrUhWoBeg+H1tw1ik2K40KgIndL+IYnq0JrHNH1qi2VMqwH3tT2aL35LX/6ice/VdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=aqa/AA6I; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso9061995e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Nov 2024 07:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1730991912; x=1731596712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lg27wTI8f39QfS8u2we5QcBCxwqdnW6Uymk0y8tPYVg=;
        b=aqa/AA6IbohN5ZLZt3ir+29mxl/ywqaKZ8Bc5e4gRb4Ad4rLqVadsRjzqGyX6O0GLi
         a6M//Q56/mAF1g+z7FPatVVbKK2SnrbD282F9L6/TDqjHU+uyVEl4uBkqqI/J86rv9rx
         Et3zlK5Wx9Q8qE/CYh8usg2mDU2Efv0AQs2E2JuidNuC5yFVfzFEaInjjh5pBMhbm81V
         aVzMFQ8xGtr0Trsfmgp/L3x4cMBVUOZEQr8HXQU3h7WwCIw/olyLRa7So/6xr29Vp3ns
         YRLlp3hCHS12h9jXFjBe/gTnS1+WReiCv61ur0eBp8EdzRIRHfMyolzaw9TQbAsToEnV
         lyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730991912; x=1731596712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lg27wTI8f39QfS8u2we5QcBCxwqdnW6Uymk0y8tPYVg=;
        b=DgGOi8No5u7Ttrvf0Ue3A1dR0XFWZyM5sBGmU2xuAKJ+EP0Jx0g9g5rplNaJsf6p1L
         K2VifPUZSq1rAEWYMxPMRoriINLohsE8JgYEUWSsG8zwBpKrjdW0K5oyRVHhw3QDOLKt
         1BEtp+Qv5ciRLVsYzpFv//BHSSg40iF8TN7UOfvdB7cgIp2KY8jWIezCa5JGZczunWAi
         0Cni2aU6YnpqEUgaoP9NnTmn3bNJqpj+mhwy8tqhcQTQwhQU9++mPcf/bodcuseXoqQE
         T58ASSuRkirTKZuRvDfVVnFL6/88VNM+vFSpJIwFy0MPOG3r1X8NSBgHfiJCbw4x1Zm1
         HZRw==
X-Forwarded-Encrypted: i=1; AJvYcCVy0j8zDVMcJknTXjl3SlfAv/s2U5Ix6h87QVxI8xQ5fU1m97SJ8S5kjlEx0NysSvMwujQi9H79lF26vXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wDTB5QSsEukXTjC5mR/zDs9LlAw1umcHnIVxEdTDVCALCQni
	LzuHO24HlJ52lhr7y91yy8UhNQajeuoJrTHHPjRWFiV0xQLNdWNB6L0LI0hh0s4=
X-Google-Smtp-Source: AGHT+IHJQOj8gJUFLGdhzZqxrtrZoHhp+SVRoso935asClAWrK+CzNptX0NLsDU1i9rUv+QJpZEWjQ==
X-Received: by 2002:a05:600c:34cd:b0:431:157a:986e with SMTP id 5b1f17b1804b1-4319acb8d3amr359558585e9.20.1730991911554;
        Thu, 07 Nov 2024 07:05:11 -0800 (PST)
Received: from matt-Precision-5490.. ([2a09:bac1:2880:f0::179:1ba])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b60cfsm63088485e9.7.2024.11.07.07.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 07:05:11 -0800 (PST)
From: Matt Fleming <matt@readmodwrite.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com,
	Matt Fleming <mfleming@cloudflare.com>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3] kbuild: deb-pkg: Don't fail if modules.order is missing
Date: Thu,  7 Nov 2024 15:05:08 +0000
Message-Id: <20241107150508.2835706-1-matt@readmodwrite.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matt Fleming <mfleming@cloudflare.com>

Kernels built without CONFIG_MODULES might still want to create -dbg deb
packages but install_linux_image_dbg() assumes modules.order always
exists. This obviously isn't true if no modules were built, so we should
skip reading modules.order in that case.

Fixes: 16c36f8864e3 ("kbuild: deb-pkg: use build ID instead of debug link for dbg package")
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Matt Fleming <mfleming@cloudflare.com>
---

Changes in v3:
 - Wrap modules.order logic in 'if is_enabled CONFIG_MODULES'

 scripts/package/builddeb | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 441b0bb66e0d..fb686fd3266f 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -96,16 +96,18 @@ install_linux_image_dbg () {
 
 	# Parse modules.order directly because 'make modules_install' may sign,
 	# compress modules, and then run unneeded depmod.
-	while read -r mod; do
-		mod="${mod%.o}.ko"
-		dbg="${pdir}/usr/lib/debug/lib/modules/${KERNELRELEASE}/kernel/${mod}"
-		buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
-		link="${pdir}/usr/lib/debug/.build-id/${buildid}.debug"
-
-		mkdir -p "${dbg%/*}" "${link%/*}"
-		"${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
-		ln -sf --relative "${dbg}" "${link}"
-	done < modules.order
+	if is_enabled CONFIG_MODULES; then
+		while read -r mod; do
+			mod="${mod%.o}.ko"
+			dbg="${pdir}/usr/lib/debug/lib/modules/${KERNELRELEASE}/kernel/${mod}"
+			buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+			link="${pdir}/usr/lib/debug/.build-id/${buildid}.debug"
+
+			mkdir -p "${dbg%/*}" "${link%/*}"
+			"${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
+			ln -sf --relative "${dbg}" "${link}"
+		done < modules.order
+	fi
 
 	# Build debug package
 	# Different tools want the image in different locations
-- 
2.34.1


