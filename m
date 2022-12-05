Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E06B9643757
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Dec 2022 22:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233430AbiLEVue (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Dec 2022 16:50:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbiLEVtu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Dec 2022 16:49:50 -0500
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDE511E
        for <linux-kbuild@vger.kernel.org>; Mon,  5 Dec 2022 13:48:30 -0800 (PST)
Received: by mail-qt1-f181.google.com with SMTP id h16so12469161qtu.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Dec 2022 13:48:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrM7lYT5vUMzYOgrsk/Qt83aQ2SLJfVgXk35+zm1BAA=;
        b=tNY8f7H/MapjIhdWTVvapSoEo1irI6B4QjmHVNpFwGsm6OC+jcju7XQ46/hbKLLsjm
         ICQAJDoYyKWVzdpSeIEaC/gvNXtBUGBApe3PbYZhvxiT7mxdKBmJLFTl1zhJj8Mrw8Qi
         GhqJW9m3H/WLXnBJs31s7vYPjtaD8HKn69MmPFrxe7/BtZQ8ikgyUkYDQwyywseQTH9p
         gZF3pDmDUi8B0HS1qmNPbCoUCYvf9bdab3WooqgYCkcEvtev13Mz3wUaY479lqn/sYDV
         P+xCI3lzmHQME0OuanC0p3xXC6ar3i0hgmkWTaarTmJuuxzwrUFfEGLJ+ugyxNLY12vH
         ErSA==
X-Gm-Message-State: ANoB5pmztpPn9lOPXVFkwkDBwDDIb69X7MVDB1WQo6aBBSMvgIadLV7f
        SrkmNXH573Dp4SdIdfhdXZnMwFi1xqG0QLOm3wXLZ0SS61E=
X-Google-Smtp-Source: AA0mqf4xCxaBc3rYq8qa/GweWK8v+T+J2Bl9GJtrkySeF1ePXiyiRx8HJO7V1uYeC25Cf6e0RAlL1Xow0AJLvIPqxqg=
X-Received: by 2002:ac8:72d0:0:b0:3a5:9e38:9f4 with SMTP id
 o16-20020ac872d0000000b003a59e3809f4mr61695283qtp.532.1670276909669; Mon, 05
 Dec 2022 13:48:29 -0800 (PST)
MIME-Version: 1.0
From:   Dmitry Goncharov <dgoncharov@users.sf.net>
Date:   Mon, 5 Dec 2022 16:48:19 -0500
Message-ID: <CAG+Z0CvbeLYoY0DpPK14inUMTat=zkRLJgqZ4mW0c10Vf_d6ow@mail.gmail.com>
Subject: [v3] kbuild: Port silent mode detection to future gnu make.
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     dgoncharov@users.sf.net
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Port silent mode detection to the future (post make-4.4) versions of gnu make.

Makefile contains the following piece of make code to detect if option -s is
specified on the command line.

ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)


This code is executed by make at parse time and assumes that MAKEFLAGS
does not contain command line variable definitions.
Currently if the user defines a=s on the command line, then at build only
time MAKEFLAGS contains " -- a=s".
However, starting with commit dc2d963989b96161472b2cd38cef5d1f4851ea34
MAKEFLAGS contains command line definitions at both parse time and
build time.

This '-s' detection code then confuses a command line variable
definition which contains letter 's' with option -s.

$ # old make
$ make net/wireless/ocb.o a=s
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
$ # this a new make which defines makeflags at parse time
$ ~/src/gmake/make/l64/make net/wireless/ocb.o a=s
$

We can see here that the letter 's' from 'a=s' was confused with -s.

This patch checks for presence of -s using a method recommended by the
make manual here
https://www.gnu.org/software/make/manual/make.html#Testing-Flags.


Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
Reported-by: Jan Palus <jpalus+gnu@fastmail.com>
Link: https://lists.gnu.org/archive/html/bug-make/2022-11/msg00190.html

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


regards, Dmitry
