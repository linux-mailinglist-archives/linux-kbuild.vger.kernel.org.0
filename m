Return-Path: <linux-kbuild+bounces-8146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CF2B114BC
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2826DAE17FB
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C94E24728C;
	Thu, 24 Jul 2025 23:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FnNunbi6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF66247288
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400243; cv=none; b=TpZ43MgNw9DYxjL8JdazbX9EXsm839HM/rofD8S24J9WuXb47RViB0D6OIDEk3nanVWOkovDXFVO0Z08cqkKv+ht9MT7DRPXEE23zKSPKE0LipySBey42nyb4zqiOziFqtbjfQBWkc5cgiPFYa2d50lxTFXXuHXI22jN0xvsL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400243; c=relaxed/simple;
	bh=NgW9QCO8Pafn6dRlZF7K76jleyDt5hjCF27uUi1KY9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZRQoC+adTboSMbHVqd6cgaRpX/YemU/IN7Z+XLadOvvJCH/1d2iYfEE+oTagxBrCMp9DNmCWt+aYnXxxI73KiNUfPVDfBse1QZsM8wkzTnJQqR3ZNop0Pv7RSZS6QraTGPTfi/7XJEN4A2mDRMGqfv84ZkFr+XM8AvE4ne8vuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FnNunbi6; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23636167b30so14482235ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 16:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400241; x=1754005041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yl+fpaUgVvAgmSBmN0Uf0wW/gDpMMKoNCvx2z4Q9Om8=;
        b=FnNunbi61GteEJNcipCLaMfLAkbylfTu4Mwmu2m6HOIMmNv6/qvM28KqM2gPF5GW3u
         vQ5wPCT9o+ayYHg/OU1JrE3PfgpA4wz/hXi7Rla77zQdTZxcTN/0ga0xPWzT2jC1S/oR
         Z6iXv3dsPeFXOYqeQeafSeUaAuivNFYve09+oLWem4wcVDNzrNOXFgRIiwNmOMFBXhXX
         Gle2JynBBETtnP/ybieu2Uzej579EVBTr5mryBiMznWEmK7dxoSBN1TDdXIyfnTwb6G9
         q05BA3eXjC2v0k7bMlaO/BtG57zSKXS6AwoCDLTrDu/ADL38Xn/PuzX0m9KVsGYpn+yj
         0F/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400241; x=1754005041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl+fpaUgVvAgmSBmN0Uf0wW/gDpMMKoNCvx2z4Q9Om8=;
        b=HckobTMpj90A0bPlJWc8mB3z0eQBB6gRcx6LnjMIoT1BCHLWrz8butoiVWtBPFyYbF
         nbZmwMwzBk3a6FPa+6BcGm2uP2Gya5xwhJeflG98MelFDvfJEUb2ISoxlUt9I+Rnaxcf
         F/esVvyUW4uM67ANoD10brqwm6pTHKj3xXr70IfW1lHCny+r1Zi12LWHkO4Rc1K9xrG4
         2ixMthh69U8P5QBFj7o4hojX+VyMB9wbxo4gA/Cn2YiEuyA0/VcHxiGTcq0clGWgx50s
         GQC4XAqQwzd01sc0bLN7rLCZgli495OSNLL2y203CmGGltQU5IYr1l8pAmQxR7de67tf
         BVSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI1ArQV/2C8w5hGKOBMuqqBxnIBHW/3/RKFanr7w0OvGQEOm0aVJaag5knYKw8rDxPQnUv3Yup5cOaxaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiCoXsPtTwRDDNXIYsiViDlZIx7YNkVXbwiMVoGWHF54CIeqYB
	gr/z0N7hvwtaLP0U4WHWdgrP35jBO0DfgsJajn6oou0qpPBcrCXnG5wFJ1hBSx5U12U=
X-Gm-Gg: ASbGnctB+RhT02IGK9cr4EGL1lyVNOT02JdvCTeqnUd6xccMikAKOIUpD/9H/HJ4hRA
	BmcEib5mzcDv8qL22gFzYTvi7aZSXcHKQmeJQA8I8gXJHMvYlqZ/GJwuTJ/w4vdb2B6O9yiCJjO
	e0BjpGGVgINiuF3ZyzWUVFM5w5/G991tOGvitAt3KH1JGSMWDHvi9WFefMuniXmq//InzXanQsE
	IQwxT7oVtFEZUKZix5VyTs06/QRx2msq3MEsx0s1M7R8EButJNUNmft7kXhsfjDdT4yIHy3Zwq9
	spu1GLCtqwmwNYVHuF+AV4fltiijnBHHTZEn1Y+lcetcDZgldntEGPiWWUATfOxQ6aUTijIqls5
	OQ9DqojWMqjTajMoqTKiVgeHxS3cF68QO
X-Google-Smtp-Source: AGHT+IEFvddaBDkybC2q7ob0zwYNRuGaOi2n4X57ciJYKI00Yd6EYfDqXnoJ8jUoGCKUz8NAesStww==
X-Received: by 2002:a17:902:fc48:b0:23f:8df8:e7b1 with SMTP id d9443c01a7336-23f9820d012mr133037965ad.32.1753400241217;
        Thu, 24 Jul 2025 16:37:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:00 -0700
Subject: [PATCH 07/11] scs: place init shadow stack in .shadowstack section
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-7-04b8fa44c98c@rivosinc.com>
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

If compiled scs and arch kernel shadow stack support, place shadow stack in
`.shadowstack` section.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/init_task.h |  5 +++++
 init/init_task.c          | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index bccb3f1f6262..a2569cc5a7ff 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -40,4 +40,9 @@ extern struct cred init_cred;
 /* Attach to the thread_info data structure for proper alignment */
 #define __init_thread_info __section(".data..init_thread_info")
 
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+/* init shadow stack page */
+#define __init_shadow_stack __section(".shadowstack..init")
+#endif
+
 #endif
diff --git a/init/init_task.c b/init/init_task.c
index e557f622bd90..e21af9db5c09 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -54,10 +54,18 @@ static struct sighand_struct init_sighand = {
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
-unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)] = {
+unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)]
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	/* shadow stack must go in special section */
+	__init_shadow_stack = {
+	[0] = SCS_END_MAGIC
+};
+#else
+	= {
 	[(SCS_SIZE / sizeof(long)) - 1] = SCS_END_MAGIC
 };
-#endif
+#endif /* CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK */
+#endif /* CONFIG_SHADOW_CALL_STACK */
 
 /*
  * Set up the first task table, touch at your own risk!. Base=0,

-- 
2.43.0


