Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB91614CCF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2020 16:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgA2PGS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jan 2020 10:06:18 -0500
Received: from mail-wm1-f73.google.com ([209.85.128.73]:56115 "EHLO
        mail-wm1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgA2PGR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jan 2020 10:06:17 -0500
Received: by mail-wm1-f73.google.com with SMTP id p26so2794081wmg.5
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Jan 2020 07:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=uCpdzEHc8A3bUPd0dC/9LcWhiifeT6vJeqIWIxSo4hE=;
        b=d9whXo4z/rPrHEhtFwgiufARTCatr3EbDq+0gz1Ge/+H8QTU5ZhQqkQlbbE4eE4iOh
         gAa8I0vaY7KwadF8OajtS5tM0vxSiIRsIHI5HE8OT5xYAoUgAG6UKoalS4ihglgTd3d8
         ssDJRIgGNv1SwUNDQP2bp7/I6pFiskWBFz46b+Qs0Jrf5CsHvca/sejydLpPuRG54+SP
         0ZV3+t8b0kGPYyxoPMOuJVI77sR4jRpPITke75Mo4SHZkY272PgFmLc+B2vMpEdAcuI7
         yvbOJMlBXeR9S8KnzV4pejs88wByZHJOKyWThFFWjphyIyJwlR4+R5/Yagpa30/TWC9L
         oXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=uCpdzEHc8A3bUPd0dC/9LcWhiifeT6vJeqIWIxSo4hE=;
        b=nJz7fodHP7JmSbGIC76/d13yupeo9Oxf0pw9LR6xidGCvsKN0e4kHe74Bc0YC1tlt0
         iETgF5/WKeaDYp0MQJ0LNyv13JMfXWMV4+WKkNBrur63j8KPG16yRjlv8d8T/8dO1D1y
         x7igY2yz1haAFKA8+Ja31Hog/QOVl2za2093kVwKhubmTg1vzaqX4OumnO8QqXw7e94A
         UNvBZMg3LFFhT5RVPwRYIKLdBtzauKvAxr65B0mrkIT2TVXbffd6R3teL4JAzZ/Q4mrl
         IEWTJ+nhjVAJex4UIYfHJ78DCEsRqo95Avb9HSIPDHj61oqk/5q2E7VAUUFG0cXZVNhg
         IR5w==
X-Gm-Message-State: APjAAAWFDI8WZ12AvISE+k6dhXsRlIoT/TDjCmhrgROm6m84H1p8ulj2
        GvUz1ru9XkJkkFjoYDBYMsz4R+7rh975
X-Google-Smtp-Source: APXvYqzyXoInm3l0njOq44y5o7xliwDXBgC2/8u5zICqd2UgK2H9m/XHByx5BI0zHDixEzjUd+eJOBcmEMXF
X-Received: by 2002:adf:ce87:: with SMTP id r7mr35598404wrn.245.1580310375660;
 Wed, 29 Jan 2020 07:06:15 -0800 (PST)
Date:   Wed, 29 Jan 2020 15:06:12 +0000
Message-Id: <20200129150612.19200-1-qperret@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
From:   Quentin Perret <qperret@google.com>
To:     masahiroy@kernel.org, nico@fluxnic.net
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com, qperret@google.com
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
Kernel Image (GKI) for all vendors.

As such, attempt to improve the situation by enabling users to specify a
symbol 'whitelist' at compile time. Any symbol specified in this
whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
even if it has no in-tree user. The whitelist is defined as a simple
text file, listing symbols, one per line.

Signed-off-by: Quentin Perret <qperret@google.com>

---

Not sure if this was relevant for the commit message so I'll put it
here: more context about the GKI effort in Android can found in these
talk at LPC2018 [1] and LPC2019 [2].

[1] https://linuxplumbersconf.org/event/2/contributions/61/
[2] https://linuxplumbersconf.org/event/4/contributions/401/
---
 init/Kconfig                | 12 ++++++++++++
 scripts/adjust_autoksyms.sh |  1 +
 2 files changed, 13 insertions(+)

diff --git a/init/Kconfig b/init/Kconfig
index a34064a031a5..d9c977ef7de5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2180,6 +2180,18 @@ config TRIM_UNUSED_KSYMS
 
 	  If unsure, or if you need to build out-of-tree modules, say N.
 
+config UNUSED_KSYMS_WHITELIST
+	string "Whitelist of symbols to keep in ksymtab"
+	depends on TRIM_UNUSED_KSYMS
+	help
+	  By default, all unused exported symbols will be trimmed from the
+	  build when TRIM_UNUSED_KSYMS is selected.
+
+	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
+	  exported at all times, even in absence of in-tree users. The value to
+	  set here is the path to a text file containing the list of symbols,
+	  one per line.
+
 endif # MODULES
 
 config MODULES_TREE_LOOKUP
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index a904bf1f5e67..1a6f7f377230 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
 EOT
 sed 's/ko$/mod/' modules.order |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
+cat - $CONFIG_UNUSED_KSYMS_WHITELIST |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
 
-- 
2.25.0.341.g760bfbb309-goog

