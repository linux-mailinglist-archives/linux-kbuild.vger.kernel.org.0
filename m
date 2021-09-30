Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0570541E3E6
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348735AbhI3W3C (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344158AbhI3W2z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:28:55 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDCEC06176D
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:12 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id d4-20020a17090ad98400b0019ece228690so7821196pjv.5
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u2ub9aDUdGkR7a45M6+RayGW3Mc5Nzpp+BqvE+GQyD4=;
        b=E4117kGofCjsUGdfSRTGV+cTc7zkGteSQS/YjKtNttFBJetk/lbVRQOWBkP0cou6FX
         nquNIIKcACgN4NjJK0Dk4cvoGaQO1QOvxc7b+qSmM0G/pcadnqVz3fSeHbawfF/+5SxM
         W5CUTPB7Lbr4gYH5opiwBxjGFHpaqPuAJWxhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u2ub9aDUdGkR7a45M6+RayGW3Mc5Nzpp+BqvE+GQyD4=;
        b=cSoG4XACQEC2swGm28DudaaqSWJBEmwJl6JcLPhGTokfEXgqz58eZhE+eQAjUcKCxk
         9DjqHaqF4IylUCjONUS6zVY5D51d0R3BURgl1d9Ty2daw40cRMhOWgeh0kNPKoyAYrYo
         5yDQrcekLug75XaqLm3B9+iXcjoX/rIb5pbgE56wYLljWpf1zi2UVMyC2pcPMEwOPMJN
         ThWswTgy2zLUx7voJLIFohCTN+0XpE+A6tIJ7nKHe5gTxy3pykOeEOMTVf5gV+aLZnL6
         NlKMPtXJaxpxfMcUe3bTAqtLsDHskXI8klD/3fbT/Yhf0tCKtRuVLQAcXna2faIHzrZV
         nO3g==
X-Gm-Message-State: AOAM532fqqQVtkwurqmVeemMO31dtkaeiMm6fG21FxKM438PecTRdD2Y
        floy5GFbCIrrFt6UoT1y8wb67g==
X-Google-Smtp-Source: ABdhPJwQdxICM7qve4++qlkIYIKGkfShLBTtRkjuyHcuH/G/SHg9YX/oL/zPE0SniAua+b9zgN40Qw==
X-Received: by 2002:a17:90a:47:: with SMTP id 7mr9261738pjb.46.1633040831839;
        Thu, 30 Sep 2021 15:27:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l185sm4055195pfd.29.2021.09.30.15.27.08
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
Subject: [PATCH v3 7/8] mm/page_alloc: Add __alloc_size attributes for better bounds checking
Date:   Thu, 30 Sep 2021 15:27:03 -0700
Message-Id: <20210930222704.2631604-8-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930222704.2631604-1-keescook@chromium.org>
References: <20210930222704.2631604-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867; h=from:subject; bh=yfsJRZe5VPlXhNpESupqg/Lx3TB+JxswN2/B9c/1qRE=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhVjm4IH1a0nV/SMwCAsRFQGt/UlwMh4gkN7oMNoN0 ZBYvfZOJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVY5uAAKCRCJcvTf3G3AJnyND/ 9Jn6MqWe77b4tIIKVMs4JhXxwCeYTw1fq3mDnWNU4lSzNE/x3S6AYm3L/txTVyeheRfpOl7SOWwk70 /CWgalV93SIVwrfyQk3eIHwwaYv5XjUxMKTq9OmuY8shTCHA0Dmu9LfiSuLzV9yZ8WUaBEymsdsauL A3bK8vkp9rzhLE4geifpHgJ2ELbeD+A+KNRW5ojXhXB4SBMsdYtEqRGGSsMURPAyAOIn14yPxBLu4M ILNp4YRWjuhJWMN2YAc262qkmCtJjdPPTiQirjxUttsVUtLbK3BsOqjXu+T/dGyFDCb1+eCMJ0arG5 LR10YyJAmOxmECGqzhaP9h18bHNuGDnHAxpPXDn+AhFwwI/Qw5u7+QnYpaOKUkucflZJbd4KykcidL NxsnbLLexoPG7e3txH9ZWIYh72T0Se7V2u93sp9AhF80AYirhFQw26z3rqV3XeCFQkceyWEaZmiras 5eoD20fPo4Dlt04k/F5h2NaBn/LUiB8YxoMnHv2hVt8Ft/cqmhNRqkI/z5Nux69TO3JMtdRDX67id+ /uJBIcZFdewl3ka+oWfCVb3bpMGdaHVp3+bmLiQGZXR1z6tnH3gUZVUECYU98Kh0AW4LuiNi3A/xGa 0WhDo8ht51lnbE7T8FRhQ7FL8vO50a8MszXtDGPQpVltL0E0RubMc+2FVe6A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As already done in GrapheneOS, add the __alloc_size attribute for
appropriate page allocator interfaces, to provide additional hinting for
better bounds checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
optimizations.

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
 include/linux/gfp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 55b2ec1f965a..fbd4abc33f24 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -608,9 +608,9 @@ static inline struct page *alloc_pages(gfp_t gfp_mask, unsigned int order)
 extern unsigned long __get_free_pages(gfp_t gfp_mask, unsigned int order);
 extern unsigned long get_zeroed_page(gfp_t gfp_mask);
 
-void *alloc_pages_exact(size_t size, gfp_t gfp_mask);
+void *alloc_pages_exact(size_t size, gfp_t gfp_mask) __alloc_size(1);
 void free_pages_exact(void *virt, size_t size);
-void * __meminit alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask);
+__meminit void *alloc_pages_exact_nid(int nid, size_t size, gfp_t gfp_mask) __alloc_size(1);
 
 #define __get_free_page(gfp_mask) \
 		__get_free_pages((gfp_mask), 0)
-- 
2.30.2

