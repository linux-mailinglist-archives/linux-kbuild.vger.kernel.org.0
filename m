Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB0F3EFC08
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 08:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240251AbhHRGSQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 02:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239871AbhHRGQE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 02:16:04 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00963C08E79C
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:14:20 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id a5so1150530plh.5
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZ2pMteOO7qWfOmOYtxvBybCH7dbrKV5AXIyHH8PDAo=;
        b=I/ZOMRfdW0A1G/DcQVMDbVZ27xrUyPneZm3d4+Q2S2o/EDHaj6F19/FFLV/TwoMpwu
         skf+ZMMooatac88oo9CLvuJrGQA7BIMv1RkJv118S5WXUAW4DfMl92HZuy1jSJK9Q8/C
         xkWRC88V3Fuj6arr6OaRAS1UJvHk6WO+znvdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZ2pMteOO7qWfOmOYtxvBybCH7dbrKV5AXIyHH8PDAo=;
        b=VqXWoeZJnIxj00pMx/mFrg6d1BkKTFzqps3EHV57WmZ/ZYmzykarD9N5X7XSNe92Ur
         w64eXdflMVMtNvhxmCnTmdk9+EtwpH9z1MKUPOCmx0nCnD+LGoAAp+KcqUPgVdf/5Nry
         XcbjUNxmukagAmx/PQENx+SImkiiFEj/dnTjp95GEqHWMlTJjuB38ISBFbQ1V3mDr7x4
         u6h09P4WsAlgOhcJE5X/6/hgX8aJbKOojkWUPdf0Cq02IiwkCB4rUT9MJFFgNWKcbyRy
         ixuUhUKX4punMp5ARGc7Nx+PECYQHNxz9Ci/cRjYWrkGh0iPOCTvSBq9HwEa4VdJkclb
         Irvg==
X-Gm-Message-State: AOAM53028LHf9qEd/lSduvSt01S6y1TbbIQVmeUOIe3OCQ+9p/Wx1ODP
        lvHnanJwLQV7A/LCp94zH7p5Yg==
X-Google-Smtp-Source: ABdhPJzGVRGNWEMl+xJPHR3RME0k4vYoAMz1qrXylbh8zmM1aqx1ZRRou6EJ/L2qyq4WBdsar+4NhA==
X-Received: by 2002:a17:90b:1bc5:: with SMTP id oa5mr7694940pjb.170.1629267260592;
        Tue, 17 Aug 2021 23:14:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v20sm5270585pgi.39.2021.08.17.23.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:14:19 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 39/63] ipv6: Use memset_after() to zero rt6_info
Date:   Tue, 17 Aug 2021 23:05:09 -0700
Message-Id: <20210818060533.3569517-40-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; h=from:subject; bh=Xphf8KZ59311q+SS41lPdZSHzYQuR48YTVr6kaXwlq8=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMmSJWz3eXi3vB6HuJ8ZVOxVmfPJDOfgTngkXFJ Y1HtemeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJgAKCRCJcvTf3G3AJlNxD/ 9sppezWOBqAWwsgfxRdXp14+IggzlcV6Cmuy+3yoHyda/CdCTve1snqU/mJj9ikiLYc+kAugfad4F0 cTsFl+ID962FFCkUfX+wrf2rcqUBBFlgJb2t38JcXrnDO88rm3r76AL2Wma0ueNPmaH5WllhHC2rCK fXKPe24PYrG5OSOBDVj0fD/osVthtrCfm/J2MtX+UxWh2FPgLGPm8bIuPN1IO4o/bkmRAPRJf3kWdx OKIoFSgRnAQCFZAkoDmto4fssngysQ/8xlWWYJ9nL7hXj3ybM7i4Riea2vc7uMtQ/LdrD24dqEDmKe f3+J4WogRasAKWDsVi1LKZLojHKBb+ZlIs6kkWujZ6bqPTPjVxgKPF1SyrDNzFRofsvKIdmiaocbM8 7Mbap+xZuyeBTwmrqENziN5DQQZC7J8joprP3D5XEgjPSSfo10I0ZhuYGFkZImfW3drIF9MNa/UFwb K/jR9NhcwjBeArtPiUgjZ/eTrdZygthG5tuDwEvP65vF/0qwPA/rmr7iPNZkf43crxfhCRZxUf8LGs suQoBCZbvMkCKKlTKgtbFTehnkPqB2dleq9pZC86P1KKoE7a9I7zAFa0vwJ32McHUjN4QjWLWEnIo1 ySO6vVD3cBOQ7RlV165HYCseHGnNSRZD6wdVzFjMgZMzsSBDx6RZHTkAU6fQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_after() to clear everything after the dst_entry member of
struct rt6_info.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Cc: David Ahern <dsahern@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/ipv6/route.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/ipv6/route.c b/net/ipv6/route.c
index 6cf4bb89ca69..bd0ab3e436e7 100644
--- a/net/ipv6/route.c
+++ b/net/ipv6/route.c
@@ -327,9 +327,7 @@ static const struct rt6_info ip6_blk_hole_entry_template = {
 
 static void rt6_info_init(struct rt6_info *rt)
 {
-	struct dst_entry *dst = &rt->dst;
-
-	memset(dst + 1, 0, sizeof(*rt) - sizeof(*dst));
+	memset_after(rt, 0, dst);
 	INIT_LIST_HEAD(&rt->rt6i_uncached);
 }
 
-- 
2.30.2

