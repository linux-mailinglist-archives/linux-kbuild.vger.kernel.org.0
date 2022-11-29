Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F53163B853
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Nov 2022 04:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbiK2DAt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Nov 2022 22:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235160AbiK2DAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Nov 2022 22:00:48 -0500
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1B5B45084
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Nov 2022 19:00:47 -0800 (PST)
Received: by mail-qt1-f177.google.com with SMTP id l2so8097711qtq.11
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Nov 2022 19:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZW5yyAML8nd0TO1RTuL2u9Vf793wejxtHRgIYF6POAs=;
        b=uH1E7124HuBpod8/kN4KZ/86G0xrHRrkvAg1KdFiQI7RC/xwb47aMHo8XU1fmxKdeJ
         9HStx6lEHXazPj4TxqlDHe7kAbjAYIwg5rvmL1xpul5Z3m36gi8uNefR8VC91YGC9Bnd
         NKQRCM4wZJfsBw5MhkxwO6YJm9gjRIPfJSmzEEno755ce7iZjFKi0v00TxIh5usP/Wen
         HbjEFI2kl1x8lFzymsUb61KUdstc04Ymz2eZQXx4LFqjslf2d0gYSB/ZUUTcF9GSMDf8
         iJZD057nXbAE1tkye2mJ90SReffRrONjV4FO2jbn980NbpsxePTFx9QU+9eLSXyx1RNf
         wkdA==
X-Gm-Message-State: ANoB5pmFMOWcb/zX9tvCunXESounbHVz8tKYJ7LURN2+kRIWB2jScxUL
        Ncth1QefgChabL4PZ38Cj+0FhiKFLaRZ7Blb+diaOp26OXw=
X-Google-Smtp-Source: AA0mqf7xuFxScihQ3X8fVEXr5fx9ve/S0hnK5Zyj9ZuNB9SAi3cHWN0HkfPcLxAPoU06pLuEgOA0+irKwzkntYj4oss=
X-Received: by 2002:ac8:6886:0:b0:3a5:f507:8ed4 with SMTP id
 m6-20020ac86886000000b003a5f5078ed4mr50660198qtq.450.1669690846679; Mon, 28
 Nov 2022 19:00:46 -0800 (PST)
MIME-Version: 1.0
References: <CAG+Z0CviRhBQqWfAPFDht+mWUJf4azPSZgOV0jrur_YSP23__A@mail.gmail.com>
 <CAK7LNAQP4S0ACMkB3KtaJTaeRkpT_KjRa4CrYxNJboTdthN=Zw@mail.gmail.com>
In-Reply-To: <CAK7LNAQP4S0ACMkB3KtaJTaeRkpT_KjRa4CrYxNJboTdthN=Zw@mail.gmail.com>
From:   Dmitry Goncharov <dgoncharov@users.sf.net>
Date:   Mon, 28 Nov 2022 22:00:36 -0500
Message-ID: <CAG+Z0CvGfuMpM+VpMaPJVY9EjrDztJxMgYKW2Tp_XR1SX0Xxxg@mail.gmail.com>
Subject: Re: Port silent mode detection to future gnu make.
To:     Masahiro Yamada <masahiroy@kernel.org>, dgoncharov@users.sf.net
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

Good morning.

On Sun, Nov 27, 2022 at 1:02 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Please come back after your patch is applied
> (and please have the patch include the commit hash
> causing the behaviour change)



The change is available in git in sha dc2d963989b96161472b2cd38cef5d1f4851ea34.

regards, Dmitry

diff --git a/Makefile b/Makefile
index 6f846b1f2618..c5d5558e9806 100644
--- a/Makefile
+++ b/Makefile
@@ -94,7 +94,7 @@ endif
 # If the user is running make -s (silent mode), suppress echoing of
 # commands

-ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
+ifneq ($(findstring s,$(firstword -$(MAKEFLAGS))),)
   quiet=silent_
   KBUILD_VERBOSE = 0
 endif
