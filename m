Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2629E1743D2
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Feb 2020 01:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgB2Ahf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 19:37:35 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43390 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgB2Ahf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 19:37:35 -0500
Received: by mail-ot1-f66.google.com with SMTP id j5so3429554otn.10;
        Fri, 28 Feb 2020 16:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+KGXtOvxiA0IpTTWNq3e4uQPXdV4/lf3e5/qDF38Lbw=;
        b=rhtgoJP1oCCZT0C26VdyNrbCvwM0sfJvBe5RhJq0QLUIatdPFdzR/2GtMF5Tjr5zQ6
         R3ift9SzJo4YL7GIPsH0p/+HdSMYq7NsUNuuIwgdpioXTrzAxGQrLc5nJ+hk6fSkRcuL
         HhiYHvtzx9utMh1+5JX24lj31OWWI/udgiXJFVxRnw5cSkoGNN36f3garIJHm153vuCr
         fsh2zmP0Y5DZ8qqIRwJfub2rRL5VjU59ShvAPbGjIB/6HlJpbkdg2ymjIdDjQSLkiJd/
         MJ+NWz/CoYD6BlAM5bFuY47e+5ZOYJavguh+++peYQd6EgvOQXzA5IoqC78Ve3J203z1
         uEug==
X-Gm-Message-State: APjAAAViOnEVlbyrqz0JqMvQeXqrhzfEybjX+zJ/hQBiaGYWNYVNHs0p
        P/F6wAPaZhNquUPeAuMuGQ==
X-Google-Smtp-Source: APXvYqztcy3vU3MWrA5yZzZErsrUddW8DGwpxBly96I7eJEXM1Uj5MxlM4cz3blE5t1o3Lj/3ITc0g==
X-Received: by 2002:a9d:4e8a:: with SMTP id v10mr5708626otk.17.1582936654034;
        Fri, 28 Feb 2020 16:37:34 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id t23sm3713619oic.28.2020.02.28.16.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 16:37:33 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH v2 2/2] kbuild: Build DT binding examples with dtc warnings enabled
Date:   Fri, 28 Feb 2020 18:37:31 -0600
Message-Id: <20200229003731.2728-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229003731.2728-1-robh@kernel.org>
References: <20200229003731.2728-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that we have a separate rule for DT binding examples, we can customize
the dtc options. Let's adjust the dtc warnings to me more strict by
default so the examples get cleaned up as they get converted to schema.

Leaving 'avoid_unnecessary_addr_size' and 'graph_child_address' warnings
disabled as examples tend to be incomplete and they generates a lot of
warnings.

Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 7c40d5ba1b51..b62c0470f122 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -31,6 +31,10 @@ extra-y += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
 extra-y += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
 extra-y += processed-schema-examples.yaml
 
+override DTC_FLAGS := \
+	-Wno-avoid_unnecessary_addr_size \
+	-Wno-graph_child_address
+
 $(obj)/processed-schema-examples.yaml: $(DT_DOCS) FORCE
 	$(call if_changed,mk_schema)
 endif
-- 
2.20.1

