Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC8864CB1A
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Dec 2022 14:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238054AbiLNNV2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Dec 2022 08:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238130AbiLNNVY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Dec 2022 08:21:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C4821822
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Dec 2022 05:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671024028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Bmga69YxkLBLEgiPdQiTljNZS1P5tv9l9U0MAYxynq8=;
        b=U3nz0lkjsmOFNNeJeEgFZszKhYm+5MFQKOKmbATZpAO2mBONu1dRmiaHp3f7eH02/n0G/u
        z/ybTxNa/6dbwAbWzFLakpPEFVrZv8BReQt+yy5Q27pSi7N27lbyM0sVgOhMUcOO+PIguV
        aUj6GQUS3G9Yz5FcqS0yhGW5VkPsLYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-AInqc5VfNrWNIG6tX6P52Q-1; Wed, 14 Dec 2022 08:20:25 -0500
X-MC-Unique: AInqc5VfNrWNIG6tX6P52Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38B55857F82;
        Wed, 14 Dec 2022 13:20:25 +0000 (UTC)
Received: from boop.brq.unsha.net (unknown [10.39.194.9])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 14F2F492C14;
        Wed, 14 Dec 2022 13:20:22 +0000 (UTC)
From:   Veronika Kabatova <vkabatov@redhat.com>
To:     linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        ardb@kernel.org, catalin.marinas@arm.com, jeremy.linton@arm.com,
        will@kernel.org, masahiroy@kernel.org
Cc:     Veronika Kabatova <vkabatov@redhat.com>,
        CKI Project <cki-project@redhat.com>
Subject: [PATCH] buildtar: fix tarballs with EFI_ZBOOT enabled
Date:   Wed, 14 Dec 2022 14:20:02 +0100
Message-Id: <20221214132002.2547357-1-vkabatov@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When CONFIG_EFI_ZBOOT is enabled, the binary name is not Image.gz
anymore but vmlinuz.efi. No vmlinuz gets put into the tarball as the
buildtar script doesn't recognize this name. Remedy this by adding the
binary name to the list of acceptable files to package.

Reported-by: CKI Project <cki-project@redhat.com>
Signed-off-by: Veronika Kabatova <vkabatov@redhat.com>
---
 scripts/package/buildtar | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index cb54c7f1aa80..4d6f0b128efd 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -122,7 +122,7 @@ case "${ARCH}" in
 		fi
 		;;
 	arm64)
-		for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo ; do
+		for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo vmlinuz.efi ; do
 			if [ -f "${objtree}/arch/arm64/boot/${i}" ] ; then
 				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 				break
-- 
2.38.1

