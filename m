Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901AF63C62B
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Nov 2022 18:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235710AbiK2RKP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Nov 2022 12:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235644AbiK2RKN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Nov 2022 12:10:13 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E3F5EFA9
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Nov 2022 09:10:12 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id a27so9346349qtw.10
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Nov 2022 09:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olH4++MpFlh781TGcmCdYXEtM6cHEv+M/z1JC9wlo7E=;
        b=B7m7e1avKIFjjP7pt/v7tllA+L8tAFEiZymw3X5x6HrICY6H23S8cFlsUDpwLfcOt3
         cRY2R9o7TdSTRg/ADmIhHFt8i2w8Yne4YsXBiZx6A5CsHw0Ev9K21hAcVh+SYd+mtn6s
         6r8ySwPMPW5aHdy6NbEX/DwS/vvMBzl3PxXJA29s1YojHpz7vG7YYaGm0mgTNe3hAdCH
         yb6o8eu0cczhvsKn6DzBrbEymfl7eMLA5s6+ppsTnMsDkY9SZ4yxhMGe04vh6MYh/7Mu
         i2yMrM26IX8hzjZwe/6jnEpgv7Ph81nMuL8tUvHrXWJw4AgQLdYzcbn08RieHxl0lXvS
         6ooA==
X-Gm-Message-State: ANoB5pnY1QNzXSFQTAcBJUOwq+svCEbX1jJ2fzWozuw2rbVjM4aivQ8S
        PznadhRiSHulrkI+YUb5ED8vfAmv6fKZ7UCsths=
X-Google-Smtp-Source: AA0mqf6LSOKEgOiEPtXKNi+dT4cN94W1vYmCVP1l+0FWFme6cBEsSzNSLjWCcZCB/lqoIQu4XqqpngtYzVxX1WAv/pA=
X-Received: by 2002:ac8:6792:0:b0:3a5:1c8b:8890 with SMTP id
 b18-20020ac86792000000b003a51c8b8890mr54669703qtp.63.1669741811388; Tue, 29
 Nov 2022 09:10:11 -0800 (PST)
MIME-Version: 1.0
From:   Dmitry Goncharov <dgoncharov@users.sf.net>
Date:   Tue, 29 Nov 2022 12:10:00 -0500
Message-ID: <CAG+Z0CvOxWdvDi5qKa=ayPasVYxrourTDjEpXsg8T=mj3J4s6Q@mail.gmail.com>
Subject: [v2] kbuild: Port silent mode detection to future gnu make.
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     dgoncharov@users.sf.net
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
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

E.g.
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

This suggested method will work with the old and new make.

Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
Reported-by: Jan Palus <jpalus+gnu@fastmail.com>
Link: https://lists.gnu.org/archive/html/bug-make/2022-11/msg00190.html

diff --git a/Makefile b/Makefile
index 6f846b1f2618..c5d5558e9806 100644
--- a/Makefile
+++ b/Makefile
@@ -94,7 +94,7 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands

-ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
+ifneq ($(findstring s,$(firstword -$(MAKEFLAGS))),)



regards, Dmitry
