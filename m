Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D824A6C41
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2019 17:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729722AbfICPHb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 11:07:31 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:42355 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729661AbfICPHa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 11:07:30 -0400
Received: by mail-vk1-f201.google.com with SMTP id t205so7922990vke.9
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Sep 2019 08:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WpyyM8zjm4wtK5J690VZrM2s4HSiRGUxtkfpxo7zqKI=;
        b=BfHZbHR97xdAxRIdMmVlOwnyxzrq6JmTVQXv4Fg5l+zyV5iGtr+ffZtaPXCj9UClr2
         HBUSLv4AD6uEOTct4s9MJL4qHRMnroaVu+TZIx303DWUAe4bpNCNRpUHhZ9N4Tsfw/Y/
         Z6Vl7K0uLitFGrCDhFrtgVbzEuLb86F4SbiR/ZyZL1VWiGNb2INzfCvhjRkamz5g8g9V
         ZxSOL4PIYiq9rEmw7LakJ4nI5VTYE9x0PyJ1U1mF3bZvU06pcbLkUqx4S7Ipp2030F5D
         fDto7fdbBtKazVvfo9UtqoXJuWsdHzGzIKJXbV3i6+U+1a/n53z3B7gUU4jhyJb8Msqc
         F3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WpyyM8zjm4wtK5J690VZrM2s4HSiRGUxtkfpxo7zqKI=;
        b=aMTcKJSaHfG6/XonztQ0BP20iqV01f/6CxGrpdDgQndeU+GhDa5XJJTKhDObU+vvTr
         nQQ/T10IcBE2Q8t1369nxj+SndSQlY0z3KlsY44zakJfUpzuo0wE4MHVnaVtDE5A5HCL
         wlrbxRvAEL7dRubOEviEJihE5ZjLHRHAFKfPRvo+XPq/K4Rb74gesiDVOQ3CjGsK2VUe
         899eADfdZuvF5nL5p7jqj0ybI55Ybu1xWV3cZ2Ew1eNcEuKK1W+eLiDzRmwH77gxCCyX
         TsXG3AzGclvu+3uTxfJxLg5QQH59PRorJ52M+DaBVlWgrrs59hNw/0J/CIpkB23fgYIQ
         aBpg==
X-Gm-Message-State: APjAAAWEg4pqHNmLqPSpw3s1UJsx8dMEyQHoAef+kJBh01g3CONLM2z6
        tsj/5ouCzg1KoFqO3eE1qUOxzgDQcovnVw==
X-Google-Smtp-Source: APXvYqyRkq3kWS+md+h91R4aNGpmWOv69BYMd6kwCtRNSe5sfbB/Zp3Ra0kJkrdzunasXK4SgK6CH0kEQqjxxg==
X-Received: by 2002:a1f:5c0d:: with SMTP id q13mr3631221vkb.38.1567523249382;
 Tue, 03 Sep 2019 08:07:29 -0700 (PDT)
Date:   Tue,  3 Sep 2019 16:06:28 +0100
In-Reply-To: <20190903150638.242049-1-maennich@google.com>
Message-Id: <20190903150638.242049-3-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190903150638.242049-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v4 02/12] export: explicitly align struct kernel_symbol
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This change allows growing struct kernel_symbol without wasting bytes to
alignment. It also concretized the alignment of ksymtab entries if
relative references are used for ksymtab entries.

struct kernel_symbol was already implicitly being aligned to the word
size, except on x86_64 and m68k, where it is aligned to 16 and 2 bytes,
respectively.

As far as I can tell there is no requirement for aligning struct
kernel_symbol to 16 bytes on x86_64, but gcc aligns structs to their
size, and the linker aligns the custom __ksymtab sections to the largest
data type contained within, so setting KSYM_ALIGN to 16 was necessary to
stay consistent with the code generated for non-ASM EXPORT_SYMBOL(). Now
that non-ASM EXPORT_SYMBOL() explicitly aligns to word size (8),
KSYM_ALIGN is no longer necessary.

In case of relative references, the alignment has been changed
accordingly to not waste space when adding new struct members.

As for m68k, struct kernel_symbol is aligned to 2 bytes even though the
structure itself is 8 bytes; using a 4-byte alignment shouldn't hurt.

I manually verified the output of the __ksymtab sections didn't change
on x86, x86_64, arm, arm64 and m68k. As expected, the section contents
didn't change, and the ELF section alignment only changed on x86_64 and
m68k. Feedback from other archs more than welcome.

Co-developed-by: Martijn Coenen <maco@android.com>
Signed-off-by: Martijn Coenen <maco@android.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 arch/m68k/include/asm/export.h | 1 -
 include/asm-generic/export.h   | 8 +++-----
 include/linux/export.h         | 3 ++-
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/include/asm/export.h b/arch/m68k/include/asm/export.h
index 0af20f48bd07..b53008b67ce1 100644
--- a/arch/m68k/include/asm/export.h
+++ b/arch/m68k/include/asm/export.h
@@ -1,3 +1,2 @@
-#define KSYM_ALIGN 2
 #define KCRC_ALIGN 2
 #include <asm-generic/export.h>
diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
index 294d6ae785d4..63f54907317b 100644
--- a/include/asm-generic/export.h
+++ b/include/asm-generic/export.h
@@ -4,15 +4,13 @@
 #ifndef KSYM_FUNC
 #define KSYM_FUNC(x) x
 #endif
-#ifdef CONFIG_64BIT
-#ifndef KSYM_ALIGN
+#ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
+#define KSYM_ALIGN 4
+#elif defined(CONFIG_64BIT)
 #define KSYM_ALIGN 8
-#endif
 #else
-#ifndef KSYM_ALIGN
 #define KSYM_ALIGN 4
 #endif
-#endif
 #ifndef KCRC_ALIGN
 #define KCRC_ALIGN 4
 #endif
diff --git a/include/linux/export.h b/include/linux/export.h
index fd8711ed9ac4..28a4d2150689 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -52,7 +52,7 @@ extern struct module __this_module;
 #define __KSYMTAB_ENTRY(sym, sec)					\
 	__ADDRESSABLE(sym)						\
 	asm("	.section \"___ksymtab" sec "+" #sym "\", \"a\"	\n"	\
-	    "	.balign	8					\n"	\
+	    "	.balign 4					\n"	\
 	    "__ksymtab_" #sym ":				\n"	\
 	    "	.long	" #sym "- .				\n"	\
 	    "	.long	__kstrtab_" #sym "- .			\n"	\
@@ -66,6 +66,7 @@ struct kernel_symbol {
 #define __KSYMTAB_ENTRY(sym, sec)					\
 	static const struct kernel_symbol __ksymtab_##sym		\
 	__attribute__((section("___ksymtab" sec "+" #sym), used))	\
+	__aligned(sizeof(void *))					\
 	= { (unsigned long)&sym, __kstrtab_##sym }
 
 struct kernel_symbol {
-- 
2.23.0.187.g17f5b7556c-goog

