Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DE3207D79
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 22:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391429AbgFXUe2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 16:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406505AbgFXUdT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 16:33:19 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C814FC061573
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:18 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id 94so2105261qtb.21
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=p5Zjwl0fzbxC+wniz47UyXQT+jPezYAnZAW9sm53Gyo=;
        b=I3ECgl1rBLWOyBs5RtnQDte2DTgBK8OvV3bMelQO3YzMeXJZPelqzsYzrwhg4KISwq
         Q8EP/5Rt6Nxpn5jlDw36BbBCGJdZtB2lqDV3jxoCeZsxATVA/6EywW70IFQ8KMkMtwcs
         8ERi7Vnp6AvUX047q7Y6jPhoYIU9tYESBFs78HyX/W7KrPxM3sHVTb3fYIZB+7Vx8nAt
         TaK2/xswynOZBsPbNiwRJQVa2aWgCfk+6/lVEiWQobeXdeiVAy43gwzfUDm/34ApF0Y4
         fmT1yzxDDHGNjYUCuAffxFCE77GVNDIobyJaeYAtR60VuSJZiMITgzBrUO93ylah82EN
         IIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=p5Zjwl0fzbxC+wniz47UyXQT+jPezYAnZAW9sm53Gyo=;
        b=OMS64jHWqj4sd3DL96ZuJfyB0YM9SLXjyktvvMlb0p7/URkWmDTrjbQpesNW8fB25R
         jlhSzDWuKxzc9GMH7tOFCIEXLsPgOxeRn3FzqgOfaZ2Ip/OjqHRLBG2PaWC5oTt+yxy8
         l3qOYCT60yc9uISVMPYhTnr6DU4gpojxIDtRgAnV9iBYTsbHAVlF4kYNP8ywcTqbkCKU
         jP9327q7/+9DU0aECr085vdVCK3tSV2IVmHPpYJf51wvZL3lX6avsA1+IBFsYxD3mleh
         KEDNyqKecSIEkMDU8dMyWTSfbypnydR9mJCOe4y5HYr2s9zQpliPwA7pDm4ZzYIihe79
         KayA==
X-Gm-Message-State: AOAM533VZX/Nn1P5vCepspJH2kIequLISlSAjEwPvzR6uu+ydAv9IpTg
        SvWMJSis8Im2pwaWgVDplJ+MX+iG4WjLVaQvPr8=
X-Google-Smtp-Source: ABdhPJyshGcPxjTPdha6DvqMYpNo5yMpiv1hRNsXXOAKSMJ35QF93WrzoPN7b85RoUoCmPb47/iApkRUf/bzOcmqP9w=
X-Received: by 2002:ad4:4526:: with SMTP id l6mr8754125qvu.16.1593030798020;
 Wed, 24 Jun 2020 13:33:18 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:31:49 -0700
In-Reply-To: <20200624203200.78870-1-samitolvanen@google.com>
Message-Id: <20200624203200.78870-12-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 11/22] pci: lto: fix PREL32 relocations
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With LTO, the compiler can rename static functions to avoid global
naming collisions. As PCI fixup functions are typically static,
renaming can break references to them in inline assembly. This
change adds a global stub to DECLARE_PCI_FIXUP_SECTION to fix the
issue when PREL32 relocations are used.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/pci.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index c79d83304e52..1e65e16f165a 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1909,19 +1909,24 @@ enum pci_fixup_pass {
 };
 
 #ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
-#define __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,	\
-				    class_shift, hook)			\
-	__ADDRESSABLE(hook)						\
+#define ___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,	\
+				    class_shift, hook, stub)		\
+	void stub(struct pci_dev *dev) { hook(dev); }			\
 	asm(".section "	#sec ", \"a\"				\n"	\
 	    ".balign	16					\n"	\
 	    ".short "	#vendor ", " #device "			\n"	\
 	    ".long "	#class ", " #class_shift "		\n"	\
-	    ".long "	#hook " - .				\n"	\
+	    ".long "	#stub " - .				\n"	\
 	    ".previous						\n");
+
+#define __DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,	\
+				  class_shift, hook, stub)		\
+	___DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,	\
+				  class_shift, hook, stub)
 #define DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,	\
 				  class_shift, hook)			\
 	__DECLARE_PCI_FIXUP_SECTION(sec, name, vendor, device, class,	\
-				  class_shift, hook)
+				  class_shift, hook, __UNIQUE_ID(hook))
 #else
 /* Anonymous variables would be nice... */
 #define DECLARE_PCI_FIXUP_SECTION(section, name, vendor, device, class,	\
-- 
2.27.0.212.ge8ba1cc988-goog

