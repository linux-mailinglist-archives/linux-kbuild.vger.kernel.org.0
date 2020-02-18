Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1040A162399
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 10:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgBRJlr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 04:41:47 -0500
Received: from mail-wr1-f73.google.com ([209.85.221.73]:54857 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgBRJlr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 04:41:47 -0500
Received: by mail-wr1-f73.google.com with SMTP id s13so10510077wrb.21
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 01:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qS76XFbie+ijPEnE/4mOZAJ6e7AxYJOMIkUkTjFByi8=;
        b=BbL6LKcr4n6d+ArwhgJ08Ogfe+RDRwdBgcnB5HpzIgUkBOFHfSgQeeUR+pdOtERihP
         bbo7SDetBFjp61Ktgp0mskt+xcRwjyeKx8O3uj5nVJILFapUd8xrH+qJPLxEKUbg6o07
         BBbejg57DDrQI+LmnInT7FXUH9heZqG6oLIki3Vr8FCDzHaYCxoXVaVQ3hGjp5zf8l02
         1iB2wd79kUCUv+yHI8C565GRCTBbNYHMa+yydpkfc5nSmAycE+v/OlrTAA8SHTGTieSn
         Z2TIyLEWeg0cHCGKjQyrCthwp7CJYK4k0jGFZ11g0JFKklnFXP+jyqEyvytbKcsNmYxY
         9o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qS76XFbie+ijPEnE/4mOZAJ6e7AxYJOMIkUkTjFByi8=;
        b=oyEfqVfRD1XL7d/UJChRNmLvTztyHRjB9Pr/VWX+9197pNr+ES4t2xWMcS9rpUNIMb
         D6eOvMZ/tyvg3I1tlb3mB/h3gdyeuunREFaMRyn8NRR5qlVJlcmSw0uqi7hmU6L04HjE
         6jffVktYQ0azEBjmqtRtdfB5oIYpev76iain5Hj2r8gGiuebgKg11TV62oGniL0iLMi7
         2mHrOSzMaA6uxR9zDkX+TD6/e2UkNG0dzG81cbAjCfx903Bvpns9gT+O5mkJGyMshPPB
         2hzN/Usgd2fu5ECr/fdbQ2H1DM5qD7PmRjvyf+Wm0KgdkzDnhvObI6sRD65pRTwT06Wt
         mTOg==
X-Gm-Message-State: APjAAAWgAzndkagPGusz2ydUGsb08SsXvjRS5iiuXiyiGnA1Y41z4Pna
        AJuojjZ6t50A3OLvfpv+Crj473poCAUJ
X-Google-Smtp-Source: APXvYqzs0+ZgiVOp10BQd9rhcVA5oaVS2Y492qfKZ0GIDPzm+d80akNrtM4xJb7Q/TEuZkUcfiXZ91rSVtm1
X-Received: by 2002:a5d:4dc5:: with SMTP id f5mr28628764wru.114.1582018905039;
 Tue, 18 Feb 2020 01:41:45 -0800 (PST)
Date:   Tue, 18 Feb 2020 09:41:37 +0000
In-Reply-To: <20200218094139.78835-1-qperret@google.com>
Message-Id: <20200218094139.78835-2-qperret@google.com>
Mime-Version: 1.0
References: <20200218094139.78835-1-qperret@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v5 1/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
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
Acked-by: Nicolas Pitre <nico@fluxnic.net>
Tested-by: Matthias Maennich <maennich@google.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 init/Kconfig                | 13 +++++++++++++
 scripts/adjust_autoksyms.sh | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index cfee56c151f1..58b672afceb2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2210,6 +2210,19 @@ config TRIM_UNUSED_KSYMS
 
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
index a904bf1f5e67..ff46996525d3 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -38,6 +38,17 @@ esac
 # We need access to CONFIG_ symbols
 . include/config/auto.conf
 
+ksym_wl=/dev/null
+if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
+	# Use 'eval' to expand the whitelist path and check if it is relative
+	eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
+	[ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
+	if [ ! -f "$ksym_wl" ]; then
+		echo "ERROR: '$ksym_wl' whitelist file not found" >&2
+		exit 1
+	fi
+fi
+
 # Generate a new ksym list file with symbols needed by the current
 # set of modules.
 cat > "$new_ksyms_file" << EOT
@@ -48,6 +59,7 @@ cat > "$new_ksyms_file" << EOT
 EOT
 sed 's/ko$/mod/' modules.order |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
+cat - "$ksym_wl" |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
 
-- 
2.25.0.265.gbab2e86ba0-goog

