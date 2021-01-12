Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E51B2F3951
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 20:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391742AbhALTAw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 14:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732573AbhALTAw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 14:00:52 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CD3C061794
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 11:00:12 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id y187so2237418qke.20
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 11:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=du3R7iRmdec/w5kxDbSTvmDNCkwRqHc5juEchBaOuOU=;
        b=ZblB180mccBYrovpgd1D6ISjiyDBNyLP/3g8tETtMbLsQymkjUa3uM8nsPM1MJvO7M
         pn6Pz26vNA5jNgBeHUyQ0I1pydprO/tC2T1qki4sxIEqHTbYgU4SJZ6MKbIJL6IkepTm
         J+zJcZkj5P00fl/q4GzjLQ9mn1iOey423gnXVn79nT+CU5qMlbhnyh6unND7mTBxCEaS
         xqk/4bCQPziV76nVclQ8LPiGgQE+LcXw+qvY1rKGtZ3JdxrZRDylYUjwDrqbz696KvVU
         zMmCwNMIKZlabY852y6pt2vCALPcJXt/d/wIQvcvh/y2NMEHxpTiZpmAnIADOaF1/VmH
         9Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=du3R7iRmdec/w5kxDbSTvmDNCkwRqHc5juEchBaOuOU=;
        b=DCzY5u2bld8W/6qhmKWID7DG6bZIMKGPoM0PpqS/jPwL3gMCQh3kt0sLhHSSmlyt/t
         XfKbE568I17B1qU5LJtY2JnEzpFfo1B4Bn6j7gh0kVDpO2HtBk0L7E9doH6/nhv+AC6f
         vQSMbGgCZpxHn+AEd9+QRHYecsIpLCxLIE0jvKrVDeQgbHhuvLjmwmGb1lRcGw8L8cQN
         QP17HQ34V7BG4PoQ3P4w2OghL5xiOSF88cthfZ/4bDVFvaOUGrT4DoSzeiyI5x96Z1ar
         EWZIzOIJAM08QAwCVfzEYFEjxdTDgLOPWJMu+Jgp4BhW8psj18PsuHNHF64buNl1ZSZj
         838Q==
X-Gm-Message-State: AOAM530P1dPWMaYtsGT3tCXB8/5GDkAaQ1RDn7GotV5GZD1jEnZH/EbB
        GfI/VAYonTeIEbOYPn+3N3UQ7QSLnHk=
X-Google-Smtp-Source: ABdhPJwS4w63VpDxU48YOxssc/xJ2vCdPiDNIAbr8leFpk4ztLs039S22IaT7VTNYAd6o0qwzEOBgD3+SqE=
Sender: "adelva via sendgmr" <adelva@uslicht.c.googlers.com>
X-Received: from uslicht.c.googlers.com ([fda3:e722:ac3:10:2b:ff92:c0a8:24])
 (user=adelva job=sendgmr) by 2002:a0c:fb0d:: with SMTP id c13mr531526qvp.1.1610478011340;
 Tue, 12 Jan 2021 11:00:11 -0800 (PST)
Date:   Tue, 12 Jan 2021 19:00:10 +0000
Message-Id: <20210112190010.1582888-1-adelva@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH] kbuild: improve libelf detection
From:   Alistair Delva <adelva@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Rolf Eike Beer <eb@emlix.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When `pkg-config --libs' wasn't used or didn't return anything useful,
the test for libelf would fail even if the headers and libraries were
available to kbuild via KBUILD_HOSTCFLAGS and KBUILD_HOSTLDFLAGS.

This makes the check in the core Makefile match the check that is done
in tools/objtool/Makefile. Specifically, the C compiler is passed the
full KBUILD_HOSTCFLAGS and KBUILD_HOSTLDFLAGS, which may have set up
additional sysroot/include/library search paths to find libelf.

Cc: kernel-team@android.com
Cc: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Rolf Eike Beer <eb@emlix.com>
Signed-off-by: Alistair Delva <adelva@google.com>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9e73f82e0d86..3269e155fbe4 100644
--- a/Makefile
+++ b/Makefile
@@ -1074,8 +1074,9 @@ export mod_sign_cmd
 
 HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
 
-has_libelf = $(call try-run,\
-               echo "int main() {}" | $(HOSTCC) -xc -o /dev/null $(HOST_LIBELF_LIBS) -,1,0)
+has_libelf := $(call try-run,\
+                echo "int main() {}" | \
+                $(HOSTCC) $(KBUILD_HOSTCFLAGS) -xc -o /dev/null $(KBUILD_HOSTLDFLAGS) $(HOST_LIBELF_LIBS) -,1,0)
 
 ifdef CONFIG_STACK_VALIDATION
   ifeq ($(has_libelf),1)
-- 
2.29.2

