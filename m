Return-Path: <linux-kbuild+bounces-1726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA76E8B99E0
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 13:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC79C1C22A3F
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 11:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2E3604B3;
	Thu,  2 May 2024 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LdMGvnXl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B0863417
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714648587; cv=none; b=ipRkZ43BPDpiYY3oB3xQzZMC4fDk5pfwFrGW+5RnlChjPiSrbrU4fMbyJ2WVz9H7AwPe5qvCLOqng0aJESAV5LptA+lTiGQHsQAHQLJ37GMTqHneIKC8Gdvu74TvkGyqORHQ+ASgG3ZRmz25DXBl8qItbGkc7uRIm6kIF6BckPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714648587; c=relaxed/simple;
	bh=YBmIuvux2Nz3WQf1dIIQ6Ld9PE8PDzjfaHfR7DKWMGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WB+1yNbHPtV52P7+hCBrr0tzsvf4ERKJm+dBI0Y27+uMCgeFu0EoqtC7YJLHw1ES9UWdcVR2eD6VM35LfraBLBPO9OJ4ag/umEYWTBU8BIBu81oyXyqJ2VkC28e2RrFMRy/4hHYOGck9xeD/x2C5y0md5gGCgmRkUg+ZtEKN8dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LdMGvnXl; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B297D3FE67
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714648583;
	bh=alIA34WXYkmJHYDf9JzzyaPI80jtTP1Uaq24imH+xTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=LdMGvnXlzUHzVWCcs6Jk2n0gC/FLseG46T/R5Yz+KzhrHKzmvMOjDm/CqJ7c0aBoX
	 aHHxoxhcWLtVxPWjKtwf5yShW0irYpH+Ov2GGLl7s12wMkB3SdLxMCRIz1cPLZ7UGY
	 KC+ngJgRjWbElbNJU4bIBT5fw5ZEmbOejdQSU3tYVGMLHwWQnBUSk6aZk9sNE+Jw1c
	 PXX0dlk/YE7LVDU6UBtJaqOyg1UxTJjs8gDUmvWjqewR+V4UNCTJ9IPOC6wyQvQaub
	 aJbLVghZiTYqp67xGxDJgodsS6oWsXq5bpJazjSQBiJG4WTVsuUe81NzJIjY+zH2Ka
	 Ayile8J8PG2gA==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a55a8c841e8so409191366b.2
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2024 04:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648579; x=1715253379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alIA34WXYkmJHYDf9JzzyaPI80jtTP1Uaq24imH+xTg=;
        b=jwBME/7wqBwJY3colSgu8oiXouHyeZf/iMuoUTm9LwPk8/32F/NY94qjW5Tg7mqw0K
         jed2soPmHAry4jooutQscyODJyrgFCl750oSzYcj7JKgT3DU7vAOCejLdno9WqjzfoeL
         gzxGZM93Y8L2T0bxGRvPDokYfqhSzdaCnVEY/byoEgov1BF4w+8fTfWDbN0TbV6sS4kz
         p82tAH3q0OsT3RKO+OhrZvGd4IM2wDzWELohFkRGhOwhgVwF5mKelKSedmfrk3vkqeX5
         8doGbimS8QRIbkxBSYc1MEk/hC3l5O1SclnfmcpPoMReKD+DkYIU9fTt52RjFrv6Ef1O
         GF5A==
X-Forwarded-Encrypted: i=1; AJvYcCXtdf2+xx1N9K8vU2oBpy6O3Yr9ita6R29KU1ggTvl2kwWJ7aO96uiam8Aix3cz2gjOux847fXwaHiPChz/YK2b3YrgW+g9EduRwsrZ
X-Gm-Message-State: AOJu0YzJAxsDZ4OJTlJQ1+WTxI840CMFKNR/DJPwTHyaywC8Ztl3UlqV
	LyFt77CLrX8K3hV4cMkuVaiSRm/DTnqon8La5bLfhUHO0qOLUZ+t1yZu5e2ZPXFY0gb2u/5mvP1
	+D1R9YjvAJhVYSekHuDYQQukevhlqA9QnMpCn5nZd9qDgYXUNTUbi5v4U+gk2BfaRGL5sHF8RSB
	tFLw==
X-Received: by 2002:a17:906:11db:b0:a52:351f:5694 with SMTP id o27-20020a17090611db00b00a52351f5694mr1517614eja.14.1714648578848;
        Thu, 02 May 2024 04:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG86D9hK+ydkPVXUK/QjxllUq0XEakTYgairpW0wG9EVGdit8WtuOux1Y7bI6aIK7GFaVI/kg==
X-Received: by 2002:a17:906:11db:b0:a52:351f:5694 with SMTP id o27-20020a17090611db00b00a52351f5694mr1517596eja.14.1714648578551;
        Thu, 02 May 2024 04:16:18 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id gs23-20020a170906f19700b00a4739efd7cesm437278ejb.60.2024.05.02.04.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:16:18 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>
Subject: [PATCH v1 3/3] kbuild: buildtar: install riscv compressed images as vmlinuz
Date: Thu,  2 May 2024 13:16:08 +0200
Message-ID: <20240502111613.1380453-4-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the KBUILD_IMAGE variable to determine the right kernel image to
install and install compressed images to /boot/vmlinuz-$version like the
'make install' target already does.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
This patch depends on Masahiro's patch at
https://lore.kernel.org/r/20240414174139.3001175-1-masahiroy@kernel.org
---
 scripts/package/buildtar | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index ed8d9b496305..fa9bd0795d22 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -54,9 +54,8 @@ cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 # Install arch-specific kernel image(s)
 #
 # Note:
-#   mips, arm64, and riscv copy the first image found. This may not produce
-#   the desired outcome because it may pick up a stale file remaining in the
-#   build tree.
+#   mips and arm64 copy the first image found. This may not produce the desired
+#   outcome because it may pick up a stale file remaining in the build tree.
 #
 case "${ARCH}" in
 	x86|i386|x86_64)
@@ -101,13 +100,12 @@ case "${ARCH}" in
 		done
 		;;
 	riscv)
-		# Please note the following code may copy a stale file.
-		for i in Image.bz2 Image.gz Image; do
-			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
-				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
-				break
-			fi
-		done
+		case "${KBUILD_IMAGE##*/}" in
+			Image.*|vmlinuz.efi)
+				cp -v -- "$KBUILD_IMAGE" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}";;
+			*)
+				cp -v -- "$KBUILD_IMAGE" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}";;
+		esac
 		;;
 	*)
 		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
-- 
2.43.0


