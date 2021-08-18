Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B36F3F0D82
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbhHRVlO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234057AbhHRVlN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:41:13 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B4A2C06179A
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:38 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id n18so3735709pgm.12
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j9DqXIvxCIM/uJCCeVoynzfDym6qm3dtyLAT5E0EvZQ=;
        b=IVcXEnYGIgkxp08bXfmT4Z/QM2rlhkGqHMb4AimQ1lPm8+B8jgH7qoE/Y1k6f6RIB0
         f1loyx5+TOZGqY4BAB479NEA0Wdx5Wwah4KXeOk3PuftyMLStwSpM0LpD0If6gUUc2td
         ekGdIHDc0xSjaMo9BoL1YSg6vAPozzOgdXG4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j9DqXIvxCIM/uJCCeVoynzfDym6qm3dtyLAT5E0EvZQ=;
        b=uUiQp6p54Sh7Aksd6nHS605aS45vkov3IkATPhvUIzLhnOxPAFq8hhnJn3CKFYCsYQ
         p2fcNioQE+H7SdS4c0i2TXqsdLdKJJRgI4vT1+8U7UwBbk8XeYDn2QAoKmUYzOOTU5pE
         0T9WcoLYlusNIL254E9gNeWVWtUXRbzhJCpevb+s3iUTEbAGy14LksGcLbijWtOIruHB
         ijKsTMNRr3JWPjHXYfXns511BCcIQt3bPAEpHMFbuiX79uQRHZKfKOHhMUoffzqSCu0g
         CXB3NCndL5JbJATrx3FFbj9dUTN0Etjx7d1tC6gDU4phiedSvoTSxywRRm4ES12W0PsS
         vKzQ==
X-Gm-Message-State: AOAM530YJsmHAGWmOnHWuRUs/uF5TwUgCns+JN+8DKv6vuD8shilU1aw
        6lwoftXovZzlImZ8unioPy44hQ==
X-Google-Smtp-Source: ABdhPJz4r38rCjQXBAdz5RKupPpOX5AXF2/LNIdBOa/52R9ZgKDp5P005icezNJ91KF+IbpL+Yvx7Q==
X-Received: by 2002:aa7:87d1:0:b029:3e0:e44b:6429 with SMTP id i17-20020aa787d10000b02903e0e44b6429mr11485358pfo.81.1629322838217;
        Wed, 18 Aug 2021 14:40:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v20sm846721pgi.39.2021.08.18.14.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:40:36 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v2 2/7] checkpatch: Add __alloc_size() to known $Attribute
Date:   Wed, 18 Aug 2021 14:40:16 -0700
Message-Id: <20210818214021.2476230-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818214021.2476230-1-keescook@chromium.org>
References: <20210818214021.2476230-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; h=from:subject; bh=6Teat8DBaEMMX6uWXJym8AvRSHRT+DxfYZVALLaAHjA=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHX5DBAWPRR5j7mh8AUY9CepoJIBrtuPXzvvnwNso swpVkhiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYR1+QwAKCRCJcvTf3G3AJh7KD/ 96JnKMQjuQw7QtjrbSbFxElQz16CfGElDpaJ1vmSZyt5B94MVj1bxxm20gR7QAEGbHyBPNyae7HA80 /eGzg2PywQcfB6x4/I0U1vis5JgM8dvYpANANpoi0nYzP/cgkM+ZI7evoAF46FggzG2+O3idTnEgzr DpYQ9H3D3JyEL/TqDbNFh5DgovOyydTKuMWa6ME5T91vVKPrw0ObE03YKzBPehWKbdW+AEzAANor1b cGwSAKuVy32QNt3mPR/IsRkGWSAV0+Kni+8BgmXt/8TTLhxuEAUp5KpQc3061OiwSbbniWGU6TNZTI ajGROJBqm4tAGaBQL2rqL+nMCFm+Hh92wBwgxrJLDur7oiuOii9ZnNgIDx7k+GgFqEYf1HSp0TglqQ M4nuT/MvfO0c/1/F3hGvEQHp4Rp/KOpGTu6z0kJ3RePjPVqMySTot3hJ1JwIIDJha2OlSOXczxBN+E A4P3QaN/sEpO0KRIjbAZeyCCukgg/Ca2QlCCDxETAq2aKCdq6NQJbNwHvTYLJrOqqNAzGBwr++Rt+w 5IqUpM7ekMoEWy10JxkE63eElBxOtaboQ9rYmcAM8Rpg48Y42Dw+WY+QKeIcl/Jwphs5jMUEmACxC1 jYYU0zHh/C+ep7ngW3J3xPyoGZJeNxIzQ1vWRqLiIj4Ua4u/JbSYyCobzvNQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make sure checkpatch.pl doesn't get confused about finding the
__alloc_size attribute on functions.

Suggested-by: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a65753c05a69..e4b0def605c3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -489,7 +489,8 @@ our $Attribute	= qr{
 			____cacheline_aligned|
 			____cacheline_aligned_in_smp|
 			____cacheline_internodealigned_in_smp|
-			__weak
+			__weak|
+			__alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\)
 		  }x;
 our $Modifier;
 our $Inline	= qr{inline|__always_inline|noinline|__inline|__inline__};
-- 
2.30.2

