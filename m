Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA21312D082
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2019 15:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfL3OHy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Dec 2019 09:07:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:43862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727445AbfL3OHy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Dec 2019 09:07:54 -0500
Received: from localhost.localdomain (aaubervilliers-681-1-20-8.w90-88.abo.wanadoo.fr [90.88.140.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3962B20718;
        Mon, 30 Dec 2019 14:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577714873;
        bh=MvsmnEK/EsYHdXv/PbjwSf38xojnu5xgv/tDp+2SprI=;
        h=From:To:Cc:Subject:Date:From;
        b=ouQVXQjCGLKwr552Y3Cc+86bpDQbEY5GO9CF00aJSaQfVLM3Zts8Ag8NTHT67vjI4
         Ld/2GBxMn7nPqcJdJ/cl22CQpNfxwqTi5U/90xt1NhBK1bQ0k0XD/JR/9AW92wvCXg
         LHAp+4xJJWYOJ1wALKP5Z0BEUaqxXdo75Vwy+yIc=
From:   Ard Biesheuvel <ardb@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, riku.voipio@linaro.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] kbuild/deb-pkg: annotate libelf-dev dependency as :native
Date:   Mon, 30 Dec 2019 15:07:47 +0100
Message-Id: <20191230140747.50415-1-ardb@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Cross compiling the x86 kernel on a non-x86 build machine produces
the following error when CONFIG_UNWINDER_ORC is enabled, regardless
of whether libelf-dev is installed or not.

  dpkg-checkbuilddeps: error: Unmet build dependencies: libelf-dev
  dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
  dpkg-buildpackage: warning: (Use -d flag to override.)

Since this is a build time dependency for a build tool, we need to
depend on the native version of libelf-dev so add the appropriate
annotation.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 7c230016b08d..357dc56bcf30 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -136,7 +136,7 @@ mkdir -p debian/source/
 echo "1.0" > debian/source/format
 
 echo $debarch > debian/arch
-extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev)"
+extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
 extra_build_depends="$extra_build_depends, $(if_enabled_echo CONFIG_SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
 
 # Generate a simple changelog template
-- 
2.20.1

