Return-Path: <linux-kbuild+bounces-8145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3671EB114B9
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A2611CE4024
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB1524728B;
	Thu, 24 Jul 2025 23:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="B+lAwPkB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71ED1E500C
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400241; cv=none; b=YUA8U8EQtBMtq3kQqbD2HnwX5fRuRhpVyRFgwQA8JHuj6BnT7EHu6/vfPtcq/YdMAM+uCVRYdLdmeuCi2oiEATjw0Mnm6b3HXmQWCdcamYGYqZ8IFwDbnu2r3AyelEEZJn0F4ZxVWHOtqU7z/yRfg0h5jUeZ2RjF9FJFytTEYD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400241; c=relaxed/simple;
	bh=oxNgSu2OIKAiuhRCFS+U6NWNOSDM8tRYi8GHDM6kfVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceZ4TR1Pz03FjpAAUfTHkAeP/c5UJBTsk5zYuT5GpyOZGGW8gkV47qbSm/s+Tyv/cilRVjqDI0yCvQVF78fRBJluHhEdszLWVxEHyIjAa93DadeUopZZWPtP2mzSunz7Cle/U5wgNnCL02QDK1WOqYS4eiSSgA86qhHivGUi8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=B+lAwPkB; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23fb04ea1ecso728455ad.2
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 16:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400239; x=1754005039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOl3Nqiah3DIFqJnwAEdiPuuEwqhP+r/KN32JLcNnyU=;
        b=B+lAwPkBWC1vr4rfEHb+nyWMDXfz6svgh9m23gOWMSCHoa+hbE5+acwl9fuTn7LpE6
         CueibIrDdKj13kAWWLIYlFFqisFJnTWZfhZCDrDhKG4P8/kGMbiqR3NnwcYLfrxInRFt
         UWwej4k+ntBhp+dieO8aFAqWUwXJNkXBHiC+zYg8xDym6LnV9U8JknCm/Tl9gqcbvMsa
         UYUGRTJk/AIT8YpU5WAwrG/c4tc6z8RMnVyPeLwoIoTiagdgQebvKGOhaeVD0lHchJmt
         o7bLkaEfWyz6z3YTZ5I7KDVFc9z1BwAkxvQmYcAF24/8ILYSpU/JmP21x/n3KAlfXtzI
         hqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400239; x=1754005039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOl3Nqiah3DIFqJnwAEdiPuuEwqhP+r/KN32JLcNnyU=;
        b=NyJA4wr3vliWClVKlx3BF47rEBGUDz2rqStPISfQisM87P2OBf/WsMxI7N2fwgu3Ro
         nLTn5L4pVuD/NIKkPdXmrCtPZpWHD0ntnKKHSvBpmBkElneXjZcYpDpY0/2FhWr/AIFS
         IMfhvUtbz6cfKNPHesM4EWPk6l/ezb5ns4+1zbBengTWYcmwgfsDnOj1mSlra1BCXCYM
         78DODJAdjdfhJ9ah6N89Twk2DN7eRYx8Dqm3I1Vm61CMr6gXNjHg+ajgPNNyBwIQYSKh
         ZEvDxbxjoI8S53Q6gsGbNgwS9Zon0MAzhK9iF4jwuFIFMKa3eQROmVqIpkZXFDmImMta
         ANJA==
X-Forwarded-Encrypted: i=1; AJvYcCUd5pppyFXcQlje3qSHy9wWincRtE94IqqywmUgHvZEkrGQBKABD/0tXcUfwzc1GioiO9sN+WlZRkXyrOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLLEFv/pT/JFc3/1gvIahkuR5yPnTLlJEjy+W2ru3dFKPu9uN
	aTN/E5ds+5N6RBKBj3IjHWuWZttCXvFamTVOO2p5MMemqjDqt5rX4tzoTiyXa2xoqt8=
X-Gm-Gg: ASbGncu2Ada+lVa2IYv2+PoSD73Q160PCzQqFHpJRztZylz+mRzY/kOm7xohEhP1Ymx
	UGycc9deu7uPbD+U57Ihf1yd2oqdvKmfkmz9/y636sQtE5BF1ZoqeWkpTA5/w5wa9ZW1/F4NpN4
	Ofmx5ilAkyzGmWqLdmF9BLUzJWd3Tz9+ukrJG1b+R6e5elXpjjdCaeRl9PisffrGrBztjUJN+hy
	rHioJlY3qf4w3mYOw/j8oL+cKQO+R8R6I/ODx7DuMKJjwiczNAtkbRYGCobJ9y0530UL6OLH59Z
	txSjmJAB1giG0JiAb6gjnD9j2FhIu40C65iITlO+eddjE30I9V7Nsx/g2Oks+laSwJgKERtkgiG
	FTwzM7quxVWQuSvfC2pkQyls1ck3koUsC
X-Google-Smtp-Source: AGHT+IGSQSNsbZMV3011ClnOwbU01lkESEFEILFi40CGgrviIgB/I9wMU9rWnehZSismvHPpuGcGoQ==
X-Received: by 2002:a17:902:d501:b0:235:e71e:a37b with SMTP id d9443c01a7336-23f981aed8emr123582705ad.34.1753400238919;
        Thu, 24 Jul 2025 16:37:18 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:18 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:59 -0700
Subject: [PATCH 06/11] mm: Introduce ARCH_HAS_KERNEL_SHADOW_STACK
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

commit bcc9d04e74 ("mm: Introduce ARCH_HAS_USER_SHADOW_STACK") introduced
`ARCH_HAS_USER_SHADOW_STACK`. Introducing `ARCH_HAS_KERNEL_SHADOW_STACK`
so that arches can enable hardware assistance for kernel shadow stack.

If `CONFIG_DYNAMIC_SCS` or `CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK` are
selected, skip compiler flag `-fsanitizer=shadow-call-stack`.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 Makefile   | 2 +-
 mm/Kconfig | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 35e6e5240c61..7e3ecca9353d 100644
--- a/Makefile
+++ b/Makefile
@@ -987,7 +987,7 @@ LDFLAGS_vmlinux += --gc-sections
 endif
 
 ifdef CONFIG_SHADOW_CALL_STACK
-ifndef CONFIG_DYNAMIC_SCS
+ifeq ($(or $(CONFIG_DYNAMIC_SCS),$(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)),false)
 CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
 KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
diff --git a/mm/Kconfig b/mm/Kconfig
index 781be3240e21..f295ea611cdb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1367,6 +1367,12 @@ config ARCH_HAS_USER_SHADOW_STACK
 	  The architecture has hardware support for userspace shadow call
           stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
 
+config ARCH_HAS_KERNEL_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for kernel shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 config ARCH_SUPPORTS_PT_RECLAIM
 	def_bool n
 

-- 
2.43.0


