Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02A028B842
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 14:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbfHMMTd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 08:19:33 -0400
Received: from mail-yb1-f201.google.com ([209.85.219.201]:52905 "EHLO
        mail-yb1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbfHMMTc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 08:19:32 -0400
Received: by mail-yb1-f201.google.com with SMTP id n6so542054ybf.19
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 05:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=5NgEEOsuafidZLfBQW1+8uAN6YPDpjefZYyipohUb1w=;
        b=A0rCIzO1HrKULIk+ltl79te8oL+yJKIRwx4UrVJHdwUX5yyp9GYs4dLvAbOJIpGdfe
         HueqdJXhyRVPVVL2FD7vw9o8IFPjz8RV5MJFgd4D4QgTtlsXaiGnmkj+j5db4+GhrCeH
         mGslTVn5M6Kcv88zBxM1Kts/OutRv5gJuzAhbPJMte99LBE2JnN3XcGXe+j+Odn7ZszO
         MWmVH4oRFy2Iwj9q2XAHxuPIRFJcOw6YPazijDX0o/Xbxdkhjm3BS7GAUFGbobJbhgI5
         uTLHjYkcDb/X4XeFDIsymMzyAmVcjMLbxWMLaOZrRKOBEl3e77UIqo9lAs2K+xAJ4PCq
         UspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=5NgEEOsuafidZLfBQW1+8uAN6YPDpjefZYyipohUb1w=;
        b=VXAzFPE9u5PwenSZ2OLxjXdV6Yawy7b3VL9zJr4dPKFmwdElUMNiL6IliWviQU+o/P
         ZCm1gfxeY8vdJJ2r0Tq7b0sIjLh2IVjWQUMrsQ+hNh6jtvmU66QTMmdS7yaqOVaVzAHE
         pCm6jNK8jMS8RRqvQr0BHTWgh679yS2Ow3TaIcG4kPm2ha/pKzRlO0p1SNRy8P8RbHOI
         e5x467faIGlvQEJTW4LoJGDX4KkeDpe/wf9xVDHV90ytQ/Q1Aa1KEqaEzpwl4SkSC1TN
         IsSAF81SJBctt1rKozOnGcDy1hCWUrP996WuuddATxw4lxFKTDTiGDz3CBVWhkt+S9Cv
         t6yA==
X-Gm-Message-State: APjAAAUeQ3IYAlPxEpH6ju/xWtY2tMTHHJHVSAMqcu+pSsj4N69NAwf6
        7cP5qd8cNWeyp+HgaB1sG8ST3x88t5Ru+A==
X-Google-Smtp-Source: APXvYqzofTNz2fbZb+Pu/dK4amOg+sOn20B/5a6YQykBvqxFwzTuJhcNhOKlhNTjO07MWW5j+Mv9I/hAS9Au7A==
X-Received: by 2002:a81:1d84:: with SMTP id d126mr25341335ywd.199.1565698770861;
 Tue, 13 Aug 2019 05:19:30 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:17:03 +0100
In-Reply-To: <20190813121733.52480-1-maennich@google.com>
Message-Id: <20190813121733.52480-7-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190813121733.52480-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v2 06/10] export: allow definition default namespaces in
 Makefiles or sources
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org, maco@android.com
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
        jeyu@kernel.org, joel@joelfernandes.org,
        kstewart@linuxfoundation.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, lucas.de.marchi@gmail.com,
        maco@google.com, michal.lkml@markovi.net, mingo@redhat.com,
        oneukum@suse.com, pombredanne@nexb.com, sam@ravnborg.org,
        sboyd@codeaurora.org, sspatil@google.com,
        stern@rowland.harvard.edu, tglx@linutronix.de,
        usb-storage@lists.one-eyed-alien.net, x86@kernel.org,
        yamada.masahiro@socionext.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To avoid excessive usage of EXPORT_SYMBOL_NS(sym, MY_NAMESPACE), where
MY_NAMESPACE will always be the namespace we are exporting to, allow
exporting all definitions of EXPORT_SYMBOL() and friends by defining
DEFAULT_SYMBOL_NAMESPACE.

For example, to export all symbols defined in usb-common into the
namespace USB_COMMON, add a line like this to drivers/usb/common/Makefile:

  ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_COMMON

That is equivalent to changing all EXPORT_SYMBOL(sym) definitions to
EXPORT_SYMBOL_NS(sym, USB_COMMON). Subsequently all symbol namespaces
functionality will apply.

Another way of making use of this feature is to define the namespace
within source or header files similar to how TRACE_SYSTEM defines are
used:
  #undef DEFAULT_SYMBOL_NAMESPACE
  #define DEFAULT_SYMBOL_NAMESPACE USB_COMMON

Please note that, as opposed to TRACE_SYSTEM, DEFAULT_SYMBOL_NAMESPACE
has to be defined before including include/linux/export.h.

If DEFAULT_SYMBOL_NAMESPACE is defined, a symbol can still be exported
to another namespace by using EXPORT_SYMBOL_NS() and friends with
explicitly specifying the namespace.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Martijn Coenen <maco@android.com>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 include/linux/export.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/export.h b/include/linux/export.h
index 8e12e05444d1..1fb243abdbc4 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -166,6 +166,12 @@ struct kernel_symbol {
 #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
 #endif
 
+#ifdef DEFAULT_SYMBOL_NAMESPACE
+#undef __EXPORT_SYMBOL
+#define __EXPORT_SYMBOL(sym, sec)				\
+	__EXPORT_SYMBOL_NS(sym, sec, DEFAULT_SYMBOL_NAMESPACE)
+#endif
+
 #define EXPORT_SYMBOL(sym) __EXPORT_SYMBOL(sym, "")
 #define EXPORT_SYMBOL_GPL(sym) __EXPORT_SYMBOL(sym, "_gpl")
 #define EXPORT_SYMBOL_GPL_FUTURE(sym) __EXPORT_SYMBOL(sym, "_gpl_future")
-- 
2.23.0.rc1.153.gdeed80330f-goog

