Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43A83F0D8F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234057AbhHRVlW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhHRVlS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:41:18 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CEBC0613A3
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:42 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id c17so3746814pgc.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=obyCsyhTKD9ULYgdRm0xF6fBRvJ21Igqh3M9baDJkzs=;
        b=gfoOfwCntAnNAJFuBtpqMhXssh75dB9pXawiBDuYUsb1knx7XpO1ULvRh4UWBQI7Bz
         FOhaEa6ykLVedUd4BqcLZqz1Ht+0PebP3lMGcJwf+KZNzHWuIHV+/cKUxmXqqYpMNcso
         Gyv2LEVmZMkaWyOxL2QsZi+qfz4ZSubt89mXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=obyCsyhTKD9ULYgdRm0xF6fBRvJ21Igqh3M9baDJkzs=;
        b=Vk+1FvPPG1+k+pJQ85itm1e82aHlc5FC7HbKzNQHUOoFKiiJDEzVGuSXNptzxmvsZR
         DYxBC9v6h0Z47XSdPKPemmMe5Ps6UJfQHUYvouLnD4Wciwj7xMTUVOHgbzHL6b7+99jR
         o30XmJooBvX7JFBpcfECk2NOqHNeNDSYB/0SjA/GQHgEoUa6ICza8oXPNx1xxfn9CWpu
         m7CaNIVHgKlaJrJLHOFaO8X94TxZV69P2QgDlADApTptSgdi9HILs+Ymn5ztXNUzd16u
         k44fshAGGLKsZ0Ygydd7TrQ/pbGbsUl/p0Xskw30DEkk1e5Ht/ddku4gjZ5qhKknMeMX
         OY+Q==
X-Gm-Message-State: AOAM532Pb5zlcn5nplJniXL5YnuzMwCF0+L1LTi60tyrfIsdyXr7+ZAB
        15A29u5h6tatD2YdHL2OqnJcXQ==
X-Google-Smtp-Source: ABdhPJwXHJZznk4JTYaE7rhZvSIvyF+ITwR+l8nNQl5rGGRvQRTxm60WUot4QCOH/cQrek7ozkyHag==
X-Received: by 2002:aa7:9086:0:b029:39b:6377:17c1 with SMTP id i6-20020aa790860000b029039b637717c1mr11523853pfa.11.1629322842023;
        Wed, 18 Aug 2021 14:40:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d22sm2428pjw.38.2021.08.18.14.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:40:39 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
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
Subject: [PATCH v2 7/7] mm/vmalloc: Add __alloc_size attributes for better bounds checking
Date:   Wed, 18 Aug 2021 14:40:21 -0700
Message-Id: <20210818214021.2476230-8-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818214021.2476230-1-keescook@chromium.org>
References: <20210818214021.2476230-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906; h=from:subject; bh=zZAhvg0/X2ZvejN1Ximar4dbpGivh/+QQFsXl6ok5Vw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHX5EQcnqyfy1qEIP1S4mcozbG6+autpWOD9SsOFn +9NTZ52JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYR1+RAAKCRCJcvTf3G3AJkdcD/ 9jF1T7G8iKELXphXJtJn6dWEfa0njsQ+5w/PgRzIb8ou0ZSzyTfJxwPTEhiiS8YfBZIbgG1olvXO1/ 9jlS/Jl7O6s1zJrbjTkAG+0YryyZeUgN0ikB5brvDOQADIQKa8Qv9p0nJ8PfnTzf3Y51GwQnLYTYYm m1pgQQJWt4Me+uYokWJyi5GZRoplJ7c7nEUJ/wfR3DD9fKzuP2kDP8cxiSFG+Th587g8qd0y/jaonj m2Phd4OY38vdxSbHtXYJHgVrnV4mdjhJI0fq7+/X7e6DsXV0seK8QO6/wgQP4hqUSLSUCQIunNHA+L IB2DZ95EFj6p7mKVVqGUNsqZZtAR40ad8E60M1SkpPImENeFhkBvCxk64cZo8j2rNryfFZJPYqD0/5 fVi75RuDWLa74deb59h0nK9wYA8qe62eXlCl0SZTz0GPBhPJXbgRwD4e0gHoZA5I4nRYjc+g6SYrl+ cBJNjVlr6nOYr59zb63l3gaBmo7CjoRlYRLlhlOor0UwVo4mDt6HgFO9Ns0hm7Q+z9TfKhBgVvJfgm rUxXWyozpmm26ROVdgGw7jhw1PCulKCVaFADIaMLXfZ156UUZirAS1jaQQQ0rhFNtKOUrtoGZJsmlD SO/O279GWNlF3ovkUXiQFuJ5GbVSkbIwwuCdsVeHSk0PssdSMAWKGEHE637g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As already done in GrapheneOS, add the __alloc_size attribute for
appropriate vmalloc allocator interfaces, to provide additional hinting
for better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other
compiler optimizations.

Co-developed-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Daniel Micay <danielmicay@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/vmalloc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 2644425b6dce..1521ba38957d 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -136,20 +136,31 @@ static inline void vmalloc_init(void)
 static inline unsigned long vmalloc_nr_pages(void) { return 0; }
 #endif
 
+__alloc_size(1)
 extern void *vmalloc(unsigned long size);
+__alloc_size(1)
 extern void *vzalloc(unsigned long size);
+__alloc_size(1)
 extern void *vmalloc_user(unsigned long size);
+__alloc_size(1)
 extern void *vmalloc_node(unsigned long size, int node);
+__alloc_size(1)
 extern void *vzalloc_node(unsigned long size, int node);
+__alloc_size(1)
 extern void *vmalloc_32(unsigned long size);
+__alloc_size(1)
 extern void *vmalloc_32_user(unsigned long size);
+__alloc_size(1)
 extern void *__vmalloc(unsigned long size, gfp_t gfp_mask);
+__alloc_size(1)
 extern void *__vmalloc_node_range(unsigned long size, unsigned long align,
 			unsigned long start, unsigned long end, gfp_t gfp_mask,
 			pgprot_t prot, unsigned long vm_flags, int node,
 			const void *caller);
+__alloc_size(1)
 void *__vmalloc_node(unsigned long size, unsigned long align, gfp_t gfp_mask,
 		int node, const void *caller);
+__alloc_size(1)
 void *vmalloc_no_huge(unsigned long size);
 
 extern void vfree(const void *addr);
-- 
2.30.2

