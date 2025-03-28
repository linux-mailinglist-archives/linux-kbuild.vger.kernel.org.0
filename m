Return-Path: <linux-kbuild+bounces-6364-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF48A744D6
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 08:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDBB03BCAD8
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 07:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670C021018A;
	Fri, 28 Mar 2025 07:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="I7T4ot0G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E880211A23
	for <linux-kbuild@vger.kernel.org>; Fri, 28 Mar 2025 07:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148543; cv=none; b=T5VYIgZVQgmnBjnENa0wOKAflNYIQtfxT3Qw3QS2JItLH4m7czg1lgD+z7QgKyhu2zq1eE5ybLwrPTCK2/Vpv0jOF+VJ699e0RYcTNrjle+THWompG0iKwcm9Y1EBgZ4EFI5LiGm1v7yPRb1gYQlJWHqb4TRilf083AIDevPzBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148543; c=relaxed/simple;
	bh=5gE0+pWhFHRz9btaJL/6qjKTWiYWX32cx+TvHAe5OBU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=asHILFZ6BFU37SVZ9zxwjBBFZ5IvuCXMLkyLizTHbq0SW1V1+veP/Met5GV/C07RXsD3Sm8p59I/C2kL6szGbem8ZpzOO6ZPnINz/Lze+/ttVHEODewEQ7CS2oWwjYK5kc/dtFvq6kxxaGKVLUMhxzUHDv6p188IOyIjX9MnrNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=I7T4ot0G; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914a5def6bso942080f8f.1
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Mar 2025 00:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743148540; x=1743753340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qmXH6tUdBhyxCuOKPx5cChdmd3dLaKjPLtkEvOC6Z4=;
        b=I7T4ot0GBMZ+jADxZa/s1qcO5CG4NBo1dlWugsZSd+6LHk450rVlbJAt+8TjFIsBLB
         oDezXvb7jXbO41pXlf1pgtQhwWDYvTumDfTCWs6DQd43usimvyNYPBHiaYqsAtFo9NLO
         2pLY91Zs4YTyobC9s0YAj5KPczBd1nhUdbTch9bFgaKHD7viEzZYh9rzmYB95Oe5PaH2
         jBXU7aQgdCOTgsMLM/K9F4LE6wggz6dD4WZoki3MeVRDPFqEAvIdmlBfbatJBgKA+GBy
         qlV9cUWIuLgP5QjOs7evyYDGV/1ppypBaUcxHvwdcc1NLBwXJkg5P33Pw7dy1ULL3KL7
         Sj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148540; x=1743753340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qmXH6tUdBhyxCuOKPx5cChdmd3dLaKjPLtkEvOC6Z4=;
        b=bLFGzSFBTX14HjR4aEJp4dWf0yZ+elCYln6EKuOlnWzNAM0VjcayLQBw8s3WaaX4ja
         U61cKzRHOzgfBcG2XpkERHp3v33G+tDhFz1v53oe+NZEz0esJmzp/tzzTsGcDtXiOju/
         nEGofnBrpvrg+LHU0YbSnDfhmpFcv8p79bsCUbJoJbEueaZhhr8REcjzDl44+TCdEDTq
         Idv5M1iXdLGcJsOuPcWqR2am2aF2V7coLx3ndkFGvmUzPcSXaXop0o3FXatfaiiQPjoJ
         JrZdxIWi8eJJmTUNa3nOQ2w9FqoUkmbW8jiLaYTA1rWd38eAWDf1AKp7GYp0WqE7xOPk
         WI2g==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+1EoHXQZZVSvGJHxn2NOMHo3R3yDDsZYU+VP4VdtTjzQNN1bxFBqlpaaKMPWnQdznLJ27PEJVbJ/B9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqHm19YsUue4W/zBrOhXjE8vReRvdQ66YsIaa4qmUtvDt6MRu2
	c+6VM16eecifWuxNhxnRIIPnNYTnKxNGIed+jwok88Qf/eJxVKSi2kVxLzma9PI=
X-Gm-Gg: ASbGncs+ZnLzyHHSZCGXRyK8woIiEy+7K433qZpSgXESP/Lt16zhTrvCgW+WoWAp+Wm
	ADyTYZdHio1QtZQOdeC7iBrvitl41glBUgCixSLZMapgrTVS5xGiHswjLJbXYTQtlRxrYAfrdMK
	0X0G4gR3Id/CK6oWs4rLNH/Xcu4+DSQUxSeqqRU/K21yHtnLCX14Rw3aPG4BvnJkPafrkDJeV6Q
	cgl4dAl5Dc1KOB65vz3JPKyli4lTZHb56omfgJ+R+5uDNSO/OJVPZmHMgXDM7X9b6PbDpHAYDU0
	K1DjzqjAA4a0iZk0YMJMK6M3xJGC7MLctgcxW2c//36QTUOa/RmFuxwEag0nj/BReRQ=
X-Google-Smtp-Source: AGHT+IHCOMN8uZ+u+tWvAykTfDphcLmw89KftNnGG3qlRnjiUHtvL5LGK6mVPNUfynbX4LuKd5+uqA==
X-Received: by 2002:a5d:6488:0:b0:391:2f2f:836 with SMTP id ffacd0b85a97d-39ad174bf52mr5128871f8f.17.1743148539525;
        Fri, 28 Mar 2025 00:55:39 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([193.33.57.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a3d66sm1799249f8f.81.2025.03.28.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 00:55:39 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] scripts: Introduce ARCH_WANTS_RELA_DYN to avoid stripping .rela.dyn section
Date: Fri, 28 Mar 2025 08:55:36 +0100
Message-Id: <20250328075536.238782-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

riscv uses the .rela.dyn section to relocate the kernel at runtime but
that section is stripped from vmlinux. That prevents kexec to
successfully load vmlinux since it does not contain the relocations info
needed.

Fix this by introducing a new config ARCH_WANTS_RELA_DYN that prevents
.rela.dyn to be stripped.

Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/Kconfig         | 7 +++++++
 arch/riscv/Kconfig   | 1 +
 scripts/Makefile.lib | 4 +++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index b8a4ff365582..d93f50ecb8f9 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1544,6 +1544,13 @@ config HAVE_ARCH_PREL32_RELOCATIONS
 	  architectures, and don't require runtime relocation on relocatable
 	  kernels.
 
+config ARCH_WANTS_RELA_DYN
+	bool
+	depends on RELOCATABLE
+	help
+	  This prevents the .rela.dyn section to be stripped from vmlinux since
+	  it is needed to relocate the kernel at runtime.
+
 config ARCH_USE_MEMREMAP_PROT
 	bool
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..d58053efa4e4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -84,6 +84,7 @@ config RISCV
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	select ARCH_WANTS_NO_INSTR
+	select ARCH_WANTS_RELA_DYN if RELOCATABLE
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_WEAK_RELEASE_ACQUIRE if ARCH_USE_QUEUED_SPINLOCKS
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cad20f0e66ee..e59210a9fde0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -376,8 +376,10 @@ quiet_cmd_ar = AR      $@
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
+objcopy-args-$(CONFIG_ARCH_WANTS_RELA_DYN) += --remove-section=!.rela.dyn
+
 quiet_cmd_strip_relocs = RSTRIP  $@
-cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
+cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $(objcopy-args-y) $@
 
 # Gzip
 # ---------------------------------------------------------------------------
-- 
2.39.2


