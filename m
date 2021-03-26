Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 838AF34B136
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Mar 2021 22:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhCZVVo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Mar 2021 17:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhCZVVO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Mar 2021 17:21:14 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 525B4C0613AA;
        Fri, 26 Mar 2021 14:21:14 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id j17so3642707qvo.13;
        Fri, 26 Mar 2021 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LLonIlky5FIrld6pnMKJcpbE7r4hCj6KXZUvdY/ilg=;
        b=YBxNmrtGQDHvVIZIAWp1w7QaS/Y0v8Pb93IzMb7NP4N5y/3KttsgmjW5v+Rr/k4zMc
         YNoWLrRcvu/hO1OGCqQdUKuiZhHKwE28m7ubHElE94H63zp5jpV+t0cMqyQPKko9YXo9
         TM4Hq3A0iCIyLp7ulmR7/T3tZBzhDB9MEgSdOhGpOW3OItucsNy/u2gGU0EqwRd5I0Wc
         BUI5JiHqchEdEP3S/bvqMV5utVNhWW0gX9k3spBxhpu1qxPaF8kqJ+nr+cFS6f6X5CxP
         1HmlBn3zF23jNGuhHJ4V7HprW/uLSvtc34SJ0JyzUjL4yFTsoftfSbBEyxvG3GwTDxi3
         E4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LLonIlky5FIrld6pnMKJcpbE7r4hCj6KXZUvdY/ilg=;
        b=oxM9Kb+PYO43cLkbKJIxjEdelcw1uAvtAznSfVcGM3xXn/QrKuj190hWgU7uiokYC/
         pImzDA8Gzg43XjBQs/14QsHp5No4ydnRQXMVXz2QHNBT4nubIQk4sncy4o0UKcjrhrAw
         ux4R91PKQsh4i+nEHAg0D7BqsxsNkcadLafF4bbHJXKaGMVJ16TBZG/8dvRoqwroL8GH
         irhYQwRvfEmOnJTLxywsXPCT/spzIbrsPK4vxhMas0FMTq5fKRAgT7G/s444uxLSfQbj
         4CgmCOTd/ovkN2PPkqnUpGW97JYQu5A2bfpKG9sapHTWJKW9MPz7X0nu6f5IJs2K4YpF
         jKFA==
X-Gm-Message-State: AOAM531Ycyfu+zkPqDjQ5SOklezr+69AWS34WOcmR011CcJoALArHUkj
        z1tWPVltAc1tLEAe45rvtPc=
X-Google-Smtp-Source: ABdhPJx4fbqHRzCHEsBiA3h4Fdxmts/TB6THFZPY6u54J4VCm4sLkOQSqfd5ZE4AE2k1QGsCaIJsog==
X-Received: by 2002:a05:6214:388:: with SMTP id l8mr15388325qvy.33.1616793673625;
        Fri, 26 Mar 2021 14:21:13 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.30])
        by smtp.gmail.com with ESMTPSA id q64sm6704197qtd.32.2021.03.26.14.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 14:21:12 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     masahiroy@kernel.org, unixbhaskar@gmail.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] kconfig: lxdialog: A spello fix and a punctuation added
Date:   Sat, 27 Mar 2021 02:48:57 +0530
Message-Id: <20210326211857.15156-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


s/propperly/properly/
s/thats/that\'s/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/kconfig/lxdialog/util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/lxdialog/util.c b/scripts/kconfig/lxdialog/util.c
index 1b490d4af0d3..3f78fb265136 100644
--- a/scripts/kconfig/lxdialog/util.c
+++ b/scripts/kconfig/lxdialog/util.c
@@ -363,7 +363,7 @@ void print_title(WINDOW *dialog, const char *title, int width)
 /*
  * Print a string of text in a window, automatically wrap around to the
  * next line if the string is too long to fit on one line. Newline
- * characters '\n' are propperly processed.  We start on a new line
+ * characters '\n' are properly processed.  We start on a new line
  * if there is no room for at least 4 nonblanks following a double-space.
  */
 void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
@@ -541,7 +541,7 @@ int first_alpha(const char *string, const char *exempt)
  * lxdialog suggest <ESC> <ESC> which is correctly translated to two
  * times esc. But then we need to ignore the second esc to avoid stepping
  * out one menu too much. Filter away all escaped key sequences since
- * keypad(FALSE) turn off ncurses support for escape sequences - and thats
+ * keypad(FALSE) turn off ncurses support for escape sequences - and that's
  * needed to make notimeout() do as expected.
  */
 int on_key_esc(WINDOW *win)
--
2.26.2

