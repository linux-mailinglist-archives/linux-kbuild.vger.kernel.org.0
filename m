Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3618727FAE2
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Oct 2020 09:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbgJAH5e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Oct 2020 03:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgJAH5e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Oct 2020 03:57:34 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69EB7C0613D0;
        Thu,  1 Oct 2020 00:57:34 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so1993389wmi.0;
        Thu, 01 Oct 2020 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fO/xwDjrhenhlWFGk3DdZkVFlX+/hkokIVqB85yj9q8=;
        b=Bwqx3uHyCyScf2SC7J0dP6b8TluUSYa3R57F+xWoWEDaEK+o7QRMP+bCtb+0kvaBD9
         h+22TRDB+CqJMxYCVuW2YKGT90lchFukm71dkB8lFRdI6sJS5o9TOUmP3ttxhokvDe6O
         8yOqJesCuSSmpxXc7pEcvlQyy0mLiWDb8S6r8DCQ3VcsjdaClp6f70GjcpPnKvCHZlbw
         62VskwilqJr+7miBCi794mo/B/UKfzfI9CitGwoG+hV1xoD3IP1l+iYKkH44mEVIkZzq
         OCO8TGmoef9l55dzoRUX/liwp2LoIk5QKo9rTIJPY/p/uR+MHRqZuNcQWmaHuwjJo1TM
         vykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fO/xwDjrhenhlWFGk3DdZkVFlX+/hkokIVqB85yj9q8=;
        b=FzVkv5LGEOYLg/j/LfX0unmSv+mUOVdp97tY2AZGXK4rbexZO8twm0VW2TfGnOCgDY
         By9b7c/10gYRUMJeY1lvWCYGThlCTQXgpGbbyC5e5RFw746lqp5jDm0CDRk1t31V+ZOJ
         DprQ/pIklYzCpN6Fv8pAeyFQsj80SjLJwNzIzrtZVtBoJMFGg9gwvXJV2B3XBD0WELDF
         FwP9B8kHajqvsM7fahDmSnsRYQPXO1sdZNwElyp5mgK17Gr/nuYQfjVbTYpQ26gcS/kJ
         PB5opwf0dVbfXmDt9/OzvwLQqOwLlQmGRpSbE9Ho1gScQP5QPKaJoFgy5J6OXQxj4rlk
         MB9Q==
X-Gm-Message-State: AOAM532KhO12coUSEhyW6n/u2ReIdqI6TeVDf1W5mjU0HDK4NeeRSTU0
        txDQ3d5fuoh+MQCLD4nuZFk=
X-Google-Smtp-Source: ABdhPJzqmTeSoVSj3eZWfMKoqv/hpLTEtUApfBAwXbTtQp2UVy5XutKX6uMVXd+nsjlytHcsbI/NNw==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr6819205wma.81.1601539053027;
        Thu, 01 Oct 2020 00:57:33 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d4d:ba00:2c39:a8cb:1b2a:4845])
        by smtp.gmail.com with ESMTPSA id b64sm7500948wmh.13.2020.10.01.00.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 00:57:32 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] kbuild: doc: describe proper script invocation
Date:   Thu,  1 Oct 2020 09:57:23 +0200
Message-Id: <20201001075723.24246-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

During an investigation to fix up the execute bits of scripts in the kernel
repository, Andrew Morton and Kees Cook pointed out that the execute bit
should not matter, and that build scripts cannot rely on that. Kees could
not point to any documentation, though.

Masahiro Yamada explained the convention of setting execute bits to make it
easier for manual script invocation.

Provide some basic documentation how the build shall invoke scripts, such
that the execute bits do not matter, and acknowledge that execute bits
are useful nonetheless.

This serves as reference for further clean-up patches in the future.

Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
Link: https://lore.kernel.org/linux-kbuild/CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com/

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
RFC v1 -> RFC v2:
explain why execute bits are still convenient.

Kees, Andrew, please ack.

Masahiro-san, I have taken your feedback into account. Please pick this small
documentation update into your kbuild tree.

Ujjwal Kumar, a potential future mentee, will follow up with further fixes to
the build scripts.

 Documentation/kbuild/makefiles.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 58d513a0fa95..bd3e1baf58be 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -21,6 +21,7 @@ This document describes the Linux kernel Makefiles.
 	   --- 3.10 Special Rules
 	   --- 3.11 $(CC) support functions
 	   --- 3.12 $(LD) support functions
+	   --- 3.13 Script Invocation
 
 	=== 4 Host Program support
 	   --- 4.1 Simple Host Program
@@ -605,6 +606,25 @@ more details, with real examples.
 		#Makefile
 		LDFLAGS_vmlinux += $(call ld-option, -X)
 
+3.13 Script invocation
+----------------------
+
+	Make rules may invoke scripts to build the kernel. The rules shall
+	always provide the appropriate interpreter to execute the script. They
+	shall not rely on the execute bits being set, and shall not invoke the
+	script directly. For the convenience of manual script invocation, such
+	as invoking ./scripts/checkpatch.pl, it is recommended to set execute
+	bits on the scripts nonetheless.
+
+	Kbuild provides variables $(CONFIG_SHELL), $(AWK), $(PERL),
+	$(PYTHON) and $(PYTHON3) to refer to interpreters for the respective
+	scripts.
+
+	Example::
+
+		#Makefile
+		cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
+			     $(KERNELRELEASE)
 
 4 Host Program support
 ======================
-- 
2.17.1

