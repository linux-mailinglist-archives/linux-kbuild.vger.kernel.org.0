Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36E62479E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 00:06:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgHQWE4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 18:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729277AbgHQWCY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:24 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5233EC061342
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:24 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id x6so15139677ybp.10
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 15:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=UpYGtC8VuPYbMUYzVChohylhl5f+DwA/jtv3WLbpTdU=;
        b=LiE9k63vyCkhMTzCYeoaOM75uDKE+XeLSj2h/3vVFNBtsbG28nLNlqtKpTLxlj5faJ
         AAYS7sxuGNAA16qzVg1TR2Xrv4mJvPmQInmvyq957XguEVvW2RlgPL24OfTHYZyM7jTd
         aYh3VfLRRQofH8X4nGmNCAahxvnwi+L5GwOV6amHL6jODkxTtu+gCzfcVlnUcpjEhjLv
         i4zVI2Y07P0ZX3H26HpgtYeiV+DfeXO+PoBd/WycXbEG4u3e1rv9smrAfL1pQ1kMTEaR
         eD9vQkiLdGUIg/t0Cz5lu6Ku1Wop0JRuKdYyFaNxzSm3dlF/+n1KvP2pYqjs2LUfecLh
         dzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=UpYGtC8VuPYbMUYzVChohylhl5f+DwA/jtv3WLbpTdU=;
        b=sNKuQ8n5gRPDaesJalXxDoqd1ACGRB3djTafARNjrRgqoQ5uWByghdNqh4XIq5f0vE
         eSe/nkhAspPmQfK9fX0Y/TV9A7fHL9eu/9nAg9CcYKs0j4q8ZB7PQVL6OyhgKTqh3byl
         jQYpZxRSidwZF58sgqYPHEZPitcleFPXkTLwwgvDVXcDzQ1JeSdvrekqyJp3MoUZzz3b
         n3MociYQTDfmAA/85ajgqB7ywBmUWUb57uLmyFcrB2VPSPGTfEUcEfDZpcjktsx6kOSN
         NH26nWqRQv53qqyilUVW55kBSGoiW1iA7aVjNOZKIvSqEjfWhpdW+KWn+cuxUUkZ+TIt
         PkTA==
X-Gm-Message-State: AOAM533HU5bPMN1OLU+po4KJM+pppFIfT/XdQD30m7xRejiJ+Kjw5mkH
        RztuXsOkW5m5PRrwCDq8CQERFywI2chJPaf37EM=
X-Google-Smtp-Source: ABdhPJxizyp67lNME36xRZPdIHp+ZAc9h1Guk5DKKetBtfDNGZaI3fQVyPo4QkcGpgpnPDnBe+lR31JKDOpF3hrgtgc=
X-Received: by 2002:a25:4252:: with SMTP id p79mr24577079yba.229.1597701743469;
 Mon, 17 Aug 2020 15:02:23 -0700 (PDT)
Date:   Mon, 17 Aug 2020 15:02:09 -0700
In-Reply-To: <20200817220212.338670-1-ndesaulniers@google.com>
Message-Id: <20200817220212.338670-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH 1/4] Makefile: add -fno-builtin-stpcpy
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "=?UTF-8?q?D=C3=A1vid=20Bolvansk=C3=BD?=" <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        stable@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LLVM implemented a recent "libcall optimization" that lowers calls to
`sprintf(dest, "%s", str)` where the return value is used to
`stpcpy(dest, str) - dest`. This generally avoids the machinery involved
in parsing format strings. This optimization was introduced into
clang-12. Because the kernel does not provide an implementation of
stpcpy, we observe linkage failures for almost all targets when building
with ToT clang.

The interface is unsafe as it does not perform any bounds checking.
Disable this "libcall optimization" via `-fno-builtin-stpcpy`.

Unlike
commit 5f074f3e192f ("lib/string.c: implement a basic bcmp")
which cited failures with `-fno-builtin-*` flags being retained in LLVM
LTO, that bug seems to have been fixed by
https://reviews.llvm.org/D71193, so the above sha can now be reverted in
favor of `-fno-builtin-bcmp`.

Cc: stable@vger.kernel.org # 4.4
Link: https://bugs.llvm.org/show_bug.cgi?id=3D47162
Link: https://github.com/ClangBuiltLinux/linux/issues/1126
Link: https://reviews.llvm.org/D85963
Reported-by: Sami Tolvanen <samitolvanen@google.com>
Suggested-by: D=C3=A1vid Bolvansk=C3=BD <david.bolvansky@gmail.com>
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 9cac6fde3479..211a1b6f6478 100644
--- a/Makefile
+++ b/Makefile
@@ -959,6 +959,12 @@ ifdef CONFIG_RETPOLINE
 KBUILD_CFLAGS +=3D $(call cc-option,-fcf-protection=3Dnone)
 endif
=20
+# The compiler may "libcall optimize" certain function calls into the belo=
w
+# functions, for architectures that don't use -ffreestanding. If we don't =
plan
+# to provide implementations of these routines, then prevent the compiler =
from
+# emitting calls to what will be undefined symbols.
+KBUILD_CFLAGS	+=3D -fno-builtin-stpcpy
+
 # include additional Makefiles when needed
 include-y			:=3D scripts/Makefile.extrawarn
 include-$(CONFIG_KASAN)		+=3D scripts/Makefile.kasan
--=20
2.28.0.220.ged08abb693-goog

