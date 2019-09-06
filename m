Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 316BAAB5FD
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2019 12:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393051AbfIFKdC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Sep 2019 06:33:02 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:44011 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393049AbfIFKdA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 06:33:00 -0400
Received: by mail-qt1-f201.google.com with SMTP id b2so5764018qtt.10
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2019 03:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QzLwUka7MndmPbLBfBjtnVUWcO8y+yUapUjSVd2AkdE=;
        b=Cwgi2TD2axl7EA3tVfizddxZpfimXndhfzAvvjo1Y/HcF0VNlztN/wh+wlfI/QRMJC
         721inxt51pWefqg1V5l9Jg7vIvYwuyDi50jczACweEFPDlE/63bksbkxrFi6ZvDA+Ym2
         j3wxi6QRKlHrIjsNMFF2l41QKQDbNXwohYCQEXBJFuJagd5DP0vvlpheldo7lDu3TQjU
         lutZes51nFw36amBGFM2Gc2HE/HknAUImyvRXHV9Dq1T3uWnqG76xU9CdO6hwmYZ7q48
         u0bilHqGVhc7stv688zzu+ASd0t01d+jII1ubYlyGWstv7sY5hXWCc0De+ZsQ/p899eq
         hzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QzLwUka7MndmPbLBfBjtnVUWcO8y+yUapUjSVd2AkdE=;
        b=Rh5ngdvuYg+qgMrHga2xB04HyzUPYgOEATb16Bw8qNTwaJtF3nYhtF8l3QBehnXAf1
         a+ipJ9JRsBxIYwtTwU8jdLehp30uquleCr9z4Yx5XmwsIZJ3XL1ZEJxXj/CumlC2Zil6
         iEHRVGWjmTg6atb5U6H4phWVMKPY8x6hpjjkFXPUMpgOfhDu8k2omAhzwXm9rYSHu+Mx
         2WyF4eN5BMm+LYhjTXmrvApo7sOP6ViwQCh62VGU/0+YVD4stgAkr9TIhZzgPNZa2kfu
         ZHxegOG0eUWTxSfLcPFx2i3uPqyIlDOR0oJPhr1hzrBs0+5GbrObNm9SCHeATg4BNvuj
         uRxg==
X-Gm-Message-State: APjAAAUM5GQaFdcdY2G1F4GeUjyWJgaChgDV7cIVgwgzHzHADtvZszn9
        s+p/3/rAbaP3pD9LZ1Gbe7vj2X+1vLUdwA==
X-Google-Smtp-Source: APXvYqyn74gBgiBJgWNpy+8bHCGt4X+ud03+1T7HA8XDbjuxekyCFIxgsJyLh3BXntLiMcVMNJUiOXBKo5PpJg==
X-Received: by 2002:ad4:5149:: with SMTP id g9mr4868362qvq.115.1567765979457;
 Fri, 06 Sep 2019 03:32:59 -0700 (PDT)
Date:   Fri,  6 Sep 2019 11:32:30 +0100
In-Reply-To: <20190906103235.197072-1-maennich@google.com>
Message-Id: <20190906103235.197072-7-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190906103235.197072-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v5 06/11] export: allow definition default namespaces in
 Makefiles or sources
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 include/linux/export.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/export.h b/include/linux/export.h
index d59461e71478..2c5468d8ea9a 100644
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
2.23.0.187.g17f5b7556c-goog

