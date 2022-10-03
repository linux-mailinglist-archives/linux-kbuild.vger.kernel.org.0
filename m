Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D6F5F2E8A
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Oct 2022 11:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiJCJ4I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Oct 2022 05:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiJCJ4D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Oct 2022 05:56:03 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8EE3678B
        for <linux-kbuild@vger.kernel.org>; Mon,  3 Oct 2022 02:56:02 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id c22-20020a4a4f16000000b00474a44441c8so6417941oob.7
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Oct 2022 02:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=QzZ3/SzpNpkysByhRubab1VaNdi5Oa8ArCUSibq14IU=;
        b=jyDudqFeNBoWAN8W4pWK9Q08YDvOptcnMiEZ39SDfaN/pOnbU4Ry+U7ekIxLTBWYeh
         NSAGNn42keeOjOaTOkmBdKsfWOBAdgmU9WPr3k9uYhh6A7mb2mkIQJIW8/cxTsautXxJ
         pKy5zgxeJNWykGMesGxghSPQZ29FzIjXJuwOHORuhhW0bc1P6WaSCRnchTKq3p4pZV5R
         AU5EExLnRvW2qWTgoqimkdj02FA2Q7/RInCAbyX0s0go8QK1AZ4gxmxhM+A+uiOwRgxn
         O6kwlOn462pkcAwElUG90KPdqK37zEZ/5AurJOX2YZ+I4Imd2L1TCvaDhRFS8OzkXQRO
         nVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QzZ3/SzpNpkysByhRubab1VaNdi5Oa8ArCUSibq14IU=;
        b=JUj9SRIOFEpUbNjwLowwFVAqeceizEFexoQoahHRV4FXqgyEhG6ncBVeuJ9mCTmz49
         4iRE/ydkT5TIz+lzeME2D1TQnBLQKllq9tlfaUG9w0dkrQsnAiP6CpvgDuqfA566CqO+
         pkezdaDnXn23oSdO+2gKafKj2765/aX3GFlHftUkAqgtYPzdchaVzJJCzmvqo7PP5ZY4
         aCBW7PYK+xoFFxCv9awemG8r3X+M8uG/ZzmwOZG3rZDTcNKItGhLbCFwQkSBcT0OnadB
         yD3CxRiCPC1UOhLKb1z/txzgfdhANe68deL77+csniE8v8/yQTjjOPtsbTyuoCq3Wz2B
         XifQ==
X-Gm-Message-State: ACrzQf2Vx+GVK7JOeZbnbGy6g38YrwSSTUMKetLGHWK38R8TfKA6kKXT
        vZcRAPucdDS48ojDv2o85xipeEPUaDzZm1WjdvxbEqPJQx3MLQ==
X-Google-Smtp-Source: AMsMyM7ARRbuH4ujnGwMwZwl49FfRODnhyvrEdfLEYONMR0AnAjigf7Um3EFdCkln7i+3RI9EdK96mo74dbxIPW5jqI=
X-Received: by 2002:a05:6830:6084:b0:65c:3942:e3bf with SMTP id
 by4-20020a056830608400b0065c3942e3bfmr7937630otb.49.1664790961942; Mon, 03
 Oct 2022 02:56:01 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 3 Oct 2022 11:55:26 +0200
Message-ID: <CA+icZUXQgnhcsjHMcm_KwD4O6FfUFv1vTDmdW4vGJ6oX-Y1GnA@mail.gmail.com>
Subject: base-files: /etc/os-release should contain VERSION variables for
 testing and unstable
To:     1008735@bugs.debian.org, Gioele Barabucci <gioele@svario.it>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ CC linux-kbuild folks (see [0] ]

Hi,

I am using Debian/unstable AMD64 and doing Linux-kernel upstream
development and testing.

People using bindeb-pkg (mkdebian) from Linux-kernel sources
(scripts/packages) to build and test their selfmade Debian kernels get
a now a "n/a" for distribution.

Background (see [1]):

[ scripts/package/mkdebian ]

# Try to determine distribution
if [ -n "$KDEB_CHANGELOG_DIST" ]; then
        distribution=$KDEB_CHANGELOG_DIST
# In some cases lsb_release returns the codename as n/a, which breaks
dpkg-parsechangelog
elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n
"$distribution" ] && [ "$distribution" != "n/a" ]; then
        : # nothing to do in this case
else
        distribution="unstable"
        echo >&2 "Using default distribution of 'unstable' in the changelog"
        echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST explicitly"
fi

Personally, I set hardcoded in my kernel build-script as a workaround:

distribution="bookworm"

Gioele suggested me to enrich /etc/os-release with:

VERSION_ID=unstable <--- XXX: I prefer sid because of PRETTY_NAME and
it's shorter
VERSION_CODENAME=bookworm

In the end the file looks like:

PRETTY_NAME="Debian GNU/Linux bookworm/sid"
NAME="Debian GNU/Linux"
ID=debian
VERSION_ID=sid
VERSION_CODENAME=bookworm
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"

...and this seems to work:

# lsb_release -cs
No LSB modules are available.
bookworm

Please, provide a solution not to break workflows that were successful
for years.

Thanks.

Best regards,
-Sedat-

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n11005
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/package/mkdebian#n123
