Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC90541E3E4
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348408AbhI3W25 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345428AbhI3W2y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:28:54 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BFAC06176A
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:11 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 75so7646749pga.3
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ESYAKcpw8CJ6aupot12QGhm/1PtWxxa9SFKXu5/HUJo=;
        b=HzrZAfthMsoaL00e6u9lKkzh3vUjofafLRs6T1cTPLgrjzNgkKDIjJBULYa+JfDJrZ
         4+ypFNtLvatgK4uaFZtRLIZnR3rZX/i871dgEGNC2tykmEZHc9mUiy7z5CttTDHgWDmW
         h26rGT4LCopjx4sbUvZIRJHxHuCCfnzwpYb5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ESYAKcpw8CJ6aupot12QGhm/1PtWxxa9SFKXu5/HUJo=;
        b=5YzIKihBbuHmhIa8iKJnF61LlxCvSEKZdrat5MascMOdqrYGLIeMJGCGBMLfyF55vn
         zs2E2Ov28PYNlpGRLEAg2G+13lrKlqaAMgMO+IASChU8Qd/Mt1C++mE2cbq46cWPEx1b
         i+g7/0SHYjwDW8QEzL5dupVb9fYcIVDpnUCjZa+rnRn1Ay4KSNROSwedgLKmuG5Y+JDG
         K+QDAeFB+/Ne3sqhdsHmr6pSP81BGtw6W8vVmPtvOyzfoiKou8nKrBAuTrtEPfHEXoSl
         k4ysUEsUjLokAdjsv2WPqDJLc9FdCA3DCYtj8zJMS2o5adde/UNXCTAecVqGuxxY2wpl
         y4cg==
X-Gm-Message-State: AOAM531ex2TPOgRh+RWZt/qfEB2KuKP4uaB4psfwTfKW8iewxLOx2ud7
        VHICLPeY/sblqz7QXeCUctY7PQ==
X-Google-Smtp-Source: ABdhPJzjKyvNdx2y7W3tZ8k06kf7AdxjQEHIvWHm/wxcPUHyEGBfez366DWf4B1AdFCHRgi3cQWBqw==
X-Received: by 2002:a65:62d1:: with SMTP id m17mr6913015pgv.370.1633040830779;
        Thu, 30 Sep 2021 15:27:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q4sm4066225pfl.50.2021.09.30.15.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 15:27:09 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Andy Whitcroft <apw@canonical.com>,
        Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Dennis Zhou <dennis@kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Pekka Enberg <penberg@kernel.org>, Tejun Heo <tj@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v3 6/8] mm/vmalloc: Add __alloc_size attributes for better bounds checking
Date:   Thu, 30 Sep 2021 15:27:02 -0700
Message-Id: <20210930222704.2631604-7-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930222704.2631604-1-keescook@chromium.org>
References: <20210930222704.2631604-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2969; h=from:subject; bh=PqMG9LUKCcMh794yj62SW/bUvosL4x5yAHHZWjpUkyg=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhVjm34phzSlXdvuTp3+opvclRgdeGSmO+NwyepuYM EN6zSnyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVY5twAKCRCJcvTf3G3AJhT0EA CJkQ005XqUiJSOcNF6agctDoJhc+CVk4wZ2PG6HQUVmHJKwFf67w4PZ9g3p1fsjzXDp9eaYZefJFUi 6JHZRF5jjU0UYYfYT+DIAnlZM5F59JkpxVExn9yFX1HQyiWAe5/l+5ivLQmIspyvdgPt0GkAfHmeO/ SAzlS5DsbIsmGTLy3DBecFEarOb1YWkPC2Bv7+6PBHt17TVvlpe3KrKvykV7blZWLbAXP3gFo73aO7 YKXx06jgVvyoFXBmYg1fbqfB/TuIRdafZpd4e4IXdqUM/sz3BfrZ5Sszh4wefHDCoDpNdwCNaq+coA W1Hf6kjXkHCK0W6df8mlNFWzVvlCrt5xS488eSFMmPYbk3ImPlxfMNlYoW21FSY3z2SGV6UMa9UTce PW5Ozc21RqIbDwIc1m/H97hfNvFCH0evpi6086NOBh3kyFU3RbIngjeRpk+C+awlD56ONUjPYf4dwv 8DssvV22U43dK6J18SZPEd1qOnylxxE5blxqg4EpCCncxUm7sQEmCYqMwp4O4BK73wNhCzMt0+Qi2u AWPmBNoHgN9dPBao7l6NRLBvFtVtgn5ojCl6tSMu0ueoGwYkLf2APnPgslcTmsO0a6TiP0U8MDgrpk OD0LxB+07EMcZPI2t5HQuWLuU9N2QxGPHO2KQqts1PVM1qqJ2ZwHw3aPkKWw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As already done in GrapheneOS, add the __alloc_size attribute for
appropriate vmalloc allocator interfaces, to provide additional hinting
for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
compiler optimizations.

Cc: Andy Whitcroft <apw@canonical.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Co-developed-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/vmalloc.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 671d402c3778..0ed56fc10c11 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -136,21 +136,21 @@ static inline void vmalloc_init(void)
 static inline unsigned long vmalloc_nr_pages(void) { return 0; }
 #endif
 
-extern void *vmalloc(unsigned long size);
-extern void *vzalloc(unsigned long size);
-extern void *vmalloc_user(unsigned long size);
-extern void *vmalloc_node(unsigned long size, int node);
-extern void *vzalloc_node(unsigned long size, int node);
-extern void *vmalloc_32(unsigned long size);
-extern void *vmalloc_32_user(unsigned long size);
-extern void *__vmalloc(unsigned long size, gfp_t gfp_mask);
+extern void *vmalloc(unsigned long size) __alloc_size(1);
+extern void *vzalloc(unsigned long size) __alloc_size(1);
+extern void *vmalloc_user(unsigned long size) __alloc_size(1);
+extern void *vmalloc_node(unsigned long size, int node) __alloc_size(1);
+extern void *vzalloc_node(unsigned long size, int node) __alloc_size(1);
+extern void *vmalloc_32(unsigned long size) __alloc_size(1);
+extern void *vmalloc_32_user(unsigned long size) __alloc_size(1);
+extern void *__vmalloc(unsigned long size, gfp_t gfp_mask) __alloc_size(1);
 extern void *__vmalloc_node_range(unsigned long size, unsigned long align,
 			unsigned long start, unsigned long end, gfp_t gfp_mask,
 			pgprot_t prot, unsigned long vm_flags, int node,
-			const void *caller);
+			const void *caller) __alloc_size(1);
 void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
-		int node, const void *caller);
-void *vmalloc_no_huge(unsigned long size);
+		int node, const void *caller) __alloc_size(1);
+void *vmalloc_no_huge(unsigned long size) __alloc_size(1);
 
 extern void vfree(const void *addr);
 extern void vfree_atomic(const void *addr);
-- 
2.30.2

