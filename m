Return-Path: <linux-kbuild+bounces-1727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 996D88B99E3
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 13:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C36A1F2447F
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 11:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD7A6997B;
	Thu,  2 May 2024 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="cYQ5Laz6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF4464CE9
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714648588; cv=none; b=aTkKOXPttnPkY4e/ee/1FFvu4TFxpGcYzXDYZif16ivucz7hPy8xE73Sv3DCac8bSSyXAQpT2TWOnuojTHnuPavb7XEvAl/Jm1w1Yaml5rkEnjdmobijdweaK9Zzy/QFORtqdu5MAONgrVLQVcjkkjpZ546y9/a2EWLswVSh6PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714648588; c=relaxed/simple;
	bh=jAfPxDaZQf+Z3EoMBa2T7YQWg15qnOSgj0+XC4k/BRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itSDbGvDeu3A+nTQT5THaoH7HcTg6qNB6sgU27PqESyyLvzIqZxbXeL8H/DvwiQb5Z7CwUTVXWymF5+pMey/JR9u/1Ubmn3lbIohExGjUQnS5UyP+YuRejpe0pB7Fw1LiaSt+iDRfScEXxkGrV9sGe+GNbG2kKVjHTD+/zOET5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=cYQ5Laz6; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 83EB03FE65
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 11:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714648583;
	bh=9viCGe21wce589SPhaLpq63lHm2lNcUSGMl+Cs89goo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=cYQ5Laz6Tc1+9ENHzXCRgqMYkYVj8L99N5CsyEukH678PeZKJo0wJSD3IvTYaBe3E
	 Pm9rRGOd2VjEU6w2LSGIcfuMgun6vsOPRWFi4g3guJcxALpDKvyFjNaKaRA2uOSptW
	 hQ3vRCeMyW3LX3bjozwGkba81OS5hKLpeq+B9JBlWMW0+IIx/Q3MuF6heCJImaKdeE
	 kZ9Qeg3ZmMhx4Jw49nshZpXo+ylU2Vi91XeskMDxMwZWEFQV0M3MtIkYRqhIKlotMJ
	 pnKjqRm7L1JE1GNZhR7oh8DqBcGmP7g8FYRHZxfoSE7HY8ks86F2+aNBQPlGJG6LBi
	 yo5ObIip/2jAw==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a595c615537so70648766b.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2024 04:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648577; x=1715253377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9viCGe21wce589SPhaLpq63lHm2lNcUSGMl+Cs89goo=;
        b=bw/hVvQ2oNbiHfP4FJS907h6dBLeeqlhjsbFCEBFjF3pfVqHthUJj2T54Jaf6ELNLC
         OuMThJ5q4nn++hSLZbvRZFPpI3Aj1w0EdPy29sypqFx2zgH5AKchKFAjnvT9CZfVRjSo
         2/zv1rTat6pA2dwJsTGsJLQcoxMrcLoFDzqoInWN/x2oAdhw04cPiBlbyDTZwk1eUkXw
         /BDEkCF+iVqZtU2RTliU+IcBFK9z7xwIzL/NAbYCU80JK1FM4HNSnEWvP1kWVKVjiw8U
         VvpSgPyBqFPetzz4y+sd+ce/4GkVsjWYmfrZjGeQEsVhfrc7948FGRXUPez0HzZZZXo0
         56mA==
X-Forwarded-Encrypted: i=1; AJvYcCUucPsT770FfbqKo6Mr38T+ksI6ITZ9i93NHy8wbL7h2Tl0/Jm1MMbldCel4PiwNJy42hWeIRjhPiJV3eqQPNtgmGCDTJLXPiGy4wqp
X-Gm-Message-State: AOJu0YzgwvRw2Coi8FUTwp9mLn+u0UcHOWvIWrkJKMQ+FhD2ExH4/gXx
	ivkEuq5LdP9mJt6C9bhhVzMDrOnlHYJG8ceifXz43K4op6V+5WkREuYx3n9g6vYE8NBAUjtJqKB
	T932ut5BDE6/zXUkM738f/1+GVBeD9ZTt8SAteMLLhaHhA25DbA1nv+nrpeJnWIuhPnqllIqsWI
	SGwA==
X-Received: by 2002:a17:906:2555:b0:a52:19ea:8df0 with SMTP id j21-20020a170906255500b00a5219ea8df0mr1225321ejb.66.1714648577761;
        Thu, 02 May 2024 04:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0Myo75XOgrFJPJUQRXhMKXEEwYehp1jVRMzzcbJCBYoh68rOqDmHMkFSk+66SPyDzmCEKDA==
X-Received: by 2002:a17:906:2555:b0:a52:19ea:8df0 with SMTP id j21-20020a170906255500b00a5219ea8df0mr1225308ejb.66.1714648577553;
        Thu, 02 May 2024 04:16:17 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id gs23-20020a170906f19700b00a4739efd7cesm437278ejb.60.2024.05.02.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:16:17 -0700 (PDT)
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
Subject: [PATCH v1 2/3] riscv: show help string for riscv-specific targets
Date: Thu,  2 May 2024 13:16:07 +0200
Message-ID: <20240502111613.1380453-3-emil.renner.berthing@canonical.com>
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

Define the archhelp variable so that 'make ACRH=riscv help' will show
the targets specific to building a RISC-V kernel like other
architectures.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/Makefile | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 29be676415d6..024482c68835 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -202,3 +202,20 @@ rv32_defconfig:
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


