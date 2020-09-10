Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31375265498
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 23:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgIJV6s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 17:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730275AbgIJLLC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 07:11:02 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC7DC061796;
        Thu, 10 Sep 2020 04:10:38 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s2so2864074pjr.4;
        Thu, 10 Sep 2020 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3W2bdb0e+vZv2IobEZCmlx8ZtuoHGcoFnWn0fOa3N+A=;
        b=TQgH8jJdSxFAmeQUdRjdQpwl+B5PhE7SSixSjXaOAzUsFkz2sao2QfHw2UCjI7N9yc
         +Q87nhy//GLTjfACfAjhpAG6EAy1G1a4dEqwvwkzYPxVhdj91+nkJQxJILXIGwtUFq8l
         ECMjDGg/PyCFdohkMAZc5SFfNqYoj4PVf9W3usx/e4u+JMIiFU6xTg34oQqPRo2n2G7R
         UCXCA/R+ef59WRWuOd135eTsah8IBmCfP0RIHRXCzpfx0xxjVppxtwrlUynMtD4nQItK
         XTR0oR3LssV1OrEoCYTjLztaY+7BisFImoxkhkJdRY6DAv4CaSdOeIU5r+DXLdy/5c8I
         8O3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3W2bdb0e+vZv2IobEZCmlx8ZtuoHGcoFnWn0fOa3N+A=;
        b=DgNTHlCZ26Q+kMYUUb3DuDslIfH6Z0ADpbR+MOJXqn/6NeBw+RsiVfVUO52fmVy9yn
         39PR0yzJLvXXVac2g5F8r0GrdBT90WclYcIsXVWTFk+vCkDd9/8zqVHxavX4m2exTMhv
         2jQW9ebu67wGqir8Tzz2ZXg1cLF74uoMCeY42R7Ax1KccedgF2wG5h3xRkrSsrPNN1g7
         3B6kOI1colldx5fu4TdF7r6F4/5e/ZM4EXcxQhun7+msnoucU5Ftim2XVwc3hA5HnYkY
         6SETn99nVa3ghMOsBPad3/ATicwqlEnXf/pHar0Lgpuc0i0JK+5fii3M69OhimJ2deFP
         pdKA==
X-Gm-Message-State: AOAM532her1SEA1WAGIqx+V1p/q3SZtbacC9zeQBMq/DRiHbzPCBxUu5
        UUfiGwgQsw8RYQx0v5rLs4bZYi8GzUjzqA==
X-Google-Smtp-Source: ABdhPJyWBx4LD38pEzKv/Oc+Tq/xIVJa0GV9yMyc+eCU1LsKMICuutILMwsg21qVoUvF6vY7X88Rtw==
X-Received: by 2002:a17:90b:3c7:: with SMTP id go7mr4701868pjb.97.1599736237956;
        Thu, 10 Sep 2020 04:10:37 -0700 (PDT)
Received: from localhost.localdomain (sau-465d4-or.servercontrol.com.au. [43.250.207.1])
        by smtp.gmail.com with ESMTPSA id 137sm5474699pfb.183.2020.09.10.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 04:10:36 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     masahiroy@kernel.org
Cc:     jeremie.francois@gmail.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts : config : Added example use when run without argument,extend help
Date:   Thu, 10 Sep 2020 16:37:13 +0530
Message-Id: <20200910110713.12782-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch extends the help section by adding an explicit example of use.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/config | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/config b/scripts/config
index eee5b7f3a092..b75a5aab2453 100755
--- a/scripts/config
+++ b/scripts/config
@@ -45,6 +45,25 @@ make time.
 By default, $myname will upper-case the given symbol. Use --keep-case to keep
 the case of all following symbols unchanged.
 
+The concerete example, say, you want to change any particular config ,like
+GKOV for profiling , you can simply use this command
+
+To enable :
+
+#scripts/config --enable GKOV_KERNEL  && grep GKOV .config
+
+ and the output will be like this :
+
+  CONFIG_GKOV_KERNEL=y
+
+To disable :
+
+#scripts/config --disable GKOV_KERNEL  && grep GKOV .config
+
+  and the output will be like this :
+
+# CONFIG_GKOV_KERNEL is not set
+
 $myname uses 'CONFIG_' as the default symbol prefix. Set the environment
 variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" $myname ...
 EOL
-- 
2.26.2

