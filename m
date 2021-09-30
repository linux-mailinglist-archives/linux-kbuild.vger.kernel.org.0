Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1102441E3E9
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348456AbhI3W3K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348196AbhI3W2z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:28:55 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA9CC06176F
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:12 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id g2so6254814pfc.6
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xTdlLb7GtJ4Tj/wecFW9tRbbhL9s43+6wka+jFobq0s=;
        b=M2T++KtM+KT2mzH+OBTryDjwFQD7Zafb7dljFTDxRRFvTMYRNqYSZO3d23H0Hp+ARh
         XnLRQkcyDjS13ZBcgm/XGoaUSFBG/8cz5KRpJ01GC8+dbkS+4tfJappB4jFZpL7ntoAw
         X4ckafKQK4lBJej4HBhFSlB3Vh+OP4N4E9W5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xTdlLb7GtJ4Tj/wecFW9tRbbhL9s43+6wka+jFobq0s=;
        b=2bk3jgfiB2gr0YocSo0TiVU+/1Xlq0VIRVoMGtE6ZXInmoE+dwvk2/1nOv/6icEK0P
         is3B2NHNNRH4liKSh6wCrcTWhfA3EJcXRW0TI3h+z0gVh4kV6HoNH67KIHwn1I2Ql1RU
         MkdyfdnK8vfycoL+zcYgNtEOOI5TU7QWkNdHBptZ9Hveh7OybkoHIeg/VJ86JfxU+U4P
         rxSU3gSMEpUqLVt/4V4V6twSXx7iJTrHH5uMK03hzKm1S3TD8NgblaPYUu1/AwNPX6Wr
         Y5oDa/ErPnTtb8dtljlq1Kpf78LTG5wfgNYRJS9BcEMSPJbKL9UtLhSsv36iXTIQBDWX
         B+bw==
X-Gm-Message-State: AOAM533FT9oeoY0B8szJCLyjRu/J0F6tRpX5cN5jR91cGkl8TH7RVoil
        ZrxyYTZWHNFVKP73whyZazMNtg==
X-Google-Smtp-Source: ABdhPJyH4kS63+xB0mJe00QsSwG0CrKxoOyE4G+LyWXECWixUVGxAxEZvSJ0YkDdDYwi/3dkJrmLvQ==
X-Received: by 2002:a63:20f:: with SMTP id 15mr6733460pgc.319.1633040832346;
        Thu, 30 Sep 2021 15:27:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x20sm3606310pjp.48.2021.09.30.15.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 15:27:09 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
        Andy Whitcroft <apw@canonical.com>,
        David Rientjes <rientjes@google.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Pekka Enberg <penberg@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v3 8/8] percpu: Add __alloc_size attributes for better bounds checking
Date:   Thu, 30 Sep 2021 15:27:04 -0700
Message-Id: <20210930222704.2631604-9-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930222704.2631604-1-keescook@chromium.org>
References: <20210930222704.2631604-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2486; h=from:subject; bh=9EqXOckHEyfKAa0MxxJtth0Elvb+UhJZNEFB1gjQABo=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhVjm4aUkC0jHO3VL+EQHu/RyvRmlitX3fuanr+Ryz L48wiCKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVY5uAAKCRCJcvTf3G3AJlTMD/ 9+Ge1+7x+F/NL44UJJEUkUcosWJRMsIVppsrgGAuv9sU+uQ4EUIlaCObfvfV8cQNsQ6mP4mW4VfHIz qmPEIPllZ1wNum6F1gGAV/KD8oEqyMXXMWBrbSbRfytOI7+SXvYiHYqBOFm/XXNklvYtz1lyFDHFUt AuMPhD6RyaLWnhEnXwBozDpbP82J42TANIyE76AFDLgdBSimeg3/NR8zMhMF+XU9kj0HP8P7kgyv2v YdPjj/Ee2gnHsydjY8nTzEyeFysOuiPmZal5y8Boj0gtOp2hLAkfizpXoSbdiKg1nG3zfW23FpzxZn gPXrPrXAn+bkDFTWB+HYm+GR29fuTj7b9z3P3PK0BjcvUcdV+phsUJ3RkAy96FW1dnKpp2M3x7wVml RitRdRvoVOsKDR0cll4kuoNbKO4G6KsF+2S6EHlFo1d/5dpcSys9CfUu5+W+aPDmtj8QQqyCLTJ9LH I7l/V0e+cL2qPK3IrqQ0Aee+DfUi3b1AZ13Lfgk9GlgKCd50Ee2dBkA7eq07PAItN4eyPZQrfvvtW4 yL3LBUFUy6u1QQh6VthSfwKccfP9tQTGi8HYX4+ylmAUpE22iEiX5zTe/fortEdfvzvng1owx9T9ts 9oZHuqVczFVK0m77+Cfv6mGvcMoLYzUJc7haSxVUqBrIcta3Q9NEyFol+T8g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As already done in GrapheneOS, add the __alloc_size attribute for
appropriate percpu allocator interfaces, to provide additional hinting for
better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
optimizations.

Note that due to the implementation of the percpu API, this is unlikely
to ever actually provide compile-time checking beyond very simple non-SMP
builds. But, since they are technically allocators, mark them as such.

Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Co-developed-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/percpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 5e76af742c80..98a9371133f8 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -123,7 +123,7 @@ extern int __init pcpu_page_first_chunk(size_t reserved_size,
 				pcpu_fc_populate_pte_fn_t populate_pte_fn);
 #endif
 
-extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align);
+extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align) __alloc_size(1);
 extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
 extern bool is_kernel_percpu_address(unsigned long addr);
 
@@ -131,8 +131,8 @@ extern bool is_kernel_percpu_address(unsigned long addr);
 extern void __init setup_per_cpu_areas(void);
 #endif
 
-extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
-extern void __percpu *__alloc_percpu(size_t size, size_t align);
+extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp) __alloc_size(1);
+extern void __percpu *__alloc_percpu(size_t size, size_t align) __alloc_size(1);
 extern void free_percpu(void __percpu *__pdata);
 extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
 
-- 
2.30.2

