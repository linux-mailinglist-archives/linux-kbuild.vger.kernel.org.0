Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F348814D032
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jan 2020 19:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbgA2SPp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jan 2020 13:15:45 -0500
Received: from mail-qk1-f201.google.com ([209.85.222.201]:45718 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbgA2SPp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jan 2020 13:15:45 -0500
Received: by mail-qk1-f201.google.com with SMTP id 143so218043qkg.12
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Jan 2020 10:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=8OmDOl+HzY7kcK871zVejMIspdUpfLqTD5KCeutuWtI=;
        b=b89C2vjAvi8rn6ke4cMrbzWhPNxthh3YpogsX2uEkpXypteStYFa0eHE/vbKpyKJ7c
         kWBwggD5XvuNwYUWI3HuS2xE8BtlawGJaAre2+1dfgETw9jFkKK6veUMfpnsJgwGEvS2
         ewiUCzMI+c7/iBJZ8k++QCDfVxrlW41Rxy71EifgoDosJUOQnNzS2Qu5dfJHfZYldD3U
         kqYxC9hGbFd+k+7wkbuxYBxMxuFdnt0siR959H1OQ2ZgvBwY85FaMSAPHb0mkKviUm+V
         jooaRPM1l29+Kfwou3Aigf5v39axWr8UVxi1lWm5JGeUFN4uv0P8fFv+4VJOQHiVLxhF
         xZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=8OmDOl+HzY7kcK871zVejMIspdUpfLqTD5KCeutuWtI=;
        b=Mk5D7FsW0N3m38QEXMMy3B38PJmrtcK41OvmOkdw0bytJmNZX3lNzM/4MTzazb4PyV
         I1kTAfV+3c/7r3i9cidYdkAcxM662Miu1ytWBMaQxm+EMTTclTxG4ceYzOZ7rupFEl7o
         CKx3JqLZ8UVm1/ij2aTINJ2GG9e0gqMDzlM1Unqx8VLlkXi52HWVaB6O+KAai2/54Q0F
         p0xeE/PLXychixweZSYNKJfuTUUv4fvf/OiDx0ULvSp8XmUObPUFOGa/hNLvxM5XXhTc
         MVhdb2r+rLboGQn2ZEK9YiYgEnAigqgP4JG9kPrCoeREUwkkMi+iZBYvI1SgePI+s/uT
         6AmQ==
X-Gm-Message-State: APjAAAUXplh8mBCOoqRD86nkmxYO40maObvau+Q8tcJYJIpigOm8hvTk
        l8X+ISDGWAkA3ln3ienUfiPSTDfPukvv
X-Google-Smtp-Source: APXvYqwN3ACQ2noJKaiSC9xLyVQkZaRwlbZlPfvTuolBVWN/pWc4or7pdoyNb13qvrWpG7kKbhq6JsmksPdy
X-Received: by 2002:ac8:1385:: with SMTP id h5mr461391qtj.59.1580321744050;
 Wed, 29 Jan 2020 10:15:44 -0800 (PST)
Date:   Wed, 29 Jan 2020 18:15:41 +0000
Message-Id: <20200129181541.105335-1-qperret@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
From:   Quentin Perret <qperret@google.com>
To:     masahiroy@kernel.org, nico@fluxnic.net
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com, qperret@google.com,
        jeyu@kernel.org
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
v2: make sure to quote the whitelist path properly (Nicolas)
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
index a904bf1f5e67..8e1b7f70e800 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
 EOT
 sed 's/ko$/mod/' modules.order |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
+cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
 
-- 
2.25.0.341.g760bfbb309-goog

