Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53A134C9508
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Mar 2022 20:50:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbiCATvX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Mar 2022 14:51:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237394AbiCATvS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Mar 2022 14:51:18 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAAE5B3DA
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Mar 2022 11:50:00 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id r20so23343435ljj.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 11:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=WTk4tYQw2vdZiF+qv8ukX3RKDykoEpwz9TdOJoe0sHw=;
        b=EGJ1AS4e2coTIKzgL/I7zLRvrtm/q2qoHzvNaQa5NbIl/gInsv54nM3QxvJQ4cJHFj
         s9VThdHLmKTS4AKOs9P4WXtuixboCJwE7XesLMUGgGRUUgUJN4auY/pCbzxvC0OAYdIh
         /flsE26K2PV9BxEShEm8cNwcZrM9C9uFEd0Z8Ceeh6E1uTylDckjIjN1zhqlZKXUu0EM
         2tow5Xp9xLefSfWEpglXffvb4sGO0SqyMFRqVJugh8XpEfrnYeIIONVuYaj1/tROQ38T
         aKT14xjh3Ufp19YzFn+XQ3DPDo17TaW2Oppj8wbAkS9ujMrlzSCu/+C3+WhbX0ujhv8S
         SFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=WTk4tYQw2vdZiF+qv8ukX3RKDykoEpwz9TdOJoe0sHw=;
        b=VSLeMOG0E8b/307tFyuvVLz1kKoWjQJs5GNum2Xf8dqMviqCfnUp6VhKO1jrl8DNqB
         BtgdQjIng5FakP6KUh/73NEjGKI5nrpY8U0qoB0dQQTtxPNpsSThZb/OehyO1zVlIa5B
         UkzMLZmMLCxt6WNjUh/LZDobwG2ma4u4/+1kRxwO9IVNaeEnMi3PXVEPu16svDIRvaG6
         0zGEz/3ZHjw/06SCC4R5UUI8GGPYly+ECucEFEnjNcVSaZ0ghpX25Htvcs7W19pmi4qS
         0AbgMqVUesHTWe4yypZnN4HY9dKCTIbSfOFxb7Cs6t6/uUCqQFtyohrBXUQ00WumaIBJ
         wpKw==
X-Gm-Message-State: AOAM5313/xY4PgXnLov/VNmuHuFQ+HOeE83U0bMt+tGAd1q9Wq3OmQv6
        A3CHwQymBcOlbP2B9h6umXexIuw7HBGzk/WzzhEspA==
X-Google-Smtp-Source: ABdhPJyRCgMocLF4Thogv5NYXHgcbdVXaKdaZeSsyN1tJxYwDZkSBjvnt0E2k8NCEjhpcZWr2UAk0bjfiVPO08iuKO8=
X-Received: by 2002:a2e:8942:0:b0:246:4536:cf22 with SMTP id
 b2-20020a2e8942000000b002464536cf22mr18089304ljk.235.1646164174299; Tue, 01
 Mar 2022 11:49:34 -0800 (PST)
MIME-Version: 1.0
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 1 Mar 2022 11:49:22 -0800
Message-ID: <CAKwvOdkd3vHMRNAJABho7Ok9HOofBZKeXTzjW0ZZku_+5GvtYQ@mail.gmail.com>
Subject: UAPI_HEADER_TEST and CC_CAN_LINK dependency
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev, Elliot Berman <quic_eberman@quicinc.com>,
        Elliot Berman <eberman@quicinc.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Trilok Soni <tsoni@quicinc.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-18.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Masahiro,

We'd like to be able to better test UAPI headers via
CONFIG_UAPI_HEAD_TEST=y with clang builds during cross compiling.
We're finding that CC_CAN_LINK=y is not enabled because clang (unlike
gcc) isn't configured with a cross libc in hand, and one may not be
available in the environment. This is a similar constraint to the
prebuilt GCC images distributed on kernel.org.

Looking at
commit d6fc9fcbaa65 ("kbuild: compile-test exported headers to ensure
they are self-contained")

Simply removing the dependency on CC_CAN_LINK=y allows us to run the
UAPI header tests, which pass on ARCH=arm64 and native x86_64 builds.
https://android-review.googlesource.com/c/kernel/common/+/1991156

I assume there may be some additional constraints perhaps for other
architectures or certain configs?

Another suggestion from the bionic maintainer to ensure the tests are
more hermetic/self-contained would be to add -ffreestanding to the
compiler invocations of these tests.

Do you have thoughts on how we might be able to eliminate the
dependency on CC_CAN_LINK for UAPI_HEADER_TEST? Otherwise, I suspect
we will have to use `USERCFLAGS=--sysroot=/path/to/sysroot` to make
CC_CAN_LINK work for clang cross compilation. See also:
commit f67695c9962e ("kbuild: Add environment variables for userprogs flags")

-- 
Thanks,
~Nick Desaulniers
