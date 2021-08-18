Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2566A3EFBC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 08:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238538AbhHRGP4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 02:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238260AbhHRGPw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 02:15:52 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73163C0363DF
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:14:15 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id qe12-20020a17090b4f8c00b00179321cbae7so1647504pjb.2
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U8hLOmyndrZpbH3W//YQN6YJRgGYlYr4YiBW+Lc3AF4=;
        b=ClJUrT6ApBH0phA65aDisj5+kyHerJF2/GgwYf6sYImzafPzHckhYzZodOxI7uhCpI
         vpe004kdrf64A0lB+HxzctUtSU11uTF4QZRwPZLG5yLy/UjnyJdf52u/HU6dj4zxkdJI
         26TEVOy51sB8cue9oxYDxzhyCi71TMoiQfP2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U8hLOmyndrZpbH3W//YQN6YJRgGYlYr4YiBW+Lc3AF4=;
        b=LW3O/C2eZDH9l73+T6nqbmK+97zLauSLkOpWLOrbRF8BpPuCfknzvNP3zkRENWd3Df
         304kT+Jf6bjIZb/pwqymzA3g/n/3nRKJ1uBUSFyf4DplKKfGY7FU+cgbCshbVJVpkFC/
         EwBD8fGGESogm4OhbSJgBDkSs2YzhK6YEGwdIseUSWBBMT5oKvglECfOV0+nx/oR6IL2
         PiZgAIig+UEtfHxt2j88QSrU4lS7Db+gLKW8qGImAeWr7TNtB+3Pi69ujhxjbnuak65Z
         Zc+KIckL2LiErePBQuxJd/FGcUf5/DynRE17Xuhza35cRRLZ+zkkklYtLZyh8fiPiZkD
         xJiA==
X-Gm-Message-State: AOAM532jJQBaV1R0L2HOkz+QI/4JjCcPyFU3ob3xy9aJAZ8WfIzJud+d
        93pKyiEYqCNEZkM1OODOfmni4A==
X-Google-Smtp-Source: ABdhPJwRPPIhR63YQCS3nZeOodK84yxk6DTCJU5/GeqbIYAqZWORFkCkpfMsUc8DkqkxWPqp6Ivd9w==
X-Received: by 2002:a17:90a:3d4d:: with SMTP id o13mr7935552pjf.34.1629267255044;
        Tue, 17 Aug 2021 23:14:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f5sm4570524pfn.134.2021.08.17.23.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:14:12 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Jozsef Kadlecsik <kadlec@netfilter.org>,
        Florian Westphal <fw@strlen.de>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
        netdev@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 40/63] netfilter: conntrack: Use memset_startat() to zero struct nf_conn
Date:   Tue, 17 Aug 2021 23:05:10 -0700
Message-Id: <20210818060533.3569517-41-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; h=from:subject; bh=fE+HPCTs14JsaXA0VZ1+azTXm9sRPSgAjXFdw5wZMQo=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMn9jUxUjmhnSM6V4Tc0qU7XODXJhF3t5WIJd3Y koV1FpKJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjJwAKCRCJcvTf3G3AJhk3D/ 9Y7TD9jWlZ06v+vvdPdc8QlSMediOUFC1q3DoYi7bvc4YyEqXGUCbEBONwNQLvsK3hI4ED3PL+2IhD hz/Dbx5DT2T40OMCMycZbUmvAgn6pOBBpw2q5g7L1MPBPiZjTMXq8E4ovppbe62BM08pHEnfAugWsL Vg8PPE0Mpa5a+QOsrBwIXi58FdhL+TgFoZSeBzbJm+KmZX4h++dF5E6mfecc7iWTRI8x9S8/YHdEh9 ZIb37NLdJeVivXFEuz3DfGGLCuGfbSDNomkElBmWe2yPoHWjEkJTWn6RNq+MEAjA9TJ5TJ3HDso1/K sKW9g8e4L1L/rtxaFXF9BV/xpTwz0kRs0XsBqZ+kJVDfducMf0ve5e9o39+ZRvnlGz1cBPnku+/z+w 0bwBKb/ZheH0vYU+K8EWpKneqiHfpTz4StFzfiQRwhbiGP3RgP5fcXs0kJTQd7Pb2ELVtqLcT+gjk9 6GhJhWeDD/p/qHw7tNmVAq61F9fgKxmA+c7cUPkuWqkaozXqUnyya2WLhQ5LvSbSIIu7/NC2yfZ+vB 5nw/neLBHyCcwQZyeBRVjmkcwXCcmWSOAeUgya9iGsWYJAEHUAkIzm1Hk4kcF6HSJmjPw9ayH8RBkV zBGERJvvVpyPFtl03OuHfjGRW4wn6Zs+wzWO0oB8CiPowPcXXUv7O9y+3+xA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Use memset_startat() to avoid confusing memset() about writing beyond
the target struct member.

Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netfilter-devel@vger.kernel.org
Cc: coreteam@netfilter.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 net/netfilter/nf_conntrack_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/netfilter/nf_conntrack_core.c b/net/netfilter/nf_conntrack_core.c
index d31dbccbe7bd..060503230519 100644
--- a/net/netfilter/nf_conntrack_core.c
+++ b/net/netfilter/nf_conntrack_core.c
@@ -1500,9 +1500,7 @@ __nf_conntrack_alloc(struct net *net,
 	ct->status = 0;
 	ct->timeout = 0;
 	write_pnet(&ct->ct_net, net);
-	memset(&ct->__nfct_init_offset, 0,
-	       offsetof(struct nf_conn, proto) -
-	       offsetof(struct nf_conn, __nfct_init_offset));
+	memset_after(ct, 0, __nfct_init_offset);
 
 	nf_ct_zone_add(ct, zone);
 
-- 
2.30.2

