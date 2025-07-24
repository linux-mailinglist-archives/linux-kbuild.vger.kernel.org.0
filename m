Return-Path: <linux-kbuild+bounces-8142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78462B114B4
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9762FAC7DA2
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFE423FC66;
	Thu, 24 Jul 2025 23:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="V8nwCQMx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9855B24468A
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400234; cv=none; b=r4Ef5eOsOcEvRWMDN7P8PmiE5aC2SrGNUNTVg3a6wu1SQlq3pdwlAf7mgA7p78zCetyfSuggcx4gX5pmEH4XLkR0vYnkuA6VoONdgaCAl9BgBJyWkUgdh1pIW/5+ExJ7inja34jzpyf4PVk9020mphwxKnaJaqLZOuJWQpP7ahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400234; c=relaxed/simple;
	bh=TX7QOESfiwCfuH+ZcQKgbvec7xRD+j3+tnkSFJsy5gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gonGLoycTQBNf7Nd1uMWwsNZue0KAosmKdiAOws51fVV38MHTpkC/v0cnNMZVvCUSycUaxDQbMZ5XR73I1pEhHPX/I7gGGjZ0Zf3NaVCUrtPbBvRVfmTutJDdhHQl8MadvK3xrhhUV6W2EGm5da6SSTSFqXhPpxY6GxVc1LRDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=V8nwCQMx; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23c703c471dso27067075ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400232; x=1754005032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OvHRga/2x06e/3IXRCXpOvSv81ZyfpTLSHYXhuUCgAU=;
        b=V8nwCQMxaJRaZSkE8Q9XfpchnwOAf7K/akQyDpW56n89+N2k9ODBSN94MDijgvBOFu
         Ul8Z8xWijZVSsxSdLy5i6EOBaUgbcZe++36xg+HxnpPeZMWmwHFA/442N0aPD5vcJRvF
         j5wbSly+rBBlS5RowU7VhxN6PWie+cQGkVkQtqlXjQGiOXU1n7F/KjFARXNCynoLcDLs
         1fXz68Cj/Br+ycRQEMy0ca4Vp4RyK9iwg0kyBBfURBdBtyAPyMoGqQoiNEHy2WmOiVry
         IWfyrtBOiOWgagzJWqyjZ7BMsOmbpjPi2R77TF+PU+UUx+s1YnhA147CfLBxK3oxeE0J
         LCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400232; x=1754005032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvHRga/2x06e/3IXRCXpOvSv81ZyfpTLSHYXhuUCgAU=;
        b=k80PYLcm/TKn5J9o8bjsYuj1vD1Tt3DLEIPDsPWp4yycAvD/ZNRji7qq03eO6z9m07
         NPr3SerEeAjBfKyPRhTTRuHxBYQuXnOWWW8tyjvPYmBcLxfHtVdAt7ag3Fj7L/GZ17Di
         TVpb/ncdEAfbbkOsGc2i9i6lcB/EZhe+k+k1wFE/oowvTStjTikfNC5x+kBHztQUi1R1
         C9YSbhK0jgdKzRzdbVmAUoDL/uYTg1vamteM0WvvfMEhPogLTbAKt1hERpafJisUmqZX
         08TOoAXO3f6tTiYYAmp/L+v8tsOKV8XPx1l7CLGEqi3UqxaAUGVutnhfZkMiadK3PHfh
         cwig==
X-Forwarded-Encrypted: i=1; AJvYcCVNcXliiCiemdSQC0nayU4H3qWS/r2L6M+cPhSOZCZdwksDrMhICtbCkmDIVKgaHzBHqRzujBOLZZfluDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+oPdUbh1+ngiMcIgk6TloWdA9zs0yT5jptcyiA4Tpc/P3Vd75
	yLb73afnicYdSHQMTX/xob3ObaRUIpkbBlbwlWh6UVfxMutkIdJd/qEshrgd0GDZr+s=
X-Gm-Gg: ASbGncsZGLuZvigoNpl1aoIwow0XD0J/ppuMSmP6ia4ip/TgpNTc38AmHMvRpE0/tUq
	+Poo7jAa1IuP/finJWu4d39jKUubyrj1B+cZi2PQZsOe9FNtBZ/e5e5xOk3dj5DP4qkZCIQoppg
	fEpuhKBT/6gfV29+tewqFR9WBMP5ul+Bh+H9p8Kg8+m6qWDn0AyAG/ktyXoQZhgxK5iXEbKJp+k
	mnFBuwI6OJYlyKkkl3t4cfd+gd425aZBUuwhk6yUyvQRDu4Pp91OhFrUQaFf6jlXVclXxgSHu7g
	K+eivyqGumo3tZGhSLeL/1MCnxaKIFjkYZ1b29DHMlFM/p7a4aLTTQmamU4kykPkmmUAVaGAqvd
	GTX0SwVDUIb/WZ+mDdvok8zIOqPWoBn9R
X-Google-Smtp-Source: AGHT+IHlehaeba0g7zvJWooWl20RVESgD35SdGjk7uZPTtlJW4lACDouf6PruSCC8hJSgeGX0h9FOQ==
X-Received: by 2002:a17:903:28d:b0:236:15b7:62e3 with SMTP id d9443c01a7336-23fa5d12ce3mr54400555ad.9.1753400231958;
        Thu, 24 Jul 2025 16:37:11 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:56 -0700
Subject: [PATCH 03/11] riscv: indirect jmp in asm that's static in nature
 to use sw guarded jump
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
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

Handwritten `__memset` asm routine perform static jumps within
function and uses `a5` to do that. This would require a landing pad
instruction at the target. Since its static jump and no memory load is
involved, use `t2` instead which is exempt from requiring a landing pad.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/lib/memset.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
index da23b8347e2d..c4a318d8eef3 100644
--- a/arch/riscv/lib/memset.S
+++ b/arch/riscv/lib/memset.S
@@ -56,12 +56,12 @@ SYM_FUNC_START(__memset)
 
 	/* Jump into loop body */
 	/* Assumes 32-bit instruction lengths */
-	la a5, 3f
+	la t2, 3f
 #ifdef CONFIG_64BIT
 	srli a4, a4, 1
 #endif
-	add a5, a5, a4
-	jr a5
+	add t2, t2, a4
+	jr t2
 3:
 	REG_S a1,        0(t0)
 	REG_S a1,    SZREG(t0)

-- 
2.43.0


