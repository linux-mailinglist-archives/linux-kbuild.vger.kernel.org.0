Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 371016363C7
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Nov 2022 16:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237758AbiKWPdY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Nov 2022 10:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236921AbiKWPdW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2022 10:33:22 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DED8FD06
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 07:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669217542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=A2V+YK4tVHh2nCeU9Cot6/eXCP2pMa4ER2F24fu2nkI=;
        b=ZAz7tL9hLSbrWiDM1LFPKS0FXx2NHC3rsOV1y0kruQTVYmDZEGguk6sJt0bf9mqI3pfhFe
        l3+LJbblXY2OH5NsOLg19/LYzm2tpltuul1AUP1/gHffGUtD2JSZWglXqJeEpa6dMQJTdU
        oazLL11bC/9SNn4YbeRmT41L0GeaQHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-e_Gm2ZqHPpeT_rqhr5wb6A-1; Wed, 23 Nov 2022 10:32:19 -0500
X-MC-Unique: e_Gm2ZqHPpeT_rqhr5wb6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38606811E75;
        Wed, 23 Nov 2022 15:32:19 +0000 (UTC)
Received: from zickus.redhat.com (unknown [10.22.17.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D83F51400E43;
        Wed, 23 Nov 2022 15:32:18 +0000 (UTC)
From:   Don Zickus <dzickus@redhat.com>
To:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org
Cc:     jforbes@fedoraproject.org, prarit@redhat.com, scweaver@redhat.com,
        ptalbert@redhat.com, herton@redhat.com, jtoppins@redhat.com,
        Don Zickus <dzickus@redhat.com>
Subject: [OS-BUILD PATCH] Adding support for distro targets in Makefile
Date:   Wed, 23 Nov 2022 10:32:03 -0500
Message-Id: <20221123153202.1814324-1-dzickus@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Fedora adds a directory to its source git tree to provide packaging
information[1] specific for its distro.  We would like to propagate our
'help' section to the toplevel to be seen by 'make help' as it isn't
obvious to users to use 'make dist-help'[2].

Instead of keeping Fedora changes local, I am proposing a generic
mechanism for other distros to use if they would like.  The change looks
for a distro directory and leverages that Makefile if it exists.
Otherwise it is ignored.

[1] - https://gitlab.com/cki-project/kernel-ark/-/tree/os-build/redhat
[2] - https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/redhat/Makefile#L809

Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
Signed-off-by: Don Zickus <dzickus@redhat.com>

----
This patch is more of a conversation starter than anything. 

I think other distros might find this useful and examples of what we would
populate the directory with can be found in [1].

Thoughts?

---
 Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Makefile b/Makefile
index 6f846b1f2618f..45fdb18dde46f 100644
--- a/Makefile
+++ b/Makefile
@@ -1635,6 +1635,16 @@ distclean: mrproper
 %pkg: include/config/kernel.release FORCE
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
 
+# Distribution of the kernel
+# ---------------------------------------------------------------------------
+
+dist%: FORCE
+	@if ! test -f $(srctree)/distro/Makefile; then \
+		echo 'No distribution targets defined'; \
+		exit 1; \
+	fi
+	$(Q)$(MAKE) -C $(srctree)/distro $@
+
 # Brief documentation of the typical targets used
 # ---------------------------------------------------------------------------
 
@@ -1732,6 +1742,11 @@ help:
 	@echo  ''
 	@echo  'Kernel packaging:'
 	@$(MAKE) -f $(srctree)/scripts/Makefile.package help
+	@if test -f $(srctree)/distro/Makefile; then \
+		echo ''; \
+		echo 'Distro targets:'; \
+		$(MAKE) -C $(srctree)/distro dist-help; \
+	fi
 	@echo  ''
 	@echo  'Documentation targets:'
 	@$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
-- 
2.38.1

