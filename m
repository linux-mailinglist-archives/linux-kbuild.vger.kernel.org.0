Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9585641400
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Dec 2022 04:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiLCD0M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Dec 2022 22:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiLCD0L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Dec 2022 22:26:11 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA576BA627
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Dec 2022 19:26:08 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id a27so7805633qtw.10
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Dec 2022 19:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkTzDvSnZXe89xjmxxSqxSc98MhqTdNkU97v8s0nS4o=;
        b=05o9VKTNC4vTF0mITqOSBDUeWl6pKIa6RutKYvVNf32BE2Hoi3RhsQwbVojOyKiLIE
         fQBnNpjV9kS/Ah1VxdkSUbC5sjt4jhDdeaECs/69pGRZmPVMWKbSTmI392vLp5h0jSy4
         f+BTserugdb08SJ0x4RDFjW0CZuGpQuHCA7tfQvTw0rssIy7kZ4h0+6lkaiL/z1p8cgD
         lppjQ+B7bq92Cz35a/MGPHWxGhTnEdIIJzRGIOkYwU8C/Z8YoBNhLzYtoRigfWTD604p
         V+Oi9lUZols7o6B4SzgKy7owC0FIKr8ZnK2BWkvw/o0JnbiMHDs5DoujchR+3c1+LNBx
         Aszg==
X-Gm-Message-State: ANoB5pkLGBvX8qYR5KyeU/AllYhY6I/18Tg8JaqOUUcHB+BVIBjthExU
        UAxOSLra2YxgKVsvPer/DUAILDTpy+hTeS/7MFV/WKblq9A=
X-Google-Smtp-Source: AA0mqf62JL9fPtMvQYf32E4QiDoEtvWd/ClhZLQM9j5Ld1kdLbyREeAcPZQvJ3Ov1yoz8GKSoLPbtczOY8k/xHB0lag=
X-Received: by 2002:ac8:6792:0:b0:3a5:1c8b:8890 with SMTP id
 b18-20020ac86792000000b003a51c8b8890mr69878100qtp.63.1670037967962; Fri, 02
 Dec 2022 19:26:07 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
 <CAK7LNATkKgPu2Y1qEUSAta18ST7DkS2s=yEAge9b8XbpTX-qow@mail.gmail.com>
 <CAK7LNAQf+Cj4nLkK+EOnPuyVym18xC4rJ+Pon5cFqXTTebfxBQ@mail.gmail.com>
 <CAG+Z0CsTtXctFE2LG0+B+zWQCJTnfJkkYweV3qzFBgxZsXKLxw@mail.gmail.com> <CAK7LNARUwXn-CVy7husUhcKF5buVo5eZdP9fvN+4yy5fwg_24A@mail.gmail.com>
In-Reply-To: <CAK7LNARUwXn-CVy7husUhcKF5buVo5eZdP9fvN+4yy5fwg_24A@mail.gmail.com>
From:   Dmitry Goncharov <dgoncharov@users.sf.net>
Date:   Fri, 2 Dec 2022 22:25:56 -0500
Message-ID: <CAG+Z0CuM5gKa+n2ayOYF9oDqc1ZpuN64bw37SLqk0CTUi3_gGg@mail.gmail.com>
Subject: Re: [v2] kbuild: Port silent mode detection to future gnu make.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 1, 2022 at 6:39 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> You do not need to change the logic in 'else' part,
> but this will work as well.

Here is the version which keeps the 3.82 specific code intact.
Tested with 3.82, 4.0, 4.3, 4.4, the latest master.

regards, Dmitry

diff --git a/Makefile b/Makefile
index 6f846b1f2618..fbd9ff4a61e7 100644
--- a/Makefile
+++ b/Makefile
@@ -93,10 +93,17 @@ endif

 # If the user is running make -s (silent mode), suppress echoing of
 # commands
+# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.

-ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
-  quiet=silent_
-  KBUILD_VERBOSE = 0
+ifeq ($(filter 3.%,$(MAKE_VERSION)),)
+silence:=$(findstring s,$(firstword -$(MAKEFLAGS)))
+else
+silence:=$(findstring s,$(filter-out --%,$(MAKEFLAGS)))
+endif
+
+ifeq ($(silence),s)
+quiet=silent_
+KBUILD_VERBOSE = 0
 endif

 export quiet Q KBUILD_VERBOSE
