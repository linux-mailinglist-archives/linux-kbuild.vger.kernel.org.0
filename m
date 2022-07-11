Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5805701B9
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jul 2022 14:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbiGKMJa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jul 2022 08:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbiGKMJ3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jul 2022 08:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9553D2872C
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jul 2022 05:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657541367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=zaosLVlnWVciYYZyhDp77SGO4ThiR5rxhW3IDyN9u/M=;
        b=WWSOi4xjtDyGMjeBVaq6KmFQVzxHMp9sWQGW1LfgBRON/MJ4Dqnn7kjnc/ntp5RsL+DJ33
        EXRLft4Xjx4phfVqm9UdrXttwtXjtMlMVAKJsOaIJNw5p4H6vifddr/ptRvWCQSb/0qOy/
        uLdXOqRJwjn0QsekncGdtmGifFQ7cQ4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-k7KeYiExP3mXvZjlnnPIGQ-1; Mon, 11 Jul 2022 08:09:26 -0400
X-MC-Unique: k7KeYiExP3mXvZjlnnPIGQ-1
Received: by mail-ej1-f70.google.com with SMTP id qa41-20020a17090786a900b00722f313a60eso989579ejc.13
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jul 2022 05:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zaosLVlnWVciYYZyhDp77SGO4ThiR5rxhW3IDyN9u/M=;
        b=an4JsxhT9SgVxbn8PVB3dlHc9vsTMs02JJr8N2fAYimLvPcUyEr18ORCJjumRsk6in
         kGu1TqSGeBq+Akfwe4pL4utrMOJVCNzVdc4ZkzzPGg8bblhw98mSi5oZtpVaL/6g2LNA
         VIUXbsJ+5vqrOiGLZ4Q4XTRTsed2GhbZkqUFRn+wjzo51S0UzjhLx0Ya8uDCh440Bd0C
         kf6lXlWIhLefSVqlkBPslC5cPjPAqvHkFAzSl2+rQLpPoqm9Ej68AFlHTSpqfDhVhpjx
         E2JXwPGGJT1niuIEDjYfLnzMlFmbx/LwQDdCBtHEMOtSqPqNsz1A1Gxx5KNN2OuLKRnL
         QewQ==
X-Gm-Message-State: AJIora/hOWXh1nkDVyyd+SI1cvKaHX68ZHadaMkHbaKrCRMoLbRz67g1
        Wi1lxTWg2BOKxQJBSQsMAwQv7kGixJGaL4+r6BRSkgrULywISxe9wKSOwOCMt1Sqh7J+NbPtrQy
        LPWIYi6ZAUhTec8aKUV41Tjnj
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id ew8-20020a056402538800b00435071b5d44mr23789587edb.364.1657541365068;
        Mon, 11 Jul 2022 05:09:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sx4F93Z1N0j/+DYzGrIOpdmoa/gpc2hPhZCuvB+R1zB9LqywhzONhW+GjNkgBh2dOlVeS8pg==
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id ew8-20020a056402538800b00435071b5d44mr23789553edb.364.1657541364856;
        Mon, 11 Jul 2022 05:09:24 -0700 (PDT)
Received: from localhost.localdomain (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id pw22-20020a17090720b600b0072b13a10477sm2624320ejb.108.2022.07.11.05.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 05:09:24 -0700 (PDT)
From:   Ondrej Mosnacek <omosnace@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: dummy-tools: avoid tmpdir leak in dummy gcc
Date:   Mon, 11 Jul 2022 14:09:23 +0200
Message-Id: <20220711120923.1004759-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When passed -print-file-name=plugin, the dummy gcc script creates a
temporary directory that is never cleaned up. To avoid cluttering
$TMPDIR, instead use a static directory included in the source tree.

Fixes: 76426e238834 ("kbuild: add dummy toolchains to enable all cc-option etc. in Kconfig")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---
 .../dummy-tools/dummy-plugin-dir/include/plugin-version.h | 0
 scripts/dummy-tools/gcc                                   | 8 ++------
 2 files changed, 2 insertions(+), 6 deletions(-)
 create mode 100644 scripts/dummy-tools/dummy-plugin-dir/include/plugin-version.h

diff --git a/scripts/dummy-tools/dummy-plugin-dir/include/plugin-version.h b/scripts/dummy-tools/dummy-plugin-dir/include/plugin-version.h
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
index b2483149bbe5..7db825843435 100755
--- a/scripts/dummy-tools/gcc
+++ b/scripts/dummy-tools/gcc
@@ -96,12 +96,8 @@ fi
 
 # To set GCC_PLUGINS
 if arg_contain -print-file-name=plugin "$@"; then
-	plugin_dir=$(mktemp -d)
-
-	mkdir -p $plugin_dir/include
-	touch $plugin_dir/include/plugin-version.h
-
-	echo $plugin_dir
+	# Use $0 to find the in-tree dummy directory
+	echo "$(dirname "$(readlink -f "$0")")/dummy-plugin-dir"
 	exit 0
 fi
 
-- 
2.36.1

