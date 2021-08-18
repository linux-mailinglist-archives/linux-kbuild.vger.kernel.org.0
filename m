Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422C13EF9CD
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 07:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237588AbhHRFJW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 01:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237348AbhHRFJU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 01:09:20 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48973C0617AE
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 22:08:45 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so8173430pjr.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=odUz6n/RKpUPExqy4Plx6hZKFwyikJ7mCPOENAXpi1A=;
        b=QfgA3m29HNR+UjzDZsodpNevvOdZa5lbbZQ/mb5EWKYxlQdEnISqlfEjxNern4S2a9
         S7BurM8h26UzgWveF3D65ey/dm5RtYQXFaOOIQoxkV0BGU/gFcvmRF0K5siiTaHrXnft
         VwJwA8xChjNFpBYbmazcQ+ZRR6ipCBIefvRqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=odUz6n/RKpUPExqy4Plx6hZKFwyikJ7mCPOENAXpi1A=;
        b=QEXTxjAOHmsWMXLxQTF151hAyPA0gf0+4qj9LnG59yywN71TEqCekzb8EI+HINz4F4
         nRG0ZfDxCnx+rruKAgq6CAThJRu/qE76gy5dkYuwi0vXGfT/NC3b8b9diKYiiz7YM7K/
         rPzhIcp9KS/xtqPQWMuYOA93pTBEqIW817AyM6NqK/woRkV47i5c/ei6kkmgXhumwkVK
         wmhwaAHG/8K4Hr0Q1buloxRz6KCeU4jpwhueR7M6Ib34b/ncY20C/sPsj65CRRWQHJWD
         32gi0LSUsuxk24UV7IjkwvHk1dCP9nn4RMgjk//UjigwB29cMLKFVb4Twb0himyPXtMd
         pZJg==
X-Gm-Message-State: AOAM5301Kq9OtPjt+pwPlSS1ZT7m4PmShxcRXWNu1e2nNEmMg8iuh6wj
        ETQA69gT0TkGQ3LqhlsqAX8kKw==
X-Google-Smtp-Source: ABdhPJxfXuDZLZRombNv/+en+T6nGULgteS8blFkT70oeDjABA/FdXgNxjqNJVAt7tQSazIK9z7gNg==
X-Received: by 2002:a17:90a:bd87:: with SMTP id z7mr7384174pjr.163.1629263324923;
        Tue, 17 Aug 2021 22:08:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b10sm4425381pfi.122.2021.08.17.22.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 22:08:43 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH 3/5] mm/page_alloc: Add __alloc_size attributes for better bounds checking
Date:   Tue, 17 Aug 2021 22:08:39 -0700
Message-Id: <20210818050841.2226600-4-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818050841.2226600-1-keescook@chromium.org>
References: <20210818050841.2226600-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1375; h=from:subject; bh=cp0O8NJngs9amnriLD+6h+/L/ha0ko1xnZRmO7UAZwQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHJXYxDq6T8pm0e3owI/dczoEgQdLOkB19YGYAKIr XNQYfSuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyV2AAKCRCJcvTf3G3AJi3mEA Caf9xRewJicK7Djb8O1KuuuUsMzmapMH/i8WIOm/xR6TNmV/o9Rctjak4Yy8/DQEnYWERnzuJMazvR hUF7XU6j2B/hKSVHwy6Uo83WnrAaUNwA+I+PCXbcZm51to2scEh4u1mmz93c1s7P0CEEZp1mLy9JRE HrdfZ8ZzT5RngtrH6P+sD4456p/tnCI28R9SXFt/qoke6KZmbUFTLu4FSIRexjEY6IIcped2xKvWTi 54kupXtmBj5sTQWElu2ixPtov/wAymO275s66hJOnus7rv1ff+OwTvSTvGOyFe0kDhrDiXJKs2HuWs XEvxdOq1U0kML4Cpg4M+keh7fruNGlDr2+yDbDQ9fc4MvCaRVLJqFjao4dBmVji/PgMqB8MWR2I3YU ErShjZWeHSBrttD1kuPcyqhRHqQL2Ji0I+GufYvMP5cS5o7o8Cqkhcs54OShP6Jd0gveJyisFuT24L 8hHLvD14FlRpuHQ5QWeTeBTmdxxpqcspr+3RKkgAXmju/WIjNLHkzkg6rzyEELKnS8eryi5bqbIF5P tC0FIBAmqeiiMJhaGevB+Rj2YjSc1pEFcIPcUHTlZ5PAaDfBBvNhgFqosNy7b9XQYZsv2dquDN8I6k R9sdrdJ/ybYIj4TWIuLE+0jfsJs+lgR31VHnXTNXI/C9QqYbdDj+hCbsfWxg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As already done in GrapheneOS, add the __alloc_size attribute for
appropriate page allocator interfaces, to provide additional hinting
for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
compiler optimizations.

Co-developed-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Daniel Micay <danielmicay@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/gfp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 3745efd21cf6..94e57c752308 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -618,9 +618,9 @@ static inline struct folio *folio_alloc(gfp_t gfp, unsigned int order)
 extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
 extern unsigned long get_zeroed_page(gfp_t gfp_mask);
 
-void *alloc_pages_exact(size_t size, gfp_t gfp_mask);
+void *alloc_pages_exact(size_t size, gfp_t gfp_mask) __alloc_size(1);
 void free_pages_exact(void *virt, size_t size);
-void * __meminit alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask);
+void * __meminit alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask) __alloc_size(1);
 
 #define __get_free_page(gfp_mask) \
 		__get_free_pages((gfp_mask), 0)
-- 
2.30.2

