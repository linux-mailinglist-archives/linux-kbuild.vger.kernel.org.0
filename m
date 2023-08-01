Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8C5476BBAC
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Aug 2023 19:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbjHARuk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Aug 2023 13:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbjHARuf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2023 13:50:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393ECE61
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Aug 2023 10:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690912183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c9F/mZ8r3UfV+OIZ7ILNLdJAv9iDV2O+GTrVi9NsxDI=;
        b=NmgGgBtTkEwQLV9xU/+IAs41LEO9M4WR70DHDbgyIjVKvaZWSSURYhuiLeNGPuMJrx8DNU
        qNcM5yC4sbeZSFCOzP4N5OhSL+QRlzuaJokm/lNENZDHxjY5h7GqaneyU1mIFWqIYil6VL
        V4aLyJMmsaKwVAi3yfGLfuyPrDo2n+U=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-lJ4QiS8gMKOBahLBywOQgw-1; Tue, 01 Aug 2023 13:49:39 -0400
X-MC-Unique: lJ4QiS8gMKOBahLBywOQgw-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-583a89cccf6so54274007b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Aug 2023 10:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690912179; x=1691516979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9F/mZ8r3UfV+OIZ7ILNLdJAv9iDV2O+GTrVi9NsxDI=;
        b=dSnL+Md2Wz+kYVcC1f3Rk3Ls0fROfsGGgbueFyi2IWmxGifDs2hZQo5az8sfX83V/c
         aKojanT0xHEYobpVlGVmqHWAm3eUzrKr03VIl7A4rGmZP58eWpMy/0ejj3Bo81LOHGSq
         UKlzA2WUJ5nO0q8JgMDs/q0WhHlWiRTDyYHH/4QA2r39eoibRzkgBdIsNjgAEXZWVl2R
         ZFNpaI+IwD4ZGIgpP6i7UTBZcvHl5AXLtpgPtjInpVfOazZNvs79qOKXnZsMabXfXGqv
         mrEqsYcNVk92BHRpzr6u1im0pkU++094SZSSPbMuSPPY/8754UZBU3OLyjFPnPQ0pOmR
         hcUw==
X-Gm-Message-State: ABy/qLbNSQUkAx2XD3H+Ud4PUm1uByqIZyml/KO/WcWerQPP5VBdqke9
        nqEVyZBQnJ7npOFpLSB2jm/fWw/haPoxsDDSic9DAAXSDHw9PExtsjvIJrbG10+vBa8SB4IDmMx
        RfLbCBpWqufxZMLXlboh+Iv5Y
X-Received: by 2002:a81:6c92:0:b0:583:d722:9ae9 with SMTP id h140-20020a816c92000000b00583d7229ae9mr11884617ywc.41.1690912179345;
        Tue, 01 Aug 2023 10:49:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGKuCd2ijiy8jn5tU9B4qxUFyex8KCYNiPvYKYYRM54/JwQpKLWyFpWCyqJn+yuNOiafcQkBw==
X-Received: by 2002:a81:6c92:0:b0:583:d722:9ae9 with SMTP id h140-20020a816c92000000b00583d7229ae9mr11884609ywc.41.1690912179086;
        Tue, 01 Aug 2023 10:49:39 -0700 (PDT)
Received: from brian-x1.. ([2600:381:222b:e67:295d:9324:c84:3382])
        by smtp.gmail.com with ESMTPSA id k187-20020a0dc8c4000000b005773afca47bsm3881728ywd.27.2023.08.01.10.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 10:49:38 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     masahiroy@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] scripts: add kconfig lookup script
Date:   Tue,  1 Aug 2023 13:49:22 -0400
Message-ID: <20230801174922.333700-3-bmasney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801174922.333700-1-bmasney@redhat.com>
References: <20230801174922.333700-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add a script that allows looking up the full Kconfig entry based on
the symbol name. Documentation and example usage is found at the top
of the script itself.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 scripts/kconfig/lookup.sh | 77 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100755 scripts/kconfig/lookup.sh

diff --git a/scripts/kconfig/lookup.sh b/scripts/kconfig/lookup.sh
new file mode 100755
index 000000000000..d1ff52b23835
--- /dev/null
+++ b/scripts/kconfig/lookup.sh
@@ -0,0 +1,77 @@
+#!/usr/bin/env bash
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (C) 2023 Red Hat, Inc. All Rights Reserved.
+# Written by Brian Masney <bmasney@redhat.com>
+#
+# This script takes as input one or more Kconfig symbols and outputs the full
+# entry from the Kconfig file. It can be invoked by reading a list of symbol
+# names from either stdin or as command line arguments. Example output:
+#
+#   x1:~/src/linux$ ./scripts/kconfig/lookup.sh TSL2772 SOUND
+#   # drivers/iio/light/Kconfig
+#   config TSL2772
+#     tristate "TAOS TSL/TMD2x71 and TSL/TMD2x72 Family of light and proximity sensors"
+#     depends on I2C
+#     help
+#       Support for: tsl2571, tsl2671, tmd2671, tsl2771, tmd2771, tsl2572, tsl2672,
+#       tmd2672, tsl2772, tmd2772 devices.
+#       Provides iio_events and direct access via sysfs.
+#
+#   # arch/um/drivers/Kconfig
+#   config SOUND
+#     tristate
+#     default UML_SOUND
+#
+#   # sound/Kconfig
+#   menuconfig SOUND
+#     tristate "Sound card support"
+#     depends on HAS_IOMEM
+#     help
+#       If you have a sound card in your computer, i.e. if it can say more
+#       than an occasional beep, say Y.
+
+
+process_kconfig()
+{
+	KCONFIG="${1/CONFIG_/}"
+
+	FOUND=0
+	for KCONFIG_FILE in $(git grep -E "^(config|menuconfig) ${KCONFIG}$" | \
+	                      awk -F: '{print $1}') ; do
+		echo "# ${KCONFIG_FILE}"
+		awk "/^(config|menuconfig) ${KCONFIG}$/{ m=1; print; next; } \
+		     /^(choice|comment|config|end|if|menuconfig|source)/ { m=0; } m" \
+		    "${KCONFIG_FILE}"
+		FOUND=1
+	done
+
+	if [[ "${FOUND}" = "0" ]] ; then
+		echo "Skipping ${KCONFIG} since Kconfig symbol is not found" >&2
+		return 1
+	fi
+
+}
+
+# Run this script from the toplevel kernel source directory.
+SCRIPT_PATH=$(readlink -f "$0")
+cd "$(dirname "${SCRIPT_PATH}")/../.." || exit 1
+
+RET=0
+if [[ $# == 0 ]] ; then
+	# Read Kconfig names from stdin
+	while read -r KCONFIG ; do
+		if ! process_kconfig "${KCONFIG}" ; then
+			RET=1
+		fi
+	done
+else
+	# Read Kconfig names from the command line arguments
+	for NUM in $(seq 1 "$#") ; do
+		if ! process_kconfig "${!NUM}" ; then
+			RET=1
+		fi
+	done
+fi
+
+exit "${RET}"
-- 
2.41.0

