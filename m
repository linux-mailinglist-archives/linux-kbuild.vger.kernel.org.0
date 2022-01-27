Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E2649D70A
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jan 2022 02:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbiA0BAO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Jan 2022 20:00:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiA0BAN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Jan 2022 20:00:13 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87B3AC06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jan 2022 17:00:13 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id v14-20020a170902e8ce00b0014b48e8e498so643974plg.2
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jan 2022 17:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=dJKNUD3iuu442ap/Za5pEHcy4QO6ctzGW3ukPbvVbWM=;
        b=EUYOgXjTPFKEXtqD40KTU8UpFAGHUKEFFUWkriycEm7WMocUsEI0CcK5GSYYsm8+bD
         I0GXH6Crq+lsLTb1jmknQaS0XNuF5kQlPH7VkjO694gNWvXb6twDJNgKWT8Una1gFVni
         yaSi4ldYWDcoDApSGgpBnXmbBUvn14LnbwrFkcWkHqP+cJsXL1FTB/TLAbZqDIIrnE1t
         aG88sINQO3s9sOybFz/Y7b0APlua2knUtjt9Rl02hEagcPISs4Du163mdb+894hDeonU
         vXYl2rPcb8+EdXsovtNxam37xwu8ayyMURKtwnMnw+njUlADPajJRnzW+fp6BIcfRPK/
         L4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=dJKNUD3iuu442ap/Za5pEHcy4QO6ctzGW3ukPbvVbWM=;
        b=lu9pAgmrQY40kGYqMa1T65mwQJweQFSxVNm7ROqPFbjxdoYmlnf6m3Qe2MEV3IKvHa
         h3egcvKtnQ2MV31UbtFBtlLV2t2LNkqrrqlR13RXBOHBisX6glyckFzTYcETRzFoXMqM
         S3hFLh7JIdlI4vWLfyB5ySKYsKgxxaDds1nreWGLAyGro7Ekii8lEzwlnJTznd9FG7YA
         uHsiLP6a9Mdll0hbMplgYr06eEnxVRVCyKIumOefA6hf7IKX+xIZt4NE/VYN8GDJWH/2
         ZXJlL8gu8fpEnvN/RTwE3U+v3uBekodC+3f99JFPc3P+Ssfd46NZbVDRVzfAf8V2U+7M
         rj2w==
X-Gm-Message-State: AOAM532F7AW9n5ODLVFZ1PJP/TsTxcweLNpsvs7VLOT7tpnj8cE5NKIe
        qXsj2zPOOEtdkf8DOGQgxBQH8XGyx0ybNvb/41s=
X-Google-Smtp-Source: ABdhPJwFSwE3TGA0QbCBNZMR7XSbfhSdLOhd3pQ1YvvEL83+bpnHHSOSsvFNPjYi/9gx1+wKWt1Bv6bRadYw8axp/Ak=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:903:124e:: with SMTP id
 u14mr1596646plh.57.1643245212964; Wed, 26 Jan 2022 17:00:12 -0800 (PST)
Date:   Thu, 27 Jan 2022 01:00:08 +0000
Message-Id: <20220127010009.2617569-1-willmcvicker@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v2 1/1] kbuild: install the modules.order for external modules
From:   Will McVicker <willmcvicker@google.com>
To:     Lucas De Marchi <lucas.demarchi@intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     kernel-team@android.com, Will McVicker <willmcvicker@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add support to install the modules.order file for external modules
during module_install in order to retain the Makefile ordering
of external modules. This helps reduce the extra steps necessary to
properly order loading of external modules when there are multiple
kernel modules compiled within a given KBUILD_EXTMOD directory.

To handle compiling multiple external modules within the same
INSTALL_MOD_DIR, kbuild will append a suffix to the installed
modules.order file defined like so:

  echo "${KBUILD_EXTMOD}" | md5sum | cut -d " " -f 1

Example:
  KBUILD_EXTMOD=/mnt/a.b/c-d/my_driver results in:
  modules.order._mnt_a_b_c_d_my_driver

The installed module.order.$(extmod_suffix) files can then be appended
to the staging modules.order file which defines the order to load all of
the modules during boot.

Example:
  cd $(MODLIB)
  find extra/. -name modules.order.* -exec cat {} >> modules.order \;

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
v2: Use md5sum to fix a "Filename too long" failure when KBUILD_EXTMOD
    exceeds 241 characters.

 scripts/Makefile.modinst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index c2c43a0ecfe0..a6ef273d395f 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -24,6 +24,10 @@ suffix-$(CONFIG_MODULE_COMPRESS_XZ)	:= .xz
 suffix-$(CONFIG_MODULE_COMPRESS_ZSTD)	:= .zst
 
 modules := $(patsubst $(extmod_prefix)%, $(dst)/%$(suffix-y), $(modules))
+ifneq ($(KBUILD_EXTMOD),)
+extmod_suffix := $(shell echo "${KBUILD_EXTMOD}" | md5sum | cut -d " " -f 1)
+modules += $(dst)/modules.order.$(extmod_suffix)
+endif
 
 __modinst: $(modules)
 	@:
@@ -82,6 +86,12 @@ $(dst)/%.ko: $(extmod_prefix)%.ko FORCE
 	$(call cmd,strip)
 	$(call cmd,sign)
 
+ifneq ($(KBUILD_EXTMOD),)
+$(dst)/modules.order.$(extmod_suffix): $(MODORDER) FORCE
+	$(call cmd,install)
+	@sed -i "s:^$(KBUILD_EXTMOD):$(INSTALL_MOD_DIR):g" $@
+endif
+
 else
 
 $(dst)/%.ko: FORCE
-- 
2.35.0.rc0.227.g00780c9af4-goog

