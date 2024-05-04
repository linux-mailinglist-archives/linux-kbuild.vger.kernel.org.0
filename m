Return-Path: <linux-kbuild+bounces-1770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E138BBDDB
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 21:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17ECF1C20CB0
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 19:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF6284DE3;
	Sat,  4 May 2024 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nWYmfSps"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880E684A4F
	for <linux-kbuild@vger.kernel.org>; Sat,  4 May 2024 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714851298; cv=none; b=WCxPrXgeDV3NtslJuVlRSDg1fhXnC1lk4xHiPa3CGk83KH7NlJAc5pR8hc4gHoTbs7A0jfypao4Ibn2mWVQEjXALfa+sT0+XY1K24GiwmvUdM7VTgIzBQXXDb2fzx6PmL434KgXmzWwBXEe4NUoGcWM7sX0wMo1cyiq37/SLwTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714851298; c=relaxed/simple;
	bh=XEaqV9XPEDvIoeqoy5YW/LRhIP0/gA4kZoNFKJC8XUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sf3ch+1LC9DxBH+ZtZRn25SGEgwhPv5TLfPfYg1C2VqI1bZ2ZzxNqYUhroaeVq24ZzhBWh7Wuot23yZ3/3FMHwETzFqwbiHGDq0zRp6acPbmaVZe35gd1Y2+GpeWItXtolcKmFdUXnp70OWUu/MpNXkkhJMLnZ1zOYDUbHpS1uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=nWYmfSps; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D5D363F1EE
	for <linux-kbuild@vger.kernel.org>; Sat,  4 May 2024 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714851294;
	bh=oOLIaUL1ksCYikVh+tjyK0yztXrep94eIS+0vADjCFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nWYmfSpstEpb6gXasL1OcKvQN2WddkBbMMjRglv3T1Wl0GeuakSjmAELTTcyi2egr
	 akIrin3G4Use7ANU8v+YgzLEUxjxG0LKZsmEkNpGcrd5cMAfhXrkyL8gxtShyZ0Ngv
	 q8fhQKlFL3dfOJhKEC3n4cnOiWIQsUs9J0GZW6tSPRoqp0msAvFXNHFt0XYcQE1f6N
	 btFtw0HRFed8Cn87gpUsuTD5WCntAlCefdEZ5vh1t6F+DMsu3HdlrqB7lmCcSs5DCc
	 2YtnNui3jgWZekfBUe9N92kxn9hxkidKk+JsaBsqfDWlz6ahftundeSx0V199GTDZy
	 +NPyHSm6Adtcw==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a58bcb4aec0so13434966b.2
        for <linux-kbuild@vger.kernel.org>; Sat, 04 May 2024 12:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714851291; x=1715456091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOLIaUL1ksCYikVh+tjyK0yztXrep94eIS+0vADjCFU=;
        b=sGE+yeTf/94L1zGjy2MIUoHfG3TNcDH565svj9YdE/euSr8rWjdRsz6kMwbGQoYQ7r
         TlYatPm3xkHLtIgKvdwhTt+81gNDgbabxV26zucXHUVkNvTmx2/IZ2GMbSIYXdubPUQq
         NSIM2eyhykS9ZcGeIipH3+UCOiQAsVDYg1IGZYQo7j3+2MKiCkj7w5w8jurL4g39w6Wl
         ggViiOAXTgbSO9oiq4eeoqHpu8zNKmgvD07zgLiYqBdP8Ju9zWsgCG0LH87hVXif+qtu
         jAee5I/7QKPGTpWJnTVK78HqLHVW4OA5ATdoukmyC0VKTPhZ2K4M2UYB+Bg6oQwkfxvv
         B+cg==
X-Forwarded-Encrypted: i=1; AJvYcCVVzf33hFCGXNtpq0c4YbB3Yon2SAcS2kq/5ki7/R5O9ykiPLULuf4jd5876l0fAgnUSDJfDgDsQRo1nQWkRoF55Zf4DkA90t4y1FHG
X-Gm-Message-State: AOJu0YwonqOGFbjmO0Tmq58om28PwEieMsKVlskTeb3BwKxn/fZoOwBg
	UUoNFjwTnhT2P3ezBzbsZLYTRIjm8UiN3FXQf9I4jAswVQn8hAO5Z+O4QHOMHNiYuH6TJNplr2D
	5k9lkLgHcEHhyq2aw2HjCK5XRPfGcu9rCRDLpQbJtr/qy1fl4ENL8ThU0uWrzj3hE6dNhPLDBO/
	dx/b8IMXlbkw==
X-Received: by 2002:a50:a693:0:b0:56e:2cb6:480e with SMTP id e19-20020a50a693000000b0056e2cb6480emr5037844edc.38.1714851291520;
        Sat, 04 May 2024 12:34:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxa0bKw9XZSPRzRQBk5sICnCx31i0zneLUhKIf2Xqa/AxILKx9IuvkMH2j2eNM0zWghhKyQ==
X-Received: by 2002:a50:a693:0:b0:56e:2cb6:480e with SMTP id e19-20020a50a693000000b0056e2cb6480emr5037835edc.38.1714851291333;
        Sat, 04 May 2024 12:34:51 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm2227021edb.10.2024.05.04.12.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 12:34:50 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v2 2/2] riscv: show help string for riscv-specific targets
Date: Sat,  4 May 2024 21:34:39 +0200
Message-ID: <20240504193446.196886-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Define the archhelp variable so that 'make ACRH=riscv help' will show
the targets specific to building a RISC-V kernel like other
architectures.

Tested-by: Björn Töpel <bjorn@rivosinc.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/Makefile | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 07ff2f34f0dc..ae51720199a3 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -201,3 +201,20 @@ rv32_defconfig:
 PHONY += rv32_nommu_virt_defconfig
 rv32_nommu_virt_defconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config
+
+define archhelp
+  echo  '  Image		- Uncompressed kernel image (arch/riscv/boot/Image)'
+  echo  '  Image.gz	- Compressed kernel image (arch/riscv/boot/Image.gz)'
+  echo  '  Image.bz2	- Compressed kernel image (arch/riscv/boot/Image.bz2)'
+  echo  '  Image.lz4	- Compressed kernel image (arch/riscv/boot/Image.lz4)'
+  echo  '  Image.lzma	- Compressed kernel image (arch/riscv/boot/Image.lzma)'
+  echo  '  Image.lzo	- Compressed kernel image (arch/riscv/boot/Image.lzo)'
+  echo  '  Image.zst	- Compressed kernel image (arch/riscv/boot/Image.zst)'
+  echo  '  vmlinuz.efi	- Compressed EFI kernel image (arch/riscv/boot/vmlinuz.efi)'
+  echo  '		  Default when CONFIG_EFI_ZBOOT=y'
+  echo  '  xipImage	- Execute-in-place kernel image (arch/riscv/boot/xipImage)'
+  echo  '		  Default when CONFIG_XIP_KERNEL=y'
+  echo  '  install	- Install kernel using (your) ~/bin/$(INSTALLKERNEL) or'
+  echo  '		  (distribution) /sbin/$(INSTALLKERNEL) or install to '
+  echo  '		  $$(INSTALL_PATH)'
+endef
-- 
2.43.0


