Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80346F5EE5
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2019 13:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfKIMMZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 Nov 2019 07:12:25 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54876 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfKIMMZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Nov 2019 07:12:25 -0500
Received: by mail-wm1-f68.google.com with SMTP id z26so8731311wmi.4;
        Sat, 09 Nov 2019 04:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yt8Of7OzQamExcGTM8zKyZaMKjTlIkVTlPwq4hoQG0E=;
        b=kzCuIoS800F0U3DY6gYOJ58Yb+8FNtf+YJB1TsPyLky/5yAIXjX1uWGeVrlabvGkuW
         TDvJNUSHqf/K7WttjFUZdX5fcMTey2gQgt1WdiwR+N2sojA3l09XO0SObHhPJvI0pAg5
         V2cLNf2G0sSGygVxWZLE/4MGgNYzuvvFXqiu1lUGPteA72+xzHEh6PnUBZT7FZDwF8JV
         ZUNELKwtpMOcimQ1O2gwxzDOmJw8nEIJsWKJQDZTOeYzE50SP8n0+ghu2uuodmdDLJMt
         L9OhBRlirFJ+GwWQ8wrvWGsU7G8ca8HyIM4hrzlllYipx0HQ73d/sIIYPua0qpwhT25k
         5qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yt8Of7OzQamExcGTM8zKyZaMKjTlIkVTlPwq4hoQG0E=;
        b=VqegyHXZz633Lu2XUuoLOsW+Uma0pUcafGsw4VM1QzcppL0fYqSmd71yT3KIGf828B
         coD4fUE4ZZ5DglxYFBnTZ5OzDDv9B9pEvVH/t/R7zc8VLmrWFsN2iDNHSBnaHxMyp2jU
         Ig5Wc3G30IIWqgvTiQ/YEG2f1kF/XG0O8RnLPAQpgqvQI5L/CWyqtniICq62PK+MrR3R
         TpEOKYNrOophaxCIUmACicR/RBGvtEpkxfGQ6pMO88BApYlZq6w3YJTj0f+/65AD+KIa
         1+lpJyiw/23WPBT0ue4tkotidMml42UKttpITzv1L80ZcjYLZNu42nFycyvmBCPF8w19
         hXJQ==
X-Gm-Message-State: APjAAAWaEy8z3iAH6gmsRJWY1JNbTQukV46nvwV7YbQ8mbgYyJDH8UdT
        D+yZAMbELcY0Dv8YLLcDgW4=
X-Google-Smtp-Source: APXvYqxmlP3a3jfBsD6wjHAY/vSXwWByM5kM2k636DXi9dEu0p8ryLtu6zX4ZantlGVbGRP3PXADsg==
X-Received: by 2002:a1c:6683:: with SMTP id a125mr11420411wmc.74.1573301542997;
        Sat, 09 Nov 2019 04:12:22 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id q15sm9238428wrr.82.2019.11.09.04.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 04:12:22 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] kbuild: tell sparse about the $ARCH
Date:   Sat,  9 Nov 2019 13:12:16 +0100
Message-Id: <20191109121216.61381-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Sparse uses the same executable for all archs and uses flags
like -m64, -mbig-endian or -D__arm__ for arch-specific parameters.
But Sparse also uses value from the host machine used to build
Sparse as default value for the target machine.

This works, of course, well for native build but can create
problems when cross-compiling, like defining both '__i386__'
and '__arm__' when cross-compiling for arm on a x86-64 machine.

Fix this by explicitely telling sparse the target architecture.

Reported-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 6f54f2f95743..05a8906dde63 100644
--- a/Makefile
+++ b/Makefile
@@ -937,6 +937,9 @@ ifeq ($(CONFIG_RELR),y)
 LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
 endif
 
+# make the checker run with the right architecture
+CHECKFLAGS += --arch=$(ARCH)
+
 # insure the checker run with the right endianness
 CHECKFLAGS += $(if $(CONFIG_CPU_BIG_ENDIAN),-mbig-endian,-mlittle-endian)
 
-- 
2.24.0

