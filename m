Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3128C1EC833
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2020 06:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgFCENB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jun 2020 00:13:01 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55479 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCENA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 00:13:00 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0534CZcV032283;
        Wed, 3 Jun 2020 13:12:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0534CZcV032283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591157556;
        bh=RdqgzaEZ5aWkaJNeElZf+u5QPaRSIBZWZfDxCZ0IlNs=;
        h=From:Date:Subject:To:Cc:From;
        b=FyKCtassgLAnKLG9f0KtxiRBQASSGdr3iDTQ5uy85jATUv4b0Rh6QnldaTf0tQcwt
         hQtnnEf57MGc0iHDJ3QB7wmnYR0tsFHfNT0l0vqTnFOXyl3OMbdM0TjXBYrHFK4z/p
         R+1MS4nqwzX5PxY6qwIZxJ1hV9B8QWFqFRpPeCo6BPf0SK2yJhemsSi5fh7n0CqEzo
         GF3jxbbDGX9lsHic0b2lmqhYPfrfO7hhU2WdPQ8Ic+yYfV4vqrsvBFBewFXIvfVCTn
         wm3J8DCN0KjY7p1O6/abRzzEwHvO4ImrdT9Ixdn/RLxjWscF6mRrr/xM0EOLZkkDEU
         SzYIF/ZH5nhiw==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id d21so225515vsh.12;
        Tue, 02 Jun 2020 21:12:36 -0700 (PDT)
X-Gm-Message-State: AOAM533WxqQESqNO6jYqfgCOQ3sny2bwKPvH4uw1+mh91NG7PXNXNxaP
        b9u8DgdYLy+fmVdpGsnUr23KU/YpDh1442EcnPw=
X-Google-Smtp-Source: ABdhPJyq2XxPKPo8PHm8wvmCI5Y5KjbfROxsQpWcJLX4huqTb3nfIELobNfM0SH/W9xYha/rY7vo5zMFhMrsmI0VGw8=
X-Received: by 2002:a67:67c5:: with SMTP id b188mr9633348vsc.155.1591157555346;
 Tue, 02 Jun 2020 21:12:35 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 3 Jun 2020 13:11:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_rgoDQPgDB2cTvwmXrQv2mFH1ysuhvWxp2HnVMd0W7Q@mail.gmail.com>
Message-ID: <CAK7LNAT_rgoDQPgDB2cTvwmXrQv2mFH1ysuhvWxp2HnVMd0W7Q@mail.gmail.com>
Subject: ARCH=arm64 build breakage for Kbuild for-next branch
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Stephen,

If you pull the latest kbuild for-next branch,
ARCH=arm64 will fail to build.

I will fix it soon.

For today's linux-next, you can patch
as follows.
(or, you can use the old branch)


diff --git a/Makefile b/Makefile
index f80c4ff93ec9..fbb4b95ae648 100644
--- a/Makefile
+++ b/Makefile
@@ -1074,7 +1074,7 @@ build-dirs        := $(vmlinux-dirs)
 clean-dirs     := $(vmlinux-alldirs)

 # Externally visible symbols (used by link-vmlinux.sh)
-KBUILD_VMLINUX_OBJS := $(head-y) $(addsuffix built-in.a, $(core-y))
+KBUILD_VMLINUX_OBJS := $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
 KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(filter %/, $(libs-y)))
 ifdef CONFIG_MODULES
 KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))


Thanks.

-- 
Best Regards
Masahiro Yamada
