Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2F52D941B
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Dec 2020 09:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439205AbgLNIWn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Dec 2020 03:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439194AbgLNIWh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Dec 2020 03:22:37 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2037C0613CF
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Dec 2020 00:21:56 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id u7so8530802vsg.11
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Dec 2020 00:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=MgM3pkEsL1Mi0tpGy+KueqxXpvZ/ZcT7AAnI7FkeiUU=;
        b=OAwFQOyeMoN0i462DHGlhdqyMlvO4cAkF04y3OKYpP0zupEe0Ia0Mjqnmy22bbgZzU
         Oc+WCDNLZ1a1+GXbexcS3V4a0tO2nMKuobEsPZif0tsUbRSnHWuVKIyNfB7CWlKvZZSp
         MnnSsUD287EEYnunW9HY8BlXgcOWOuugT0cBfUcXghUs3r2kBcfouGjAeSNa5BfHWfN+
         Yuu/cHhGYh1aoeXbtppwi5W4gqZkWS+l5cu/bqntyh3tb3vQe4XHusTJ9siFqfy9hYlb
         Z5apOF1VxKM4xpmlA/TQYj1+q5TdPFwJyPF3/NbNRTJhYMNB1W4jHWpPxZ1LYVQrdwjC
         ZaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MgM3pkEsL1Mi0tpGy+KueqxXpvZ/ZcT7AAnI7FkeiUU=;
        b=rSg2tZBqSJSzUHkkT+HOktasJRIlj2qIciP3R9hY+q27Mr41gQIvBw+s3xAvuZ4YmU
         jq/TxGfdgkICIj85GZkOcTiXgIK/eeNZb7oEMzt0TUlgBd9fG2/9rUQYEYllPgpZdP7c
         SEdLBy4S+X3tqTBW50H4BJpboNAGmuox0qfhCF218dnvrCgthS7UioLsCrrvIO/NJU0b
         efBP15IcP8PdDS4IcuG1MzshSKH6T/dZ9SgUizD8nLPM4C0jLk9TaH2oI2hpY91Hd7iO
         oRyCOID2r3sOU8mFrWabfPzIr7+lJXtP4TtZYV8PuBIrORzcvxnQLVhzK0Oc5OPNfVU0
         Q0ww==
X-Gm-Message-State: AOAM532AR6c3b3+sZFz0TYcTtFlwxbTWAzLhUD5k82cTjvHR60bbaF/L
        WjexDkD4U5vt5NGyosjYAWHnbKMktLJw7rvFjnE=
X-Google-Smtp-Source: ABdhPJw+tLYZMugdjoe1XmE5CBT8qq6A21Ekcedv8h3RoHkpvKlktLcMUQntMQHiZdvYuh1MXyKKCe29xtId2WA+2Hk=
X-Received: by 2002:a67:32d4:: with SMTP id y203mr22025246vsy.30.1607934115862;
 Mon, 14 Dec 2020 00:21:55 -0800 (PST)
MIME-Version: 1.0
From:   John Millikin <jmillikin@gmail.com>
Date:   Mon, 14 Dec 2020 17:21:45 +0900
Message-ID: <CAL1ky9r9FutN2baRhV_WO-stV1FHKq-par4uv-VfCdofcGhSVg@mail.gmail.com>
Subject: [PATCH] lib/raid6: Let $(UNROLL) rules work with BSD userland.
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

BSD awk is fussy about the order of '-v' and '-f' flags, and it requires
a space after the flag name. GNU awk is fine with both forms, so the
definition of 'cmd_unroll' can be trivially tweaked to let the lib/raid6
Makefile work with either awk.

Signed-off-by: John Millikin <john@john-millikin.com>
---
 lib/raid6/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index b4c0df6d706d..c770570bfe4f 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -48,7 +48,7 @@ endif
 endif

 quiet_cmd_unroll = UNROLL  $@
-      cmd_unroll = $(AWK) -f$(srctree)/$(src)/unroll.awk -vN=$* < $< > $@
+      cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@

 targets += int1.c int2.c int4.c int8.c int16.c int32.c
 $(obj)/int%.c: $(src)/int.uc $(src)/unroll.awk FORCE
-- 
2.24.3 (Apple Git-128)
