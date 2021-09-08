Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DEA4032E9
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 05:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhIHDbn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 23:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbhIHDbl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 23:31:41 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3377C061575;
        Tue,  7 Sep 2021 20:30:33 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id oc9so655955pjb.4;
        Tue, 07 Sep 2021 20:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YCmgiIqK/f2uj+2FIB5ZoM8EM/HSqIdCmUJnhQwVgP4=;
        b=dc9bzny1WKO1FGe6huTtpTsHefn+LffqFdPXd+y+4gPjwBzud1kpZ5EhiyAEpYrN/H
         QhI4DSxGtfB7pncHLAAHSOveW8GqDwwrhhHu4VAOdyznAyKYfG84FLJ5mI9xCXY2UBmx
         lg169RpruRjntuPFhDy/PF7n0qZmtEcuoUWQCYSgh1a9d1sh4Sjl7tdv16M9Hft2CMmV
         mR/Q9u9ERoCuTNyN8fhVC++xgTt0aGbaSGbC0aD9xcxmFKa0N9fAnPpARPH5U3WQ5AjH
         xbeXqzLxh18Zup4wtDo2V+i/gTx5S1LTGhSMXSHeWZO4O+4ng75XAINJvMXT6RpQfz28
         qXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YCmgiIqK/f2uj+2FIB5ZoM8EM/HSqIdCmUJnhQwVgP4=;
        b=jLlUD/Hqixw7LkV+2GHQaDK8e47+QbuJTNDssKCXaeHUVi1JDXJmM3+NfPT+MaIU7r
         IQHnnxVMc9U5OHGBX2VryevvV2a/ui9N4VtofK7ZdnX1K/NlpPMSow/E/q8CebyaIeag
         nLYgJbryRvtX4hFvuFsT5D67qosvtA5tCFmCt8NRCDnZX+K4YhaLV6P/fdOQdIdUEl+M
         UkYeoTHqBefLxmtZSy90vj4+LblZ6NBLIFdznAZP9tZlMEu2d5QiJAAN1n0uc38TeNJk
         Lg4tBLqKuEVFBLPIW8BznO07xcIwgv7Nb3wjBEnGGRm8TMAsygvELmcxQS9yGv6fBCxe
         xnQQ==
X-Gm-Message-State: AOAM5313kBPcff8WsR4em9KF7ct1IeZKKiPYrBBkZWkG+gFnRjORVyZb
        Uhirmbz3R5MixDv+gWdvVvw=
X-Google-Smtp-Source: ABdhPJzDt5UczW+E462e0Rsta+z7TRVsEMOa46W64QdwzX81nyylrn7uzqChkR1kefHPcLE507Bn3w==
X-Received: by 2002:a17:90a:b785:: with SMTP id m5mr1823388pjr.213.1631071833256;
        Tue, 07 Sep 2021 20:30:33 -0700 (PDT)
Received: from localhost ([45.76.146.157])
        by smtp.gmail.com with ESMTPSA id t15sm595283pgi.80.2021.09.07.20.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 20:30:31 -0700 (PDT)
From:   Kortan <kortanzh@gmail.com>
To:     nathan@kernel.org, ndesaulniers@google.com
Cc:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, Kortan <kortanzh@gmail.com>
Subject: [PATCH v2] gen_compile_commands: fix missing 'sys' package
Date:   Wed,  8 Sep 2021 11:28:48 +0800
Message-Id: <20210908032847.18683-1-kortanzh@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We need to import the 'sys' package since the script has called
sys.exit() method.

Signed-off-by: Kortan <kortanzh@gmail.com>
---
Changes v1 -> v2:
* Fix commit title.
* Improve commit message. 

 scripts/clang-tools/gen_compile_commands.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 0033eedce003..1d1bde1fd45e 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -13,6 +13,7 @@ import logging
 import os
 import re
 import subprocess
+import sys
 
 _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
-- 
2.33.0

