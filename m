Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA6420A39F
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2020 19:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406597AbgFYRFO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jun 2020 13:05:14 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:51081 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406507AbgFYRFN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jun 2020 13:05:13 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 05PH4apI005239;
        Fri, 26 Jun 2020 02:04:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 05PH4apI005239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593104679;
        bh=yCu3po5JDvr/urUwFNIX8Igz1GdkBw+tDpNpoGwkueI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zK20S1FDsSM9gpTIqsY04dyGSS/BU8q7BPdup9dDD4ImT4lC6M8j+1cI4d7N/v2We
         UW72X40E2wwGiPA4KWykoqRl680sh/nAiZp6DHA3ZAmpRLOnOme0Cuwrl+SiWeFQT/
         0kv9RNs1W0xMvqQRA3r/a9E+SXk9yEe8eeAZBngoPCdBbUht6GqHsfnPVZZTxdhynw
         5Hqw11SIuWMurywugpqvr5s4mKuw5VL6mnaED6HMx7rAaBfhurqS8rH/WWR+yQqZnC
         4nm+p1Q3He/hLm4ep5qVufoe755KEKbJkSodzXjaPm553WuxaLT87GsleUVRSh9nat
         idWcxEpg7fOOg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Frank Rowand <frowand.list@gmail.com>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: copy process-schema-examples.yaml to process-schema.yaml
Date:   Fri, 26 Jun 2020 02:04:33 +0900
Message-Id: <20200625170434.635114-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200625170434.635114-1-masahiroy@kernel.org>
References: <20200625170434.635114-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There are two processed schema files:

 - processed-schema-examples.yaml

    Used for 'make dt_binding_check'. This is always a full schema.

 - processed-schema.yaml

    Used for 'make dtbs_check'. This may be a full schema, or a smaller
    subset if DT_SCHEMA_FILES is given by a user.

If DT_SCHEMA_FILES is not specified, they are the same. You can copy
the former to the latter instead of running dt-mk-schema twice. This
saves the cpu time a lot when you do 'make dt_binding_check dtbs_check'
because building the full schema takes a couple of seconds.

If DT_SCHEMA_FILES is specified, processed-schema.yaml is generated
based on the specified yaml files.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile | 28 +++++++++++++++-------
 scripts/Makefile.lib                       |  3 +++
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index aa243328ed43..6aac57588e66 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -2,7 +2,6 @@
 DT_DOC_CHECKER ?= dt-doc-validate
 DT_EXTRACT_EX ?= dt-extract-example
 DT_MK_SCHEMA ?= dt-mk-schema
-DT_MK_SCHEMA_USERONLY_FLAG := $(if $(DT_SCHEMA_FILES), -u)
 
 DT_SCHEMA_MIN_VERSION = 2020.5
 
@@ -35,12 +34,6 @@ quiet_cmd_mk_schema = SCHEMA  $@
 
 DT_DOCS = $(shell $(find_cmd) | sed -e 's|^$(srctree)/||')
 
-DT_SCHEMA_FILES ?= $(DT_DOCS)
-
-extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
-extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
-extra-$(CHECK_DT_BINDING) += processed-schema-examples.yaml
-
 override DTC_FLAGS := \
 	-Wno-avoid_unnecessary_addr_size \
 	-Wno-graph_child_address
@@ -48,10 +41,29 @@ override DTC_FLAGS := \
 $(obj)/processed-schema-examples.yaml: $(DT_DOCS) check_dtschema_version FORCE
 	$(call if_changed,mk_schema)
 
-$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := $(DT_MK_SCHEMA_USERONLY_FLAG)
+ifeq ($(DT_SCHEMA_FILES),)
+
+# Unless DT_SCHEMA_FILES is specified, use the full schema for dtbs_check too.
+# Just copy processed-schema-examples.yaml
+
+$(obj)/processed-schema.yaml: $(obj)/processed-schema-examples.yaml FORCE
+	$(call if_changed,copy)
+
+DT_SCHEMA_FILES = $(DT_DOCS)
+
+else
+
+# If DT_SCHEMA_FILES is specified, use it for processed-schema.yaml
+
+$(obj)/processed-schema.yaml: DT_MK_SCHEMA_FLAGS := -u
 $(obj)/processed-schema.yaml: $(DT_SCHEMA_FILES) check_dtschema_version FORCE
 	$(call if_changed,mk_schema)
 
+endif
+
+extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
+extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
+extra-$(CHECK_DT_BINDING) += processed-schema-examples.yaml
 extra-$(CHECK_DTBS) += processed-schema.yaml
 
 # Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 99ac59c59826..fa5022133a25 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -212,6 +212,9 @@ $(foreach m, $(notdir $1), \
 	$(addprefix $(obj)/, $(foreach s, $3, $($(m:%$(strip $2)=%$(s)))))))
 endef
 
+quiet_cmd_copy = COPY    $@
+      cmd_copy = cp $< $@
+
 # Shipped files
 # ===========================================================================
 
-- 
2.25.1

