Return-Path: <linux-kbuild+bounces-9105-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8707BD4F30
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 18:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B2CAF4FE44F
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 16:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE091311C09;
	Mon, 13 Oct 2025 15:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JpKq9IXz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A72C31195A
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 15:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369992; cv=none; b=q83IIrmfW50PvPbxNhnwolDEUTYXCmdZquHGuEteix4ZM0N5SLNO4biminSK60yQgIHBdYrvh6RZilvKGuSOqE2Q84f2so2GnNE+hRkwmUPYpOyG9S5QmXxDMHMnxLsNuHwNoZmC14CgHXGF31Lah30mBQyqjpscHISL+iTk3Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369992; c=relaxed/simple;
	bh=Yif0tpvEVYMz/HHDWBkZZeP1JAtd0/nIT+vjnx/3i0s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jBnY6RL2CMDCmvlsckTRNToizednIgVIxhQXsPU7/DQUJs8FJhhBXGtn1env42eCQGvGWx3IROiL4X0Bsa87nUTIwgJ06rYngBss9StU/khm2TOs+EO/NLRXm2LEUZOruqkLGK87ajcCxcKzC5EyNQWo/tI4YAmJGEYN1TqIkoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JpKq9IXz; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b3cb0f2b217so682101166b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 08:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760369989; x=1760974789; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IjM8d244naCxzVfKtaINlZql2XGUpipFpM5gsitgK2A=;
        b=JpKq9IXzk38cNBC/fA7lYEgDxwtPgLsT0lLDax9AVeIl5xbvB7S1zLd6x3KMWwRDGe
         IVvbSZPchTG9ZvltWJCynYwRAIMbsXSnjy/+daHa+R1et3JyCm9TsB6B81SP7KgDo0dD
         99HYeBA5Pm7jO3m4atQx1DraZlNXzOdaAqwTkmqw2QlBnCaiJNBM4BxYat2O+29Yt4LR
         4xk08xBUksMPlctojrnE1FxVah7nM/VT3n9AaEbLfb9xgm78aHm3zoGiK85+PcU3zKJn
         6N5Ckr3K3wl5jUszdD5dwia3ZQuV/ZEfJ6OIeqW4qtlRNLe9qm3GnMpA04MNZPCCZOJK
         /P+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369989; x=1760974789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjM8d244naCxzVfKtaINlZql2XGUpipFpM5gsitgK2A=;
        b=KEwMolmb8xi8xujK7G/f9wXpBLAIi9heCQ5GKr748aMeMCEHl9sc6hh8zhhVcGa7Vm
         JYlwyUY8WuuJGB36OPWnzlcUmQQlaOiC6bmHaDJGdGlzEiu9ckO7ao1/+4vIFUFePP9e
         CsjZvUnbXXr8hUD6HOFdidRb3ttbhdCu2AI9TedLTIADvpxziAQwOwSNrocPWZDm/Bf2
         /jiqoBekIME7ihA1j3eoR1wEREXzTlhz88VKia+f2lX1wDvPNq2Kk5fuKU82S1Hc1EUM
         LhNrfctHTt9U1/21JelUFlG5G6Zo+NhpJFMZWJG/nOAp8hWG8kKWZXb0tJ6P7gZyPuDf
         7lhg==
X-Forwarded-Encrypted: i=1; AJvYcCWfaGUwRK5zBJrpWUyIgyk7XmoGMpbpPv+pU/O0c4vH63xh/XStWuUD27CCoyAZ5up8jGJ1uLOO2A8qEcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4x7ZO/msBdHAoWdf6+Ez4LbwCaQSWeczg1p9YLkqXShD/an2A
	Eoh+6bFJTKTlOPrD+DNZWSg6o4ykgmEZxQfaHr+mVQSpp69qPosL3BsLuy95dRk3elCB0a470ud
	8KNWgrYKNet8Ufmr65w==
X-Google-Smtp-Source: AGHT+IGiQtyP/1ptL42LsvljMNhOg+y+bM7AeQigA9x43JIE9KmSCt7yX9mzDsBi3XU7e8y5ilB7RsBmmAFdHxQ=
X-Received: from ejrp11.prod.google.com ([2002:a17:906:6a8b:b0:b2b:e1ea:68ee])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e8c:b0:b46:cc3b:65fd with SMTP id a640c23a62f3a-b50aa99e1ddmr2177629766b.29.1760369988766;
 Mon, 13 Oct 2025 08:39:48 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:39:10 +0000
In-Reply-To: <20251013153918.2206045-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251013153918.2206045-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251013153918.2206045-3-sidnayyar@google.com>
Subject: [PATCH v2 02/10] linker: add kflagstab section to vmlinux and modules
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

This section will contain read-only kernel symbol flag values in the
form of a 8-bit bitset.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/asm-generic/vmlinux.lds.h | 7 +++++++
 scripts/module.lds.S              | 1 +
 2 files changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ae2d2359b79e..310e2de56211 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -518,6 +518,13 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 		__stop___kcrctab_gpl = .;				\
 	}								\
 									\
+	/* Kernel symbol flags table */					\
+	__kflagstab       : AT(ADDR(__kflagstab) - LOAD_OFFSET) {	\
+		__start___kflagstab = .;				\
+		KEEP(*(SORT(___kflagstab+*)))				\
+		__stop___kflagstab = .;					\
+	}								\
+									\
 	/* Kernel symbol table: strings */				\
         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
 		*(__ksymtab_strings)					\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index ee79c41059f3..9a8a3b6d1569 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -23,6 +23,7 @@ SECTIONS {
 	__ksymtab_gpl		0 : ALIGN(8) { *(SORT(___ksymtab_gpl+*)) }
 	__kcrctab		0 : ALIGN(4) { *(SORT(___kcrctab+*)) }
 	__kcrctab_gpl		0 : ALIGN(4) { *(SORT(___kcrctab_gpl+*)) }
+	__kflagstab		0 : ALIGN(1) { *(SORT(___kflagstab+*)) }
 
 	.ctors			0 : ALIGN(8) { *(SORT(.ctors.*)) *(.ctors) }
 	.init_array		0 : ALIGN(8) { *(SORT(.init_array.*)) *(.init_array) }
-- 
2.51.0.740.g6adb054d12-goog


