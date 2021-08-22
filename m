Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38CB23F412B
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Aug 2021 21:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhHVTXo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Aug 2021 15:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232845AbhHVTXn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Aug 2021 15:23:43 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7ADC06175F;
        Sun, 22 Aug 2021 12:23:01 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id q3so22757822edt.5;
        Sun, 22 Aug 2021 12:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jdnBbcis2LRjQudu7rmiYqSfk0ZwyRk00EIcmbT2dtw=;
        b=LvvZ9fplj5UTmUNevRsgsFYSQfT5JNWjExroXKrez2z3oolTtazTk8vXwzWzn2CGAg
         hzO02jn0PQePSvej1UvWpItrJgNDulApXtGRL90xbGqVZb5aw2HstzxlHCDeS/wDTaxg
         6ZAsN2+isQ9K56gtD8u8ZidJ5DsjyTts15b0vb6BMX09TBvbG6k1SJgsbofD7A0LgLXr
         5qrBDBb566gYjoFJYmGI2ADEWclmH5aaJUXCwX0Y5+BBT5d12rTzSe3OVNEhOUwrs2cO
         +dQuhOl594T2ssWJuNaMT2gZ7cjtl1W8OBmbe1N8jdjS4b9+WSgMSdzQPVH12JV9OV9m
         f0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jdnBbcis2LRjQudu7rmiYqSfk0ZwyRk00EIcmbT2dtw=;
        b=CQdZPH0x4W6nzTpFKwGvYAWGUiBaCK+Y2R0A/iQtNtGn2BROkEfGVHOCTXopm72+cj
         Ku8eUGmmW/oCDVU8/UztUGSV/vdQB1VU14ZbEYSA+DstZ6mhRH0qZmP70qEEyg3IUxP0
         6EXm0lswxSTqGpqNhrJa6WGnhCZKdE8khXsimZJkvl3ZmtZXi/+7fuKwJaSZHUYwDd0t
         WB+MSBBsU4H5Gw/PegUnsEfJL5tBaBDpNs2Pwj7ui8/ztpJNL/+I5SDqEx8mdyJWtqjk
         427GRxbCv9PdSLjOBuh8sVUNLfwhJ0607f/5msLTu5rzfZV2bm/6Gv1I2C63yNBi4NNQ
         9z9g==
X-Gm-Message-State: AOAM533EhooNZait4UD2n9B+RXDIM1f7ndtpBblJw8X7FQ7kq1286+yu
        QW87FoWwYA+VovbAiVsU34M=
X-Google-Smtp-Source: ABdhPJzw4U8q5rbTZB4+t8IPMaGPN4XsSdfbVfzHaDlRF9s6uGKMK48Tr9YlkcxOHPhdpKwN2NPs3w==
X-Received: by 2002:a05:6402:1c8a:: with SMTP id cy10mr4945814edb.112.1629660180229;
        Sun, 22 Aug 2021 12:23:00 -0700 (PDT)
Received: from localhost.localdomain ([147.235.73.50])
        by smtp.googlemail.com with ESMTPSA id o6sm1577950eje.6.2021.08.22.12.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:23:00 -0700 (PDT)
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Ariel Marcovitch <arielmarcovitch@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit
Date:   Sun, 22 Aug 2021 22:22:03 +0300
Message-Id: <20210822192205.43210-4-arielmarcovitch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822192205.43210-1-arielmarcovitch@gmail.com>
References: <20210822192205.43210-1-arielmarcovitch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As opposed to the --diff option, --commit can get ref names instead of
commit hashes.

When using the --commit option, the script resets the working directory
to the commit before the given ref, by adding '~' to the end of the ref.

However, the 'HEAD' ref is relative, and so when the working directory
is reset to 'HEAD~', 'HEAD' points to what was 'HEAD~'. Then when the
script resets to 'HEAD' it actually stays in the same commit. In this
case, the script won't report any cases because there is no diff between
the cases of the two refs.

Prevent the user from using HEAD refs.

A better solution might be to resolve the refs before doing the
reset, but for now just disallow such refs.

Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
---
 scripts/checkkconfigsymbols.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 875e9a2c14b2..6259698e662d 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -103,6 +103,9 @@ def parse_options():
                      "continue.")
 
     if args.commit:
+        if args.commit.startswith('HEAD'):
+            sys.exit("The --commit option can't get use the HEAD ref")
+
         args.find = False
 
     if args.ignore:
-- 
2.25.1

