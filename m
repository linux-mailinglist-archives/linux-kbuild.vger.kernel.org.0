Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59ED9155D5D
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2020 19:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgBGSIE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Feb 2020 13:08:04 -0500
Received: from mail-wm1-f74.google.com ([209.85.128.74]:57088 "EHLO
        mail-wm1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgBGSIE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 13:08:04 -0500
Received: by mail-wm1-f74.google.com with SMTP id g26so1058466wmk.6
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Feb 2020 10:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Iq1xJJ5JyP7yGNZmWBQagYtjdyevY3BNthLqd4tXyyc=;
        b=ljx8rr+zrjNgFsvfk9NSWMaxlIxVoEXA76nyx2+oCJR5Vr8GBpYQqspJmdouPydQOp
         UJonWLOS/LIx+rdeSQ6iZ1SkyUIfN0olInHFb3hcFVTh7dB0+K9qQzgHKGjiQsKeIn/b
         caPczZzzYT8BZ9AyX0fOfLSjZu2nZktValQb6Dts16MxUCh7y1+XIbeClgYJ/DYClooN
         Ljk/NjtvQqFBmyc+9Heh4l6mr6jt2QJYHXhPh5Y+PjmxzLcTIgqaqdLEq8Ex8dWUy5HB
         L+GUzgJvgx2cfCI2saXmh08LYgbZ7bNc+B3wGynYqEkQzKPTpL8jy6fLw7EJzpsnXC7q
         0sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Iq1xJJ5JyP7yGNZmWBQagYtjdyevY3BNthLqd4tXyyc=;
        b=ke1geGdCVt+Obuf3mE85BXldEso2lNWls+TpLeLjwcmcXc/g8xcDEVvJI87V65Q8Ti
         Ii5HjCg3A/+HNgHKbyDfiKHlG86IxSH0WWZRF1kqDse3FnZ2HUFiemDr8ocNDPm4iurd
         0C5eHEAlAR61r0/J9bXp9OOSqnShmXMdDzJ3iPyaGPm7OdjGAxWjCkSKqGDoBP7GtcG5
         jvR2RaJ+5qEorqBbnmlSRITyEOlFqJeEBOHm4wR6VzEVNdSGtjOwh7rq0F/ZirAJXSeu
         fj2Y3hdYqyn3mxWawWgEaCzsbjBTji0i1bhFg0ddmSjoxUcDuQUUdcgrUEKzdK3+FoNi
         A23w==
X-Gm-Message-State: APjAAAWnx/vh0b9HxX39/Bwh66lcVRtdknZo3XgtXlnDHNh8sCLdwEDh
        qWh3erN6P0vIBaRh57ms0sB1nn+A+R58
X-Google-Smtp-Source: APXvYqw/kZJejB6vF6hRKl475S20U+sHNxKVFmaDf6Q//AAt1pEqKPWmoEfB3DvKwawXggNEAQ4RgTyAXd0C
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr211395wru.99.1581098881312;
 Fri, 07 Feb 2020 10:08:01 -0800 (PST)
Date:   Fri,  7 Feb 2020 18:07:53 +0000
In-Reply-To: <20200207180755.100561-1-qperret@google.com>
Message-Id: <20200207180755.100561-2-qperret@google.com>
Mime-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v3 1/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
From:   Quentin Perret <qperret@google.com>
To:     masahiroy@kernel.org, nico@fluxnic.net
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com, jeyu@kernel.org,
        hch@infradead.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
from ksymtab. This works really well when using in-tree drivers, but
cannot be used in its current form if some of them are out-of-tree.

Indeed, even if the list of symbols required by out-of-tree drivers is
known at compile time, the only solution today to guarantee these don't
get trimmed is to set CONFIG_TRIM_UNUSED_KSYMS=n. This not only wastes
space, but also makes it difficult to control the ABI usable by vendor
modules in distribution kernels such as Android. Being able to control
the kernel ABI surface is particularly useful to ship a unique Generic
Kernel Image (GKI) for all vendors, which is a first step in the
direction of getting all vendors to contribute their code upstream.

As such, attempt to improve the situation by enabling users to specify a
symbol 'whitelist' at compile time. Any symbol specified in this
whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
even if it has no in-tree user. The whitelist is defined as a simple
text file, listing symbols, one per line.

Acked-by: Jessica Yu <jeyu@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
@Nicolas: I left your Reviewed-by behind as the code has changed a bit
but let me know what you think
---
 init/Kconfig                | 13 +++++++++++++
 scripts/adjust_autoksyms.sh |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index a34064a031a5..79fd976ce031 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2180,6 +2180,19 @@ config TRIM_UNUSED_KSYMS
 
 	  If unsure, or if you need to build out-of-tree modules, say N.
 
+config UNUSED_KSYMS_WHITELIST
+	string "Whitelist of symbols to keep in ksymtab"
+	depends on TRIM_UNUSED_KSYMS
+	help
+	  By default, all unused exported symbols will be un-exported from the
+	  build when TRIM_UNUSED_KSYMS is selected.
+
+	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
+	  exported at all times, even in absence of in-tree users. The value to
+	  set here is the path to a text file containing the list of symbols,
+	  one per line. The path can be absolute, or relative to the kernel
+	  source tree.
+
 endif # MODULES
 
 config MODULES_TREE_LOOKUP
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index a904bf1f5e67..58335eee4b38 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -38,6 +38,10 @@ esac
 # We need access to CONFIG_ symbols
 . include/config/auto.conf
 
+# The symbol whitelist, relative to the source tree
+eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
+[[ "$ksym_wl" =~ ^/ ]] || ksym_wl="$abs_srctree/$ksym_wl"
+
 # Generate a new ksym list file with symbols needed by the current
 # set of modules.
 cat > "$new_ksyms_file" << EOT
@@ -48,6 +52,7 @@ cat > "$new_ksyms_file" << EOT
 EOT
 sed 's/ko$/mod/' modules.order |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
+cat - "$ksym_wl" |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
 
-- 
2.25.0.341.g760bfbb309-goog

