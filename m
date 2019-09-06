Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB6EAB5FB
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2019 12:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393034AbfIFKc6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Sep 2019 06:32:58 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:56809 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393031AbfIFKc5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 06:32:57 -0400
Received: by mail-vk1-f201.google.com with SMTP id d10so2208147vkl.23
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2019 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=e5Xa0/L265hDWGkY0PbNgVQnJTuuZu+3daZLqyOdxeE=;
        b=eumQm+2ShmE6TgmjDoQd70bGY+oEgSHXOgSVuudFicpxW/RDxNJk8L5C5n0pLoBTqq
         MOS+b7mgoDg81jVC8kPWJcSj7KDWoHO87q7brpNe2y6jxBcsqAygJRs2JrZEBlGYkxcw
         Sqczlgln5v+sMvmW/nVr88B9Ugj3AVRwHWTbxesfVsjCi7V1hszeX5Pqhp7gJc0P6Krh
         Alz4XhaTVA4pnQN4RSap6Pd6zRAxGXB+C3aieLKS/o7NzbI/7stKMaAsSA68LqS6Zl21
         SQPjciuVuvZ/LEU75ueCN+tVExCC83LrHw4Fn4ttV+QRm0gZ2GtMGNmjMIGX4f3ruzQH
         SX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=e5Xa0/L265hDWGkY0PbNgVQnJTuuZu+3daZLqyOdxeE=;
        b=owAIPzsRN3YOFxz6rDDAvbzMqLr5mMDJse/t5yu7Hn5uoVa4zD5hN1t77r0X7k0LIS
         HOCRgLdiRfDBlEVqdTP8/m3QKl/PJxoZXATgHTs8lV230rMX7xaoFs7t7kInJFVpDPbf
         M2PcaqBqlB7ch4LFRC6Vv8vNemirhwQv3mE8F2EzfkV6wxSb/YzxvoXKxFM3zpISQwid
         FVlLBv8kNtyTgdmJcZqUtbJAaET5ZESIZWS5AyPP7rkx2C5iljaMYli7G70l/fE0Qm6d
         yhqzuBp6H12fhjRJ+I7hvBIPBUrCuymhaWMUMJKVn6QlP/s9XibY0KSk3u5DN/gpF1s3
         Qi+A==
X-Gm-Message-State: APjAAAWXUTrSqdl6FY6VD8iDrRClk94FYSdHZXGBr7h7BRqkU3jFoTpp
        mQCKul8Nlsub+pSKYxdwI5XdsZfMAr+j/w==
X-Google-Smtp-Source: APXvYqxjXsNlXF+L5ZbGi+Wu1IG6HFQZJoO2Y3m1xP1bdEMBnoX14uYKZBkKRRUjoh0pfSfp4RUChRg6DxlP9w==
X-Received: by 2002:ab0:a83:: with SMTP id d3mr3929083uak.7.1567765976576;
 Fri, 06 Sep 2019 03:32:56 -0700 (PDT)
Date:   Fri,  6 Sep 2019 11:32:29 +0100
In-Reply-To: <20190906103235.197072-1-maennich@google.com>
Message-Id: <20190906103235.197072-6-maennich@google.com>
Mime-Version: 1.0
References: <20180716122125.175792-1-maco@android.com> <20190906103235.197072-1-maennich@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v5 05/11] module: add config option MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
From:   Matthias Maennich <maennich@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel-team@android.com, maennich@google.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, jeyu@kernel.org,
        joel@joelfernandes.org, lucas.de.marchi@gmail.com,
        maco@android.com, sspatil@google.com, will@kernel.org,
        yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
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
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Matthias Maennich <maennich@google.com>
---
 init/Kconfig    | 13 +++++++++++++
 kernel/module.c | 11 +++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index bd7d650d4a99..cc28561288a7 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2119,6 +2119,19 @@ config MODULE_COMPRESS_XZ
 
 endchoice
 
+config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
+	bool "Allow loading of modules with missing namespace imports"
+	help
+	  Symbols exported with EXPORT_SYMBOL_NS*() are considered exported in
+	  a namespace. A module that makes use of a symbol exported with such a
+	  namespace is required to import the namespace via MODULE_IMPORT_NS().
+	  There is no technical reason to enforce correct namespace imports,
+	  but it creates consistency between symbols defining namespaces and
+	  users importing namespaces they make use of. This option relaxes this
+	  requirement and lifts the enforcement when loading a module.
+
+	  If unsure, say N.
+
 config TRIM_UNUSED_KSYMS
 	bool "Trim unused exported kernel symbols"
 	depends on MODULES && !UNUSED_SYMBOLS
diff --git a/kernel/module.c b/kernel/module.c
index 6bb9b938f9c7..f76efcf2043e 100644
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
2.23.0.187.g17f5b7556c-goog

