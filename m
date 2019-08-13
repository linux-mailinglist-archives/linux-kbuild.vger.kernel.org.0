Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 929868B84E
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 14:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbfHMMT2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 08:19:28 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:49203 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbfHMMT1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 08:19:27 -0400
Received: by mail-vs1-f74.google.com with SMTP id b19so28941682vsq.16
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/YYc16S6TtlY6DmQcUE3cXRCrWAP97wDS23cXhgLsgk=;
        b=Q3EMNPwo+C4R+ukcqh1LicHQAX96raDaDhMY4MmdRFTDeLddmcv2m7zx9cRgxwJpcY
         hcXiJVz4HNIelbYnSqDQtyHzp8gE3M9f+/WFeGvz2HtHGV0I6XwxHjDecZqZZi5aHNOb
         o4ahubSIhi+PAmIkYn5qjtiPUvOSEeQrWN9SI2D5cZU20Mnzuy437BwMQMP/0Lr3tMz4
         szlCfUelpHls+azukK4dUBWr5uJyN8m3TU8PpEnX7GfBQf2dkGsTLCGlCJb8UtVHFlJc
         0CtHeWYn+fMlyVQLUqkHmM8Wsq96xJzEeZNuCAL6xho2UJ9TI6OieZiuLGJ613r8mHxp
         kFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/YYc16S6TtlY6DmQcUE3cXRCrWAP97wDS23cXhgLsgk=;
        b=osIBDUkbf9rbpW4lEeXK9iOMvCS2Uviqc25xcloTxavdONjTjscS7D9dVln2iwOhIH
         PQ4BQZK7cysOOe6Fssr/ZaLHoZf/9iOaiADcKFh7X3CJIrp7DjzCc19gAx5DNawDfW7C
         3RIfOO3QNG1vKoC0rcwfgA+mOsq/N52Vs6OZmb0v2NwkgiB7McjapVPuF2JWhb7KOu85
         62NQtgyeaovGa9W7AmTRmG5b4Sv/N52XPYwoKj2w+PrsOHyNRWkHvelH5rv7ISf4wElO
         wMjg4w9iCYvv4kpOu1DTAYJ8FspHO9HBCOPdCp1y1MHuY+5U0iN9lkXfnApXd0gCmuGG
         2J4A==
X-Gm-Message-State: APjAAAVe8T2lfosUwrixw8QF4RAJo4Fjs3+krKxYCAJ90jqOE5wwG2eh
        e7iiEcPlPPr0gonBtqhhGBp1ujGpzJ6icw==
X-Google-Smtp-Source: APXvYqzCEstrhDpIdy3FOZ032oFTXz+VRy3pbyV2rfawsANSQxszqGzHRG9SAAhjciIykc36W/gzeVtTieEkYA==
X-Received: by 2002:a1f:7c0e:: with SMTP id x14mr3691831vkc.0.1565698766083;
 Tue, 13 Aug 2019 05:19:26 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:17:02 +0100
In-Reply-To: <20190813121733.52480-1-maennich@google.com>
Message-Id: <20190813121733.52480-6-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190813121733.52480-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v2 05/10] module: add config option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org, maco@android.com
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        geert@linux-m68k.org, gregkh@linuxfoundation.org, hpa@zytor.com,
        jeyu@kernel.org, joel@joelfernandes.org,
        kstewart@linuxfoundation.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, lucas.de.marchi@gmail.com,
        maco@google.com, michal.lkml@markovi.net, mingo@redhat.com,
        oneukum@suse.com, pombredanne@nexb.com, sam@ravnborg.org,
        sboyd@codeaurora.org, sspatil@google.com,
        stern@rowland.harvard.edu, tglx@linutronix.de,
        usb-storage@lists.one-eyed-alien.net, x86@kernel.org,
        yamada.masahiro@socionext.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Adrian Reber <adrian@lisas.de>,
        Richard Guy Briggs <rgb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is enabled (default=n), the
requirement for modules to import all namespaces that are used by
the module is relaxed.

Enabling this option effectively allows (invalid) modules to be loaded
while only a warning is emitted.

Disabling this option keeps the enforcement at module loading time and
loading is denied if the module's imports are not satisfactory.

Reviewed-by: Martijn Coenen <maco@android.com>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 init/Kconfig    | 14 ++++++++++++++
 kernel/module.c | 11 +++++++++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index bd7d650d4a99..b3373334cdf1 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2119,6 +2119,20 @@ config MODULE_COMPRESS_XZ
 
 endchoice
 
+config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
+	bool "Allow loading of modules with missing namespace imports"
+	default n
+	help
+	  Symbols exported with EXPORT_SYMBOL_NS*() are considered exported in
+	  a namespace. A module that makes use of a symbol exported with such a
+	  namespace is required to import the namespace via MODULE_IMPORT_NS().
+	  This option relaxes this requirement when loading a module. While
+	  technically there is no reason to enforce correct namespace imports,
+	  it creates consistency between symbols defining namespaces and users
+	  importing namespaces they make use of.
+
+	  If unsure, say N.
+
 config TRIM_UNUSED_KSYMS
 	bool "Trim unused exported kernel symbols"
 	depends on MODULES && !UNUSED_SYMBOLS
diff --git a/kernel/module.c b/kernel/module.c
index 57e8253f2251..7c934aaae2d3 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -1408,9 +1408,16 @@ static int verify_namespace_is_imported(const struct load_info *info,
 			imported_namespace = get_next_modinfo(
 				info, "import_ns", imported_namespace);
 		}
-		pr_err("%s: module uses symbol (%s) from namespace %s, but does not import it.\n",
-		       mod->name, kernel_symbol_name(sym), namespace);
+#ifdef CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
+		pr_warn(
+#else
+		pr_err(
+#endif
+			"%s: module uses symbol (%s) from namespace %s, but does not import it.\n",
+			mod->name, kernel_symbol_name(sym), namespace);
+#ifndef CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
 		return -EINVAL;
+#endif
 	}
 	return 0;
 }
-- 
2.23.0.rc1.153.gdeed80330f-goog

