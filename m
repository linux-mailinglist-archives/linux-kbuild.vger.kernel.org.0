Return-Path: <linux-kbuild+bounces-6396-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F576A7A3F0
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 15:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F8457A23FB
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 13:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B30E1F7569;
	Thu,  3 Apr 2025 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XhkYdDOi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF9233981
	for <linux-kbuild@vger.kernel.org>; Thu,  3 Apr 2025 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687737; cv=none; b=SExyJyrmMFlsxnumakUXueic45TtxJ0qmyxpN06MQc9VdcxuuA7PMiUCM5mvQeHpGQCLdDHbmfv9GQUjID+1lCNpECjbdozZrhzDjhOcHtx1a3cwmgBbm9jp4HxvBdB0+GCCaXTv2PG0Jd7EEiz98L928KHH9Y0iZw1elT4OlrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687737; c=relaxed/simple;
	bh=UwqrUYs/tDmcgi/laKzxLNjN2dD0BKH+uhvk77Z3gD0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fq3D5oz75DGvhmPvAABaNUtfFky1FZOizn20Dth5m0HvexujzSNA+9RDKx28nClkbU12RAikZtIGLMEBITgaMgjM5q0+Tr5K1MNmv7LhftMz0M6BgFOPl1lidHi6Dye8BZTCiGWYGFSBmCU+fz8TrEi0omP7kylvdQVFRNw+mq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XhkYdDOi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso565523f8f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Apr 2025 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743687733; x=1744292533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KzSv22Tlh8b0C2DIJrcJuTRBaLWunIy9hBuJEBnkWz4=;
        b=XhkYdDOi4gPRR6YKaqy/WNAmfxVbPfGBAef7k3aryC7X4LIWNzvb4UUQKcQVYD+nyC
         53vHu2OAQ8Bam6hj6U/ijL5w6a1ux85KkYRR4zvtr5sVoSdWto9xqwBsBeSLXxINNGbU
         kJZHX4pkxw21pCwIxjxQjw4h1q7SkC0raZtKnHvTl/WfQL6UdzQSkFXhjwF1GQ806brt
         ZA8eWDW3YwSE9Alz8d7IDV/SpWYOfa8D4gY+2RhPqHG1vTsJ3fR4FAn44hk4TrrR0ABE
         TNA7qvz5wEpKa+NeL4KtW0YMWs4Sn7ZbVUYmbug9NiEe90cd7iv/HaHM3Zdrd5fTASQx
         QpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687733; x=1744292533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzSv22Tlh8b0C2DIJrcJuTRBaLWunIy9hBuJEBnkWz4=;
        b=aGBbjoX88ePxkyhG1x509j384zPhnMvglePgM+cAAh6Z2X3qis5QRj8TAkQRm3G58y
         jmPZLs9dUW2kDD+NpG6lR3uyMSmdgtxuveIpUfYaS0HoVx8TsuQCEvGmpXLJHAuSm3rW
         5F0ZbNcYVhgD95kWB+w/i/9jLZmgB+TggCp+K73YkfQfeL/j2U7O7w/C80yfhMwhtCLy
         x+bnRQUR7CHkdmlG+Tca3xYiKNed1yDbxVKF37FdU1RMwnmv4nkdpo+w4X+aPoXCnC13
         Or98inqaijqVmvSMALygkBRlklUYiIsF/zDWToxScEXm12Z+CAxrAMgMUUu+luL9qnF4
         1MNA==
X-Forwarded-Encrypted: i=1; AJvYcCX5WAVy1Em2/Q1RYf9yzATL3Bwgl6JvFhOJ1k7PYhT4LCkkZ+Rgjs++/y7ddvkPvBa6S5BEtabKvMml868=@vger.kernel.org
X-Gm-Message-State: AOJu0YxySqQqyhcp8w3eSUxy+a90coOhUTxuNO07bXPWps9TRcDn+6pE
	xKHIYv7hlxxdWsOQab26Qv+RuCA38JyfOHB9kT9lsmgfGS/eQ8+9xpkdEmq47rg=
X-Gm-Gg: ASbGncsxW8nh7/oKFG7JUmJujkelhvARDAn4faImAhCHgiAMExMAfgumSwH6aLz5wRG
	CHzg5tF7OE02LTplC/n/sbTgfP2d1Xkeco6e9Lvck0yPa4Rkk2A45AD/OyVyptXRzVgZwy+6hG9
	d1W393Z0j+3Fe7dmWBu00Xp61apnRz9LnJUjnJEta3E7YoqWYhevUcQFUEEVoTuWMOd68klBApg
	tVbl1z/xpAKq7qiGbRRngSZcVoJOoiogFttXLfqiVBJMQBySMj9BWZRs82/8De5KQhGqIolP4wX
	hCkyhpThXkhi1s7YzYLZiLUC2rCsddwIq15Ai30FQY+i6VO3mWll6tzaPsRfsRvPKOCIJJ/iXvw
	=
X-Google-Smtp-Source: AGHT+IGq/wOsMPKFUCVYs7nL4AsOHO70+LxMIkYWJmXF6+zZV/6eUJ+XSIteFv/WFh6+yfsrGoEdgg==
X-Received: by 2002:a05:6000:1786:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-39c2e617779mr3043553f8f.10.1743687733190;
        Thu, 03 Apr 2025 06:42:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:7c12:ff06:d34a:d3e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm1854884f8f.53.2025.04.03.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:42:12 -0700 (PDT)
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
Subject: [PATCH v2] scripts: Do not strip .rela.dyn section
Date: Thu,  3 Apr 2025 15:42:00 +0200
Message-Id: <20250403134200.385077-1-alexghiti@rivosinc.com>
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

Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cad20f0e66ee..0a1f1e67a0ed 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -377,7 +377,7 @@ quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
 quiet_cmd_strip_relocs = RSTRIP  $@
-cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
+cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!.rela.dyn $@
 
 # Gzip
 # ---------------------------------------------------------------------------
-- 
2.39.2


