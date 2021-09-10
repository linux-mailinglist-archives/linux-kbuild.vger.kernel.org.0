Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C804A406CB5
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Sep 2021 15:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233185AbhIJNLS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Sep 2021 09:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbhIJNLP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Sep 2021 09:11:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A0AC061574;
        Fri, 10 Sep 2021 06:10:03 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id n2so4055624lfk.0;
        Fri, 10 Sep 2021 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=439WSCXghGLfxplaln+p2Ld0eH8qy3v3OuLBfSe5paw=;
        b=Olo36lTI6w1D4K/USoWPbMfsUWM84YPKKQ8GzfyOJe8Ct5D8akwQrFvX/Y6PHDjIq8
         oUEHNf0kiZV6uUWNH/rtKZOCebDPG5Dm+ohB/ofc5OFQ76lGpsL/H80BZnpLKfAVR5Hw
         3kJX7ypayVXm/OtFfGiJIYeADCyNWmWhaLJAKSxebdWcOFoG6lqGXrBGuNHLegGSqGh0
         oPYYHnLST7MzVQYp0UrarZfhIH+z19TOVMdsaaq7Dn8oDKykMjM1XD+t+TwQeNt9BpLH
         2e9DbM0Qo5V62kW+sfwgNr+SiE3U1WDSQKUcPmu3LjSd+QXq+Otq5sd3zHP7xCJpY/OJ
         b41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=439WSCXghGLfxplaln+p2Ld0eH8qy3v3OuLBfSe5paw=;
        b=G0vYXKW+hl7odGPDpye5fkjtLmGAXxp8HgmNinsRt+FhzKMiFA9qn7f00aR+djuG4q
         TsjD7gakChabwl1MSa8wA849ckKiMmR4SOjEryEtSYqb/kbZwS8ciHaIEibaQz0ciLCG
         6n3j35VETmcd+C9ii0ciVmzMpzXX2U6iduUeFmiev4IirWMeaDwR/fPfXsN/fif60/yP
         AwzUd0vo9C3WJK3hlKT46y6nO9DR0JfGJZgl363CMTcVChx6e4OqlP9pu8CtGpP7meBd
         u/8YXi1nB81f6c5/1LDzzrl7IZmGWJsuwoJvTLl+2cJvRynXgLy9IEIYXqT4aUvYX8sh
         dyHQ==
X-Gm-Message-State: AOAM533Dai1Z/aK5U6bheGG0hAA4yYRF8IuN52pcTsw1ypq0cpQgVksP
        cAtX1qm7sZCUsqBJtZYkIp9cihfNsIPhjw==
X-Google-Smtp-Source: ABdhPJwFKbYIctuBc85bTEN7vgMikt755m6pZHqu8DQNw7X8HcvavPlwEzC7YXRteiEIA2p2tSZEGA==
X-Received: by 2002:a05:6512:3e28:: with SMTP id i40mr3851671lfv.10.1631279401506;
        Fri, 10 Sep 2021 06:10:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a31a:e13a:eb00:c5cf:27cc:1ef2:859])
        by smtp.gmail.com with ESMTPSA id u21sm547999lfc.239.2021.09.10.06.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 06:10:01 -0700 (PDT)
From:   Piotr Gorski <lucjan.lucjanov@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>
Subject: [PATCH] kbuild: use smaller dictionary size for zstd module compression
Date:   Fri, 10 Sep 2021 15:09:54 +0200
Message-Id: <20210910130954.1392104-1-lucjan.lucjanov@gmail.com>
X-Mailer: git-send-email 2.33.0.142.ge0a2f5cbc5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

By default, zstd without parameters uses a dictionary size of 8 MB.
However, most modules are much smaller than that.
Use a dictionary size of 2 MB for module compression, resulting in
slightly higher compression speed while still maintaining a good
compression ratio.
The --zstd=wlog=21 option is equivalent to --lzma2=dict=2MiB used in XZ compression.

Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
---
 scripts/Makefile.modinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index ff9b09e4cfca..c3475e5aca7c 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -97,7 +97,7 @@ quiet_cmd_gzip = GZIP    $@
 quiet_cmd_xz = XZ      $@
       cmd_xz = $(XZ) --lzma2=dict=2MiB -f $<
 quiet_cmd_zstd = ZSTD    $@
-      cmd_zstd = $(ZSTD) -T0 --rm -f -q $<
+      cmd_zstd = $(ZSTD) --zstd=wlog=21 -T0 --rm -f -q $<
 
 $(dst)/%.ko.gz: $(dst)/%.ko FORCE
 	$(call cmd,gzip)
-- 
2.33.0.142.ge0a2f5cbc5

