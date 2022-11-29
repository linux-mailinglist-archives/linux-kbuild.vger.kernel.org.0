Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8615563C664
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Nov 2022 18:27:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235644AbiK2R16 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Nov 2022 12:27:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236599AbiK2R1w (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Nov 2022 12:27:52 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DD8C77F
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Nov 2022 09:27:51 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id w4so9437052qts.0
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Nov 2022 09:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmlKMpE9PogjKEO+3Qce5eOGvx3+3ImgS1j2lXdTKVA=;
        b=wI29spjGu3tnxeRXgNk9IjEhsd9XjCPhPLo2DmC8IovGZ+nTTcXTwQrhbKJraUD0Au
         F6jzamenjicbgpIaV8M8eSxaXu0s15QfibEBl9WHrFmioEkGs01bKCPbjc8qyd46bo/w
         Z1x3wtmMk+H7caEh1leWI0r5XecTgVIZTaW+EerwELRICejuU2gHCDyJT0r5bkaFbMHg
         O4zc/V8nvNmyzobKh2hRavnEQKyBEoMrD397mgRtQarg8ClN2YQytN359DeF3yhzRVQk
         9YnBDwnwqXUAWXpgXB7Xz30c+fKtQjz2+y7C5VLuVseAnpoiJzzevI+ns6U7JKGqsZC0
         dhow==
X-Gm-Message-State: ANoB5pk01/z9IJJIpVHVOiwvXgY270CSILgg2JYJd+B1Qdi5fSd1VFlD
        Jim4mp4rYWkM8KPLGOFHvRcGLPzuopR2HzTRpq0qXRIoVMc=
X-Google-Smtp-Source: AA0mqf56SsJzZMz7I0efKirsSOuptZcDuHFM7Zd3ISRkJJX/DPhw/rLFHwVQHfrUj1blz+Sd3BGJ+QV8RJSj0Wl91pE=
X-Received: by 2002:ac8:6697:0:b0:3a5:24ad:73d with SMTP id
 d23-20020ac86697000000b003a524ad073dmr36934330qtp.167.1669742870133; Tue, 29
 Nov 2022 09:27:50 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CviRhBQqWfAPFDht+mWUJf4azPSZgOV0jrur_YSP23__A@mail.gmail.com>
 <CAK7LNAQP4S0ACMkB3KtaJTaeRkpT_KjRa4CrYxNJboTdthN=Zw@mail.gmail.com>
 <CAG+Z0CvGfuMpM+VpMaPJVY9EjrDztJxMgYKW2Tp_XR1SX0Xxxg@mail.gmail.com> <CAK7LNAQn248OsEGXCRFNURt7VC6eNfu-EEtphdtw9uNJPD_16Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQn248OsEGXCRFNURt7VC6eNfu-EEtphdtw9uNJPD_16Q@mail.gmail.com>
From:   Dmitry Goncharov <dgoncharov@users.sf.net>
Date:   Tue, 29 Nov 2022 12:27:38 -0500
Message-ID: <CAG+Z0CusEYVCMP9LSOQ3Cahr--DHwVOxDLQwgVed3T9hdLBw6w@mail.gmail.com>
Subject: Re: Port silent mode detection to future gnu make.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
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

On Tue, Nov 29, 2022 at 1:22 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Kbuild is already having an issue in the -s detection.
> $ export MAKEFLAGS=-I/usr/local/mk
>  or
> $ export MAKEFLAGS=-Orecurse

i am not concerned about these use cases. This code in question fails
to handle the use case of MAKEFALGS in env and apparently this does
not bother anyone, otherwise this code would already be fixed.  My
concern is that the change, that we introduced to make, won't cause a
regression to those of us who specify -s, once the users migrate to
the new make.
However, the fix will help the MAKEFLAGS-in-env use case, as well.


> Commit 77881d228103 ("Ensure that MAKEFLAGS is set when invoking $(shell ...)")
> is the commit that caused a change.

The whole sequence of events is the following

1. commit 98da874c43035a490cdca81331724f233a3d0c9a [SV 10593] Export
variables to $(shell ...) commands
This allowed make variables to be exported to $(shell) at parse time.

2. Then a user opened https://savannah.gnu.org/bugs/?63347 and
(correctly) argued that the behavior is inconsistent. The
inconsistency was caused by MAKEFLAGS lacking command line variable
definitions until build time.

3.  commit dc2d963989b96161472b2cd38cef5d1f4851ea34 [SV 63347] Always
add command line variable assignments to MAKEFLAGS
This adds command line variable definitions to MAKEFLAGS at parse time.




> Please send v2 with $(firstword) and updated commit log.
> Also, add this tag:
> Link: https://lists.gnu.org/archive/html/bug-make/2022-11/msg00190.html

Done.

regards, Dmitry
