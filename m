Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1ED3D7FCA
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 22:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbhG0U7I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 16:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbhG0U7H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 16:59:07 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1F3C061757
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 13:59:06 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ds11-20020a17090b08cbb0290172f971883bso6643206pjb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jul 2021 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPW4aGYkFWagrfBZ6kQLS1fLAo/l3YI0HfE68pjP/OM=;
        b=UXpVpHuoBEvfkIVMmS2/VMwQ3bCV5jrK0wfMve0yrY4hayGeG4jDKjgxlRt2It30Iz
         S44+j1gZxTlkm8YvMSPchxSLtEdSeKLytFhP5KNfmjNxQ6L+nnA6VIeYdnOhHvYqTGNE
         2lfrw5gKAB7i6UPypwEWQs0LaSLesvD8FyEig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPW4aGYkFWagrfBZ6kQLS1fLAo/l3YI0HfE68pjP/OM=;
        b=nKl185RUpRqMEHggKjzFSA6nrBc6wr6PMdPmD0mduuSdkZbgZrcuBwh4Z16KwhOV8m
         C9puhGCPQ/xQPGAxDP5Eza2MHy1hODotjIGo9O09TNw7/XnJChh6gejLI/oqSHzmoNcA
         zWuRDI7kfh6jBNpH+kUhsIaK9ujK0tjttriMU042HxmVTXx4tWdx1S0mw2oUu8q3M+er
         15qPR33J8STYtDymwsSt+R6cE7P/E9Ooz46vQFO0eRr28C6fzHI0Jdb01yWtwO9+4flA
         RITW4YwmiKJoY5463tkq9CmdYruRqYTtUz8U+qqBSBQyaNIvU8k3/fGqqmlO/Zu7gzxY
         YmOA==
X-Gm-Message-State: AOAM533gHW2rxeOHI7IqyUQoVlgVfHSAVcGI5Ke4/I5VqxpBLj8nqu4d
        KYr1M45ySf34r/ZSfVgNtVqEVw==
X-Google-Smtp-Source: ABdhPJxd0+AjNRPUswTM0GF/7R6M9ezJro8mUT8qaHqrKFrbmFwcqlTxjNrGQJxkBIVrT0fiUY7kSg==
X-Received: by 2002:a17:902:7001:b029:12c:4e36:52c5 with SMTP id y1-20020a1709027001b029012c4e3652c5mr2732432plk.9.1627419546233;
        Tue, 27 Jul 2021 13:59:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v5sm5184284pgi.74.2021.07.27.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 13:59:05 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-hardening@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Keith Packard <keithpac@amazon.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH 09/64] staging: rtl8723bs: Avoid field-overflowing memcpy()
Date:   Tue, 27 Jul 2021 13:58:00 -0700
Message-Id: <20210727205855.411487-10-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200; h=from:subject; bh=W255D43HxOgsOipc15Ftl/Z16nQ7WLNF6zRAweGW0nw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOC1QFEAUDqn9/LsmpdJgx+v9gsLtlsJdMUyKBG b+56mhyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzggAKCRCJcvTf3G3AJltAEA CFqUNvIguNTsoQJJxTpZmXIFSznOd0DQbsxxZjiiSI+Uy5K/rxgo0fi7YbevEnqZLbfvmzTrflUtnP vrxikp6Nm3oUKk87MfWKm55/Rb4UNEtRFkq6lpU13Pff2ZKiGagsWulzzRcChGxOWGJLkQgutmZo19 4lL+NXsl53eQK+fKsQUzoeZnXWEXR6fi9Prc46Jpll0wb0XU9OCffbFczCNAJ2TFktSN97z0OLhGOj bKetL0pmjEsXBBLKFBsoi6qrkGdaWIt+UYNqj6GyUTxl9aSKASroGp7CnPxFzGw8860bLtdeVytJpH M6VWwhSrRFnJ9E/kNVoT3886OMGv2hE1L1SgpE4EDWKKIk8OhjNP+fc2jAdhvOv3toFl4XiMe5rVbd XdqTBfQvqWFw1vAelUGVpKbstixGrSv0cEqG97X0qoVoqij+34qbecwOpBc2j8/gQp9d6gdqWiC7QO HVaCe91yWXyU7FvAW8qYQnHiPqborIACdGPPaCnRpJozv/LSuBdXrN/zfRcuHrOFb+yI1mNplJICgl WgxTNn036UBtlbh0Wb2bxTvaLshJR8pghfrGo4l7FN0LRxsxCkn4g9ZFd/8BPya8EYm72GRg/jZPRV IgZEiVdWLN8MdZlNcQ/Udi70s66J8qKfCm/KsWRSEfFjdnJHu0Fgu1w04aGQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Adjust memcpy() destination to be the named structure itself, rather than
the first member, allowing memcpy() to correctly reason about the size.

"objdump -d" shows no object code changes.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index a0c19253095d..fbd6e3d16323 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2390,7 +2390,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	}
 
 	/* fill default supported_mcs_set */
-	memcpy(ht_capie.mcs.rx_mask, pmlmeext->default_supported_mcs_set, 16);
+	memcpy(&ht_capie.mcs, pmlmeext->default_supported_mcs_set, 16);
 
 	/* update default supported_mcs_set */
 	rtw_hal_get_hwreg(padapter, HW_VAR_RF_TYPE, (u8 *)(&rf_type));
-- 
2.30.2

