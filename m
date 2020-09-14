Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDDB269386
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgINReT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgINR2H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23B8C06178C
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:06 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so821225wmi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=giQoIm7ww9o7WbiRNjhgzGzCrffBGGule76BQnYzoVI=;
        b=uI/iQaAnhz3Rb1rxk2fe04dFKCupBX6ghPL7T1uUwqbl92dUULrnTdyKTCk5O3kQ5A
         JRjuhoIY2N1UVpWIl9QtCEy/iGMZnNG41xPQCXLPEJpOF2Tpd6sp0KALC2AD8lgXTu2j
         bUhIOKUvEicaIOZsb2+fYEOfBzUZ1nKGsTGcJ7O25/87/uOAalz5qnul5IPGNfg+fEqg
         xwQ/11H9wYnyUwG7mCMtj8+Uj1pYNYZXNe9fanGcdlFzOTGFDaPukkC2wT/8/DrREZR2
         5cSu5T12OjmTPxWAQR/2dka541vyP0ossBIVmncwMUbW/+IU+sD/AgHfEeqZLjuhn9/c
         PkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=giQoIm7ww9o7WbiRNjhgzGzCrffBGGule76BQnYzoVI=;
        b=IazLe2uLZtsY5q1Z0M8XQchWlQkoXkZP9c7Uf46a6KtclZDjrDv2ah5eYnNR8KSsXM
         b+3XXLClFcjGq9XHdrRYCsYea++p/oSP8PA4Pifn5JCWTGYBNuXCXoG2rhqa3gwTJAjr
         JcX++JrbCINNqyQzZHCcApLeNxd9tvI+9eS6ocEzvBnCHKHnWWwm5fg+CVFwg4MGK+nS
         Xz+wWzZcaaQDHLHZGpTVVVpta4YyKfBS6uNKhGQ5K7d6m/1l1nP48yyKC9FCS+BceYXA
         /Kmw10WbJtI2ZVGjGEDXPNhwwHoHwJOhnPIFloj0p2cWj4peyS9DNZAN2z3R0dJuuifJ
         OVaQ==
X-Gm-Message-State: AOAM531zHVVNihL/e2m7ZDjgswC0LsiKV4HTM0/cvfPSeVi111H+BsHn
        up4WZRD4PiARB6Su62a1zToR0A==
X-Google-Smtp-Source: ABdhPJzIM8L5QBOZ1G45T6rFbKm9SssKcSzPM7wAmTlp7uD3PTPktsRiE4T2L0aO6lTWC6jHotleiw==
X-Received: by 2002:a1c:f608:: with SMTP id w8mr432260wmc.161.1600104485530;
        Mon, 14 Sep 2020 10:28:05 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id o9sm21315846wrw.58.2020.09.14.10.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:04 -0700 (PDT)
From:   George-Aurelian Popescu <georgepope@google.com>
To:     maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        natechancellor@gmail.com, ndesaulniers@google.com,
        dbrazdil@google.com, broonie@kernel.org, maskray@google.com,
        ascull@google.com, keescook@chromium.org,
        akpm@linux-foundation.org, dvyukov@google.com, elver@google.com,
        tglx@linutronix.de, arnd@arndb.de,
        George Popescu <georgepope@google.com>
Subject: [PATCH 02/14] KVM: arm64: Define a macro for storing a value inside a per_cpu variable
Date:   Mon, 14 Sep 2020 17:27:38 +0000
Message-Id: <20200914172750.852684-3-georgepope@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200914172750.852684-1-georgepope@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: George Popescu <georgepope@google.com>

Use the hyp_str_this_cpu assembly macro to store a value in a per_cpu
variable. This macro is designed to be used inside of the hyp code.

Signed-off-by: George Popescu <georgepope@google.com>
---
 arch/arm64/include/asm/kvm_asm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 6f98fbd0ac81..200bb8d0a720 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -211,6 +211,11 @@ extern char __smccc_workaround_1_smc[__SMCCC_WORKAROUND_1_SMC_SZ];
 	ldr	\reg,  [\reg, \tmp]
 .endm
 
+.macro hyp_str_this_cpu sym, reg, tmp1, tmp2
+	hyp_adr_this_cpu \tmp1, \sym, \tmp2
+	str	\reg, [\tmp1]
+.endm
+
 .macro get_host_ctxt reg, tmp
 	hyp_adr_this_cpu \reg, kvm_host_data, \tmp
 	add	\reg, \reg, #HOST_DATA_CONTEXT
-- 
2.28.0.618.gf4bc123cb7-goog

