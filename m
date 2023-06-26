Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCCE73DF38
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jun 2023 14:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbjFZMaV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Jun 2023 08:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbjFZM3z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Jun 2023 08:29:55 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0250EAC
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jun 2023 05:29:53 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98e109525d6so324408966b.0
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Jun 2023 05:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687782591; x=1690374591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ju0+ODcrZBnx1oAV+anDlQpNUvILiyay90aLSEjgwJc=;
        b=7godlZtbdCgPV4XK+c3rB9RW+Pd4Xa922Suz4nuNwvbI66de4/UWMwMup2y9KvNwdn
         9+IYapsintYFZbmK94b5YwjmDzoI/bo6vEvXDitTpvWNJHTC3VoLFkWJt2Zyt7n+GsYt
         V/uvBgll90F3jj+o1Wf+LRl6O8SXxlIbKtfa4Sp2hsKwrQi0HQ7KhbocdHLHQ8QuByae
         yiuXesrrw3bw1RbLAaT/WSQQrCG4peFziPwv6ycvMBT8sRfx+HoudCXzk5doxdpCsrpv
         FRztjBZm9Q5837VMUYjyaZonBn7UejGdmn4X/4hdBUZMHNeIY3fHNj61eCGnXTN5udBw
         1Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687782591; x=1690374591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ju0+ODcrZBnx1oAV+anDlQpNUvILiyay90aLSEjgwJc=;
        b=Eim9xMT36CwWovsreRkswHuPcP6LaS7z0ancoCfSSVAcZdrlLHxxrEPTKs9A/WbyL+
         Z3W956pzngXMmKUqrlFvGjzMIpY3ObzF+2r+ZcuAgB47KbPMkHXHNZGY6gs2yz8fhueK
         FzYkIv1c/J8pimCjLvfmDez1jLEslcXma6LhxevFmJTMFyaaNv7RfM9uBbFuOxiZovgU
         QmvJJhid3nqYCkPXevzSjgrLw7cC8HSym7M0IYjVi5bfJ3+hXr8maQWZr8R4V9usuUm9
         TnrnU0NL5J2ujB9a9T6L/xQpHGgNMalhTyX9AXz86vWHCSdY7E19yVJ/nEhUjOCdx9lD
         jkhw==
X-Gm-Message-State: AC+VfDzBNhsje1E760equhgxpSicQrNgnxmtJrx6GN4OVI9lsq+BEBrf
        exMIlv7KEiEAtSGazXC2mfS4IAgSdczqmG9m7iXyKQ==
X-Google-Smtp-Source: ACHHUZ5mKDu+BL9nZQgugaCEe7wQ0unI7Y1bpVR6/JMZZu1o8OrHcrP3i1HeyzkZeRFqGV+LmXtA6Q==
X-Received: by 2002:a17:907:3f87:b0:977:d660:c5aa with SMTP id hr7-20020a1709073f8700b00977d660c5aamr26882906ejc.31.1687782591220;
        Mon, 26 Jun 2023 05:29:51 -0700 (PDT)
Received: from google.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id kt19-20020a170906aad300b00989828a42e8sm3194387ejb.154.2023.06.26.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 05:29:50 -0700 (PDT)
Date:   Mon, 26 Jun 2023 12:29:46 +0000
From:   =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2] scripts/mksysmap: Ignore prefixed KCFI symbols
Message-ID: <20230626122946.lspu73k24cinwobd@google.com>
References: <20230623140825.ehqk5ndl7uftstwy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230623140825.ehqk5ndl7uftstwy@google.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The (relatively) new KCFI feature in LLVM/Clang encodes type information
for C functions by generating symbols named __kcfi_typeid_<fname>, which
can then be referenced from assembly. However, some custom build rules
(e.g. nVHE or early PIE on arm64) use objcopy to add a prefix to all the
symbols in their object files, making mksysmap's ignore filter miss
those KCFI symbols.

Therefore, explicitly list those twice-prefixed KCFI symbols as ignored.

Alternatively, this could also be achieved in a less verbose way by
ignoring any symbol containing the string "__kcfi_typeid_". However,
listing the combined prefixes explicitly saves us from running the small
risk of ignoring symbols that should be kept.

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
Changes in v2:
    Removed redundant filter for EFI KCFI symbol names.

 scripts/mksysmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index 26f39772f7a5..9ba1c9da0a40 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -62,6 +62,8 @@ ${NM} -n ${1} | sed >${2} -e "
 
 # CFI type identifiers
 / __kcfi_typeid_/d
+/ __kvm_nvhe___kcfi_typeid_/d
+/ __pi___kcfi_typeid_/d
 
 # CRC from modversions
 / __crc_/d
-- 
2.41.0.162.gfafddb0af9-goog


-- 
Pierre
