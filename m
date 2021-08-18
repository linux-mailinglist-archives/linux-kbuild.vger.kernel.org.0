Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A033EFB09
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 08:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbhHRGIP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 02:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238619AbhHRGHG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 02:07:06 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2B1C061144
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:05:58 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w68so1059919pfd.0
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 23:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c3QYmodiWkXXXHnLZdw/pUaRbLmOUogtqxubemJOUWA=;
        b=USSHyqJVpQWy8ZMzwl4EbGadTiH3HWAD5GKcye1LyreXSczSehLAnTCXNNAfVEOX6u
         dbx790aQ5KW7gPDgQoMYSPQsAV043/8VAoFfABDnVXFQLnG8rP3OolrjSWEo9TPmmYPs
         NckpHz6JjgIw87sGZSzScnstmZ3DWQOuxHRNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3QYmodiWkXXXHnLZdw/pUaRbLmOUogtqxubemJOUWA=;
        b=SMCzuT5GFfrro08vNvUAGDlh5K48+h1TzJ0QTUolHM77EUm5nLyKRuqYAbvane4hJw
         MYzZFk52lmGomuRBwXfeIb4sqiqkr3DIlouvOgFO70GmWdQpOEs3ifDHC/BLcR95vr9V
         fTnIJ3gpxVLWlOAfCsktgpeAxRJ0r24qWhvPsqRJXLrPR40+/zbkJvHH6UNmijV/AVgm
         1YJaHv0iJSp4vk/PwU1ECIPHdnrr/u3viFp3M9mcOK2jRC7PptdvDTIRL7AhhLOBF0DP
         Gx7L+HpHAwiHcJRZWS+Ebl1lZgrO1GW5OHdf3T6G6zLcy/Ath58gnPb4UWm8FlFHbC5x
         Kr4Q==
X-Gm-Message-State: AOAM531QmZmChuqKblwZT59XhRP2vbNxyjJ7mt5VHBl6EErPK3aO3CaC
        AtmpcpZplgImZDEopKRCQRkZAA==
X-Google-Smtp-Source: ABdhPJywRH9jCkWB+sdI8LV/t2Ou1DJCL47kcdyq5rETJ8QPkKXpqliLW+MKQDbreOWicfFnlLn7Kg==
X-Received: by 2002:a63:ef12:: with SMTP id u18mr7200850pgh.331.1629266758150;
        Tue, 17 Aug 2021 23:05:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c24sm5560285pgj.11.2021.08.17.23.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:05:57 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 13/63] iommu/amd: Use struct_group() for memcpy() region
Date:   Tue, 17 Aug 2021 23:04:43 -0700
Message-Id: <20210818060533.3569517-14-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; h=from:subject; bh=20A/+PUHWtthTe8z3o3iWDN4Pea8VoPXFbZDABJx3xk=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMgAqqlbIpZIBPs4khRtZS/Nl/a6SaswUJcEQdW lSBIpT+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjIAAKCRCJcvTf3G3AJjFlD/ 9d5SSKFk/Byob7i8UcCVOb7iPk8Hi2YrJmknzLO1KIxaNkvuyEARZbq6e4B+T+TPepPhntcPKBfOXP FzeN5FXWJBzVyGoIzNGiCPh2WjsSRI106tmAJhcdyZYmVBcyeyjdu/N1w4oKdYAk4K9v7zjJqZe47b FRaeQAjBKc+4h21NGRtTPZDzSgeXabFrYbQBwUnsITGiIKiRbOWCcDGh1aIZNv6BQVD4Fgpe9isZog 0BCF6kfGofFSR3+EdUSEAaJY5GtmJoPQ5dltBc0m7OGIWYQaf0gwiedtUQd1gVD70DjbjWh3AlITFT Vf7P1sH6jk2mKWV2rZKVWibtUzQcLIXbdByJB+gXLflqIxjrUioE82UZxpX/cMIXbUJ+LVuXzllnFo 8nL/lrsLyasmOQKMZ7Hfx+H9y1Qtsx4Yi9Gf/d+PO5Yq2sV2urkcsqTblr1O674nNzPnTn3PqKHyZd OXFfw5XKgJ15ZpYPMmqOBTwA+1lyh2ypbwGLGTnQJZurT9iDDKnxhukSUEE4UmEgYep9iej5UlVsg1 cUbGoY51vQpCifPn0TF/vQv4ai8qMbObKYv7Xb/rqwe3jqgkYO7Xj97gKJUlXnAJ4bWiRMOFBvJI19 zdGfqZsTlEqTMGHOWNFvVFBQcZYVfy0VfPzdZMvR916KpKjQPu9DSR2qCvyw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Use struct_group() in struct ivhd_entry around members ext and hidh, so
they can be referenced together. This will allow memcpy() and sizeof()
to more easily reason about sizes, improve readability, and avoid future
warnings about writing beyond the end of ext.

"pahole" shows no size nor member offset changes to struct ivhd_entry.
"objdump -d" shows no object code changes.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: iommu@lists.linux-foundation.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/iommu/amd/init.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index bdcf167b4afe..70506d6175e9 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -121,8 +121,10 @@ struct ivhd_entry {
 	u8 type;
 	u16 devid;
 	u8 flags;
-	u32 ext;
-	u32 hidh;
+	struct_group(ext_hid,
+		u32 ext;
+		u32 hidh;
+	);
 	u64 cid;
 	u8 uidf;
 	u8 uidl;
@@ -1377,7 +1379,8 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 				break;
 			}
 
-			memcpy(hid, (u8 *)(&e->ext), ACPIHID_HID_LEN - 1);
+			BUILD_BUG_ON(sizeof(e->ext_hid) != ACPIHID_HID_LEN - 1);
+			memcpy(hid, &e->ext_hid, ACPIHID_HID_LEN - 1);
 			hid[ACPIHID_HID_LEN - 1] = '\0';
 
 			if (!(*hid)) {
-- 
2.30.2

