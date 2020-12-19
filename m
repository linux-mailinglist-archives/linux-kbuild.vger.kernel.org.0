Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9702DF071
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Dec 2020 17:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgLSQZq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Dec 2020 11:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgLSQZp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Dec 2020 11:25:45 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98329C0613CF;
        Sat, 19 Dec 2020 08:25:05 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id w5so6289337wrm.11;
        Sat, 19 Dec 2020 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BqrM7vBnZgy1neZwerAnSu/Di9ko8MwnICVCM0MML0s=;
        b=SF3r1Dqgf2Xq2f7jZP5sxFnYN1VU97vC3Azay9O0/xdoRRXSBer7I9hjnXzJbr0Bk3
         ZLCcrvUMAQhwqs46kIseJymIxgRSktEheMIufz8e8zStaQrBEUaBOvzazQsXzzlddrAD
         J7R6wzghJ2v5KzNDtlmhEocPsie+RY5fPpqwkzHqDuATIVppupzEPuhh79NGWJ3gveWb
         yphXdyYAOnzkuIk7ySlWKUZ/yrT39eeNSbeakW3pcCjyHseddHTkFedSL6Z7mJAr9mTL
         ojG/TIaTWQuCtxtvR4uGusnVgbDyNKfxW0H0AJrL6F7+5WHCy1/Vi9t2xtt8V4kII5Uo
         n9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BqrM7vBnZgy1neZwerAnSu/Di9ko8MwnICVCM0MML0s=;
        b=hwCVGBI/ZvDGNRG8fchBZvOpeQLXMNAqoVNCmuxvTN5C8E3fWIgKzcFKdresDmm+tD
         WAllEnBx3/QizH93fP46+uxKbG09yo/NSzT8TDkAlyQnRfCQls8G73iVxpO9FLzEy5v8
         /rxKcPHggrhS1b6nPuot/Ejfuw6awYeQE50oBUvgjiHkS3uZvWK++WoIUf8eDtqOVRud
         ZEb/e7s0e80Uiw73tJCJeLMFIbxcQ+3RUuGyEee6m0+9j5ILF6Wzm38bylTApJxn0rYb
         xDSZ/1n8kj72I2TudIlLZ7Cbq2DdTVzNbrIL6/f9jMdGcKTuEs2o52oSucX3i3mRnVZD
         /zWg==
X-Gm-Message-State: AOAM530az3ExIi0AAuQYPEmKvtdrXbassKb9Ee+rbLcMIQjWON9agSSL
        WhaZbDZgNyy+xZD6t/o1JMU=
X-Google-Smtp-Source: ABdhPJygGQH8MdpcWrRp1zig5Kc7RNOQjILOjktzEY97h51iIwNQGLPslebtEGU3AfT3nrwMDdOA6g==
X-Received: by 2002:a5d:6749:: with SMTP id l9mr10127199wrw.395.1608395104306;
        Sat, 19 Dec 2020 08:25:04 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2dee:f900:595c:74f6:9319:8cea])
        by smtp.gmail.com with ESMTPSA id z21sm15339063wmk.20.2020.12.19.08.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 08:25:03 -0800 (PST)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: adjust GCC PLUGINS after gcc-plugin.sh removal
Date:   Sat, 19 Dec 2020 17:24:56 +0100
Message-Id: <20201219162456.19790-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 1e860048c53e ("gcc-plugins: simplify GCC plugin-dev capability test")
removed ./scripts/gcc-plugin.sh, but missed to adjust MAINTAINERS.

Hence, ./scripts/get_maintainers.pl --self-test=patterns warns:

  warning: no file matches    F:    scripts/gcc-plugin.sh

Adjust entries in GGC PLUGINS section after this file removal.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20201218

Masahiro-san, please pick this minor cleanup patch on your -next tree.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5eafee83bc6..fd3b06636c5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7371,7 +7371,6 @@ L:	linux-hardening@vger.kernel.org
 S:	Maintained
 F:	Documentation/kbuild/gcc-plugins.rst
 F:	scripts/Makefile.gcc-plugins
-F:	scripts/gcc-plugin.sh
 F:	scripts/gcc-plugins/
 
 GCOV BASED KERNEL PROFILING
-- 
2.17.1

