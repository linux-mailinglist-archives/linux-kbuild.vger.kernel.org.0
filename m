Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5C04D0B1D
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Mar 2022 23:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235918AbiCGWdq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Mar 2022 17:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238546AbiCGWdp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Mar 2022 17:33:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4B8B35859
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Mar 2022 14:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646692367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=rdVu7gaqINPujMlHtzx8XjmC1lzYrE3ToDYQaDek84E=;
        b=DAvG1zyeyxK1E9KTQJAzv4hFVj04w8oINp/BeonPCqrjC07fJg0FkyZyL93LyAZuYuE1GV
        A5esKRewjaZD8x5dzcQtqczEA82ax52k7+0bVJfMA7WGmhzwH3lEUnhL+ocp8dcc1+UGpE
        HO3LKjcW2Pm/rHLZWVI+sC9E1pZMtPA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-F9w2LySrNpCZ0OXeSZaQlg-1; Mon, 07 Mar 2022 17:32:46 -0500
X-MC-Unique: F9w2LySrNpCZ0OXeSZaQlg-1
Received: by mail-ed1-f70.google.com with SMTP id i17-20020aa7c711000000b00415ecaefd07so7083687edq.21
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Mar 2022 14:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=rdVu7gaqINPujMlHtzx8XjmC1lzYrE3ToDYQaDek84E=;
        b=NvAQSkLQpLmRXEsX1jqKh6op6z45e8kYBX9sclnD5vjoB8WAff1Gwig9bBiSDeuof/
         qB8QuqTptsdQvf4u4ezUlSpg+tgKE4B0MZZWcYjUl76udi696w0r0VOTfMLPlUpQhu5O
         wS6r1G0t/uuM157J5g20G6CEbbQiDRPbnJIK1Y1OGXv8ng/r7TV3V2PVCig+xxWI4xdl
         /qr/2NorARXoZNNeQcQ+XSG57epk7/GHUlZQrvufh2rgzIBqP9zkBDBlS0JhLjlflJtI
         KVARKmiugJdlobzXb6amj6U+zTX6zlx4Dic6yCq9Dh/TFYVhPe8vyWlVduiSU++6+8h4
         yi3g==
X-Gm-Message-State: AOAM533Fj9LBxnDM4PWvXFithPMSU6STC8qUKuubphaV6KZnLfNzuO1W
        1zGQxmLdOYygApySlXhV2/qwJrv/4i0OFS1AlIjsxoOrubLyc6nF3E7Nju5xUbGOVDseFo+e4uv
        PwRPDFNCBPy3b7SLInRQNv0KG
X-Received: by 2002:a17:907:c0c:b0:6d1:8c46:6415 with SMTP id ga12-20020a1709070c0c00b006d18c466415mr10935123ejc.326.1646692364934;
        Mon, 07 Mar 2022 14:32:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl2qIf+M2py+3MvT2/IBR4c5STLaZRG5tcCXwEd7UYY/YN4KbNF+9+PE1/LHmKYhMmtgn9nw==
X-Received: by 2002:a17:907:c0c:b0:6d1:8c46:6415 with SMTP id ga12-20020a1709070c0c00b006d18c466415mr10935105ejc.326.1646692364745;
        Mon, 07 Mar 2022 14:32:44 -0800 (PST)
Received: from redhat.com ([2.55.138.228])
        by smtp.gmail.com with ESMTPSA id r29-20020a50c01d000000b00415fb0dc793sm5514127edb.47.2022.03.07.14.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:32:44 -0800 (PST)
Date:   Mon, 7 Mar 2022 17:32:41 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: fix config cc version check
Message-ID: <20220307223231.608498-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

.config is of the form:
CONFIG_CC_VERSION_TEXT="gcc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-9)"

while CC_VERSION_TEXT is of the form: gcc (GCC) 11.2.1 20220127 (Red Hat 11.2.1-7)

thus when comparing these, CONFIG_CC_VERSION_TEXT should not
be put in "", otherwise we get () outside "" which shell then
tries to evaluate.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index daeb5c88b50b..d5c03c827825 100644
--- a/Makefile
+++ b/Makefile
@@ -1714,9 +1714,9 @@ PHONY += prepare
 # now expand this into a simple variable to reduce the cost of shell evaluations
 prepare: CC_VERSION_TEXT := $(CC_VERSION_TEXT)
 prepare:
-	@if [ "$(CC_VERSION_TEXT)" != "$(CONFIG_CC_VERSION_TEXT)" ]; then \
+	@if [ "$(CC_VERSION_TEXT)" != $(CONFIG_CC_VERSION_TEXT) ]; then \
 		echo >&2 "warning: the compiler differs from the one used to build the kernel"; \
-		echo >&2 "  The kernel was built by: $(CONFIG_CC_VERSION_TEXT)"; \
+		echo >&2 "  The kernel was built by: "$(CONFIG_CC_VERSION_TEXT)";" \
 		echo >&2 "  You are using:           $(CC_VERSION_TEXT)"; \
 	fi
 
-- 
MST

