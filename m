Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8CA63F0D8C
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbhHRVlT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbhHRVlQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:41:16 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F8FC061796
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:41 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so6016354pje.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hkb7Jfu8siQEeZroFh7P2leDv5HZhgyEO3/P7zQyv7o=;
        b=RSJ0nHFz0YIcadZEK+2T//KeKYLb8iPMtRzFaI7ERNqAF/9UzjlEvsmh60f+OAG0hR
         Qj0RaYKR9wNVB6Z8CE3TAnUtflL1hT4INidx6hvPICYLbw9LUID/Z0TgTqlMFeC1joks
         8gQqtC0TPN6FGO2wynWdR3t8c/hxAKrpFBhZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hkb7Jfu8siQEeZroFh7P2leDv5HZhgyEO3/P7zQyv7o=;
        b=PSjpQeDXXh4V++nysmRsjO6YrDxgpl85ET/C09NNWA/oVtGaXFrTUuTK0eISUQQ+sf
         FvsUhHG9hBxOJfLXLG+sWIHp8HL41JxGEAz+V7znZKmrjLKqIUDahEXgZ0CeEVcy5Eon
         iYxAJuV/pkiuHt8InKjNcKlUzgJ8WYLBfYx5yeP8LtTMdY8eV3xGfcO2jKaMSTeL/kxB
         D/l4Gnjs2I757G2c5QfIIfSOACor4EmdH2pCeSaCIBgjjCUixC6FtG6F4BX2Xf5+sCs+
         V6NlWKnC1HxlXYCrz9xDp538KumVFtQnEkqSPRycuCCAJUjMSOPxFXO8rZOiEjMJ6fwt
         tlmA==
X-Gm-Message-State: AOAM5323/pFKRUeZKCF8Q/s4I/kAnfn06UrMk3DENpbuxgK+P6Bob6VP
        kYzz3XEl8vRjg4ONp/9wKv/jPg==
X-Google-Smtp-Source: ABdhPJzmfME2/iuvry6l1RXtXFLw2B8x/9UtYWsQyHviQ+a+yu2VpuQUlSlfyodXtUqiobzZT9CGsQ==
X-Received: by 2002:a17:902:e54e:b0:12d:cca1:2c1f with SMTP id n14-20020a170902e54e00b0012dcca12c1fmr8778762plf.79.1629322841388;
        Wed, 18 Aug 2021 14:40:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p30sm771381pfh.116.2021.08.18.14.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:40:39 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>, linux-mm@kvack.org,
        Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 6/7] percpu: Add __alloc_size attributes for better bounds checking
Date:   Wed, 18 Aug 2021 14:40:20 -0700
Message-Id: <20210818214021.2476230-7-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818214021.2476230-1-keescook@chromium.org>
References: <20210818214021.2476230-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; h=from:subject; bh=ekTvmEitMMQysLPDeBX8i89VfgDCF2rtfdT6Z6IUx4A=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHX5EsqlEW2vfPq2eFmV43wt3rhdXc8JsXzXAcFu/ K19rrryJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYR1+RAAKCRCJcvTf3G3AJuxtD/ 9NUGRG0V5AKk7qevvbKJ8t28yDZ6RZ0La8S1XLLAg61jPfECQvj6pVLv5NrDYtQMSbnwdh77FUg+II vLCH66LG8N2MwxQgbX7gtAfkcv2VV1dChGUbDODhzCKYU1ggZbOz55qV09DiWOCHE04y5LSlABcay2 1Di10cEmBP3LyrcM45UIOvl3fbc5iewqMqz/g2BZSmbGC0jJG1QjOvQezGZvid6TmQozA6VJ7oUJTA yQQ3KaPMNrueSUKmqwe/B5/sBXvgGM1hOSVjuZNFgLeL2Eb4qMJnukSGWxaIHY8JYpT1kMog9OOfD4 ngnPNYTprHzGVHq8wPzJOcfaQ9ZBKsSRM9Sn6mpGfrpqF8+WRID4zn/Vdcz2m8k3AEgPaTs3DWOhq5 9VYp9XI5i5dvtDnlooedZt4ux8Bdv6+JD8e8zwBf+w7uONbj0PU4iq2Kax/B1F8tDOvHyflWvwlQxb nd5XW7tez+VJqv0r+Vi5cyZ9Z4txtiC3cepvO5YiFD/vsyFKB59HnScAAvwClZTYHb+u8xWLrElSDk t8qKonk8l3+uGZueDC8sHGMVtV+lqxYbD10EMx46FGmrtbEBZT/shTf8vQllIDghYvHfEzL9ymZtxG jGGWnPlILGujzSofOTeKoJvJHLxS+LelzhTaK2IdytAHBhi4QsOwxZZNtx8g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As already done in GrapheneOS, add the __alloc_size attribute for
appropriate percpu allocator interfaces, to provide additional hinting
for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
compiler optimizations.

Co-developed-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Daniel Micay <danielmicay@gmail.com>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Christoph Lameter <cl@linux.com>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/percpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 5e76af742c80..119f41815b32 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -123,6 +123,7 @@ extern int __init pcpu_page_first_chunk(size_t reserved_size,
 				pcpu_fc_populate_pte_fn_t populate_pte_fn);
 #endif
 
+__alloc_size(1)
 extern void __percpu *__alloc_reserved_percpu(size_t size, size_t align);
 extern bool __is_kernel_percpu_address(unsigned long addr, unsigned long *can_addr);
 extern bool is_kernel_percpu_address(unsigned long addr);
@@ -131,7 +132,9 @@ extern bool is_kernel_percpu_address(unsigned long addr);
 extern void __init setup_per_cpu_areas(void);
 #endif
 
+__alloc_size(1)
 extern void __percpu *__alloc_percpu_gfp(size_t size, size_t align, gfp_t gfp);
+__alloc_size(1)
 extern void __percpu *__alloc_percpu(size_t size, size_t align);
 extern void free_percpu(void __percpu *__pdata);
 extern phys_addr_t per_cpu_ptr_to_phys(void *addr);
-- 
2.30.2

