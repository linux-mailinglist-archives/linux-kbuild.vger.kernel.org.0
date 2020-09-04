Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6489425E279
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 22:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgIDUOq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Sep 2020 16:14:46 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44238 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgIDUOo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Sep 2020 16:14:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id b19so9375335lji.11;
        Fri, 04 Sep 2020 13:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1nPcs6uIYJoTMe7UpCYI7Qaxwe5ccvKoOMFO4vxWV60=;
        b=hTXUDZ+A2criehHKnNT2x8JalbLl3sxidNzM/3if/SOwhvtyiFHZ3e4mn9GtCvAkRK
         g8s0kfu+OQOK1oFaxoNzZ0wSGADwq0btt3Lcmmqognx9diO0tHgm4nhkvCnQWt85G6CS
         esGvxl9mxX3eZnFq0s7YUUisQv0Mtxx90G1RruIrTpGPOsjLEvZJB1A5pV1Up2Qrc/IE
         c572EwsBZa8Ak+wpq/UPShhXOz7U1qRxFEKK2gb+IfmZOeA9Tuvhh23MHwisM6cJwvH6
         V86SFIWSUM/eMyGlIXXdRMx47p0M4LuQMBuTJQft6qTKPiIBblSAlhLE15zgykUSpUvN
         Khuw==
X-Gm-Message-State: AOAM5312IJWizlVxfkvdM+t2c/7wdebQJrDdNAujQe6X7IL904IYR8PQ
        aoUF/8jkBk4LNihExLSLl748zbQ5NrQ=
X-Google-Smtp-Source: ABdhPJyJJbMs550aFaZADkw8LQ3twVYo0z+lwCCgWFxel3hiq6iB/VZziP9i6TERkJBc3YIqkvqumw==
X-Received: by 2002:a05:651c:10d:: with SMTP id a13mr4433355ljb.217.1599250480659;
        Fri, 04 Sep 2020 13:14:40 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru. [37.110.38.130])
        by smtp.googlemail.com with ESMTPSA id a16sm1468533ljj.108.2020.09.04.13.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 13:14:40 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 1/2] ARM: makefile: Drop GZFLAGS definition and export
Date:   Fri,  4 Sep 2020 23:12:57 +0300
Message-Id: <20200904201258.795438-2-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904201258.795438-1-efremov@linux.com>
References: <20200904201258.795438-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Drop the definition and export of GZFLAGS, because it's
not used. GZFLAGS was dropped from arm64 in commit
4cf234943dcf ("arm64: drop GZFLAGS definition and export").

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 arch/arm/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 4e877354515f..3780063e0be0 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -20,7 +20,6 @@ ifeq ($(CONFIG_ARM_MODULE_PLTS),y)
 KBUILD_LDS_MODULE	+= $(srctree)/arch/arm/kernel/module.lds
 endif
 
-GZFLAGS		:=-9
 #KBUILD_CFLAGS	+=-pipe
 
 # Never generate .eh_frame
@@ -270,7 +269,7 @@ KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)/%include,$(machdirs) $(platdirs))
 endif
 endif
 
-export	TEXT_OFFSET GZFLAGS MMUEXT
+export	TEXT_OFFSET MMUEXT
 
 core-y				+= arch/arm/
 # If we have a machine-specific directory, then include it in the build.
-- 
2.26.2

