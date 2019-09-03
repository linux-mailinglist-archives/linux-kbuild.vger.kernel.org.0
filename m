Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6D3A6C50
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2019 17:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbfICPHn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 11:07:43 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:52362 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729835AbfICPHm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 11:07:42 -0400
Received: by mail-yw1-f73.google.com with SMTP id d18so13594794ywb.19
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2019 08:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QzLwUka7MndmPbLBfBjtnVUWcO8y+yUapUjSVd2AkdE=;
        b=PB5Ah+kYC1m4B/Vqzh02d5Dma2M2yVL7Bdqf/cgU5C5/QHZXWWxWusz5yxJTxv/UaW
         cPQ+if9lMxNZfGZL8S6lAAv/KZXOdRW/TgOTyyk2SxYWVb84rGwfPhHTdzrwyml3fyYR
         zMB9ShCEW07O4VXQZsewgm0bwovFzEdsUHPpP51HT13xk3Eva1qhEajcX6jZ8XP0Sq9l
         WK3aEEJXUIn/x+ktaxUYG8u++q7nTs10fbIeFJFJgHQ61R003giZa7EC3s1heJ+v3BkU
         DhFAq5i9QktVcROUV7GZTvihIhoDpLPBW6QkwLuwo8b24v/88OsKzS4oZLrp9/OjXMdl
         ZYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QzLwUka7MndmPbLBfBjtnVUWcO8y+yUapUjSVd2AkdE=;
        b=H2MmxACdJ0Mgpf6Yl0VnK/bpMh/a+BBORGnJCL7/8lWvmFwgVqWPyP2UojAK/OTW/o
         fcRWDZ2okU+WGgM5L0V0hO0KQ6nKP6on1WtXHbkEQ3SaLiIgtZ9LVQpOnYrxBi9R/Ll3
         LQ65x6bg1VLhiAGXA57CttSvmibwXjtBBZuhrqWPuUYvcwuLcelaGtR0Dh+05FWPabg5
         axVSC8KJ5wXx3/2TG9uHkpPayo+XNVdWBWOj1IhwVa5Qnz+Au2IjoW/iTC2gJ5XgVULl
         wih2mqqoIrrVywFy0R4KxMMcM2PvpSFc0Yi3MCEwtfqtJsXRy5pVUlmNW5b/VJ3iADPQ
         1wTQ==
X-Gm-Message-State: APjAAAXMxy8anJGZcjdi6CRGSCU46MCT/ngZjjnffnw3CAEEVMPDBDQ0
        LACIzKkHJk9ThNau9jpkhyz0LpCyp9ro9g==
X-Google-Smtp-Source: APXvYqwwwghshBlXbu3SzPrPSRDK2LVE5Xdl4WcySrrwEMVrzGCbbqWqp4Yfsy68npcFDyQxAHFyHkK5McSccQ==
X-Received: by 2002:a81:9ac2:: with SMTP id r185mr25908588ywg.210.1567523261200;
 Tue, 03 Sep 2019 08:07:41 -0700 (PDT)
Date:   Tue,  3 Sep 2019 16:06:32 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-7-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v4 06/12] export: allow definition default namespaces in
 Makefiles or sources
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
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

