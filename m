Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60E820A3A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 19:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406507AbgFYRF3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jun 2020 13:05:29 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:51071 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404376AbgFYRFN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 13:05:13 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 05PH4apH005239;
        Fri, 26 Jun 2020 02:04:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 05PH4apH005239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593104678;
        bh=kyXyOZ5U8Hs6howxGxcv+iEKeZZiTyjbIeEnk633oyA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FEFVeaYJ9UAliTtB3rq8v27VAdbMFXTWV4iLqtXO/rfl8r7U93GlYMB+IQ/4YmYjQ
         BAE3FwqLpoXEmJkak0nb/XxHQgUQJphlI66x+6Gkgpq66utHEyuuFGl3p6fymnstwL
         kxxJcXJsoBDgov5xAFFxmf3NM0fHIHDxUHVhVmQQLZYnMJoxahSagKu6Z/i61mh8TU
         Yd4CJNJmpDLQW2BrejLB+xpZxMbZFmZ1ZmImiQlQbsFFN5GJeWF6TTFjnlVxcYxIEK
         j9yhH2oh1Gx8ZFlve1isqtFblmJL5xBXYGMJo9YMccOndcqJac/NPzwhIwMDcSEeEY
         C/sP3xTvwaSlA==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Frank Rowand <frowand.list@gmail.com>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: do not build processed-schema.yaml for 'make dt_binding_check'
Date:   Fri, 26 Jun 2020 02:04:32 +0900
Message-Id: <20200625170434.635114-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200625170434.635114-1-masahiroy@kernel.org>
References: <20200625170434.635114-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, processed-schema.yaml is always built, but it is actually
used only for 'make dtbs_check'.

'make dt_binding_check' uses processed-schema-example.yaml instead.

Build processed-schema.yaml only for 'make dtbs_check'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index f20d234aec46..aa243328ed43 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -52,7 +52,7 @@ $(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := $(DT_MK_SCHEMA_USERONLY_FLAG
 $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) check_dtschema_version FORCE
 	$(call if_changed,mk_schema)
 
-extra-y += processed-schema.yaml
+extra-$(CHECK_DTBS) += processed-schema.yaml
 
 # Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
 # build artifacts here before they are processed by scripts/Makefile.clean
-- 
2.25.1

