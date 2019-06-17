Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4A047CE8
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jun 2019 10:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbfFQI1H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Jun 2019 04:27:07 -0400
Received: from mail-vk1-f202.google.com ([209.85.221.202]:38496 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbfFQI1D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jun 2019 04:27:03 -0400
Received: by mail-vk1-f202.google.com with SMTP id u202so4497957vku.5
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2019 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=x00LgSmLKToDFMVzGBRd3p5tkepZRYMdj+2oyEasIr8=;
        b=QRuUpR7fe5b6KQBbrm5CJpf+ld0Qdmum4wKPR1jUB+VQRr9GS6e7oJ5ulOSoALkGRP
         ovpTcXb4G9btECrBBzgf45fxCMM2GXv30izjPgnZKuYLFrpwe3HXhZDQB73XVrAejJxD
         IgfII4Z9jaY8fPVzbtqxbOwVsCvGiB0RF4Mffv1td7BVKS1Kx0JJZAXyrkGkivyiYA63
         hsgbC0KTmy8G9zVu3WhXcfLq7dYt6rebWJmZYOhXohOw40uDx9fx1rlyjCam74q3M300
         OpJon9kmObZYZt7VkAjWX8Hir7yRWcNZaLM02mxdF6GX3sH1HnSt2LSrmWpaGI1AehdZ
         m5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=x00LgSmLKToDFMVzGBRd3p5tkepZRYMdj+2oyEasIr8=;
        b=pGLrAyJ2UU0Z1uWYj81rzFpYMiF6fEHQiA9WlhTi3ULQ6qxUGrc1d26uxH21DOijFX
         w2tO1W98wzOCNYLBCfIRc50CGMWNUcUh6KKNs+nMHhPSo9JT2GDBnYeYc3Qvjs3kDVw9
         WEAHA51MjF/ir6PCfBy5tA4LuF96k1fRCIFAAiKfwHKxHpcUIXDSfIPMmQkNAcYmUbB6
         pSbx5srYSNZpFfSk8nw7hlshXiu+4tDuIDVGhLJN/58eV/ATh45MC9nlq4l++P8dJ4cK
         7fUDIZZiZn9j/hqIQPqKQgkwHQ/5KJzSW+OSNKr/fxtTh3xV0UKJz5RdXhwOD0HKd6Mp
         EgWw==
X-Gm-Message-State: APjAAAWpY/2kJBZ65Xjr26NsNYm8WSxqmb+IwaZXZ1qAtVa9q+68gYrA
        Nov9CfmlvlXNSThxw6QkdKX9YWsAnZ1wYHcBQ+sD7A==
X-Google-Smtp-Source: APXvYqw0AQqNp/70EN0nmAb/HcpHOuljd/qoLNtxJ0Hn2/jd1Zqa5j+kjBpA0VFAeCRj9jxoqQZAwaaDKLUcJqXCrNqWPg==
X-Received: by 2002:a67:6d44:: with SMTP id i65mr58904024vsc.106.1560760022147;
 Mon, 17 Jun 2019 01:27:02 -0700 (PDT)
Date:   Mon, 17 Jun 2019 01:26:01 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH v5 06/18] kbuild: enable building KUnit
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the root Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
---
 Kconfig  | 2 ++
 Makefile | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Kconfig b/Kconfig
index 48a80beab6853..10428501edb78 100644
--- a/Kconfig
+++ b/Kconfig
@@ -30,3 +30,5 @@ source "crypto/Kconfig"
 source "lib/Kconfig"
 
 source "lib/Kconfig.debug"
+
+source "kunit/Kconfig"
diff --git a/Makefile b/Makefile
index b81e172612507..4b544a8eebee4 100644
--- a/Makefile
+++ b/Makefile
@@ -991,7 +991,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.22.0.410.gd8fdbe21b5-goog

