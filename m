Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 276D719FB1F
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2020 19:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbgDFRND (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Apr 2020 13:13:03 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39836 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbgDFRND (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 13:13:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id p10so358414wrt.6;
        Mon, 06 Apr 2020 10:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=yDxXuewRcgFmXFLJr7NOIa2EoB16SqylpIIdg920w9o=;
        b=Q5p5ffAQvrmLCLY6P8RxBfb4zA60VUp2TDX7w10kXkxxrdi0ufJZektsyzAboE2mMk
         W1pR9oDfHABjX9ciF3coRUxCJUjGiwwg1MW2PfMUSC2V3OqsOpjiqW2TbbP6fbgAaoLC
         GWFr61E3uwPcKzwVLiLAJXVdaU2BIYudqdiA+szK4rp/TgWqWisgltUlaDpDJD0l1J6g
         SFQw/cOnAm4dBAHp8n/dI45Hg31YoUHK3gjF0+E55FfiXNcYz8KEvggFaKECVv98/WkD
         YkLbi10JYVCzAITPBmLGak2yI4MKpiDmbh7LN1x/OVed5jHuJDWYord7M7a/ZWJyjz69
         f/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=yDxXuewRcgFmXFLJr7NOIa2EoB16SqylpIIdg920w9o=;
        b=V7yb5nmVjWAT5DD4XLWEmHCXSrhhLu8qqUHYBVTCpJgprEx/9m3KkRMjTGw66EACKZ
         dnuX0vDAaQWjX+RV67j223oT47Hd6p44sXq0/1zUs/Lev5NVpxOvetiMqaVIMpDjMx+O
         tEeszHT8RY/8s5VhE3H604x9avN1C25pn8eHlnofKURxyTed2tfPqzCQMtlD1wUjvibQ
         s3bJaeAmPXslsybu7Nb1StUrR/knYRuicLrhR9iGx2vYVXSrpGFx98GlkhraoF4JFSER
         VtV8zDRJ2ftvdWi3IIXxCAqmHSwr1fexQT0nPHmBtGltXPF/GCwa8pwFeubdpIKargJT
         xfnw==
X-Gm-Message-State: AGi0PuaUjPMEVuZouQ8jXHMhqyN0COzXlUUy3b1Ex0I7SP5ZkD5q8Wen
        EFkatMwhVRbZmELWuw8baWpwAXd2JoEz0bjUFlo=
X-Google-Smtp-Source: APiQypImx3AcFH7fUXiEBvJEMpVTWPqTBCCibC1Nk4qAwkaCOMVfRxv++7gbb3/+2f7tykVkYqqPEQrh7YSF4QDQXIE=
X-Received: by 2002:adf:b64f:: with SMTP id i15mr186026wre.351.1586193181215;
 Mon, 06 Apr 2020 10:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook> <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
 <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com>
 <CAK7LNAQ6ji3=2+7R1DL7eFveH7L7No6e3XkqfqgiH5QFyQj==A@mail.gmail.com>
 <CA+icZUV3rhvmBv91KMKCgvGSvJUoWDVfaV+08eC-kTMdThRn6w@mail.gmail.com> <202004060851.CCB538AD1@keescook>
In-Reply-To: <202004060851.CCB538AD1@keescook>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 6 Apr 2020 19:13:22 +0200
Message-ID: <CA+icZUV1wy6QFzQJFghBpvAphMnZ1DGhYrmrryfZ7vkXfPc3vw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 6, 2020 at 5:53 PM Kees Cook <keescook@chromium.org> wrote:
[ ... ]
> > How to test scripts/mkcompile_h?
>
> There's probably a better way, but I do:
>
> $ rm include/generated/compile.h init/version.o
> $ make init/version.o
> $ cat include/generated/compile.h
>

Thanks Kees.

# Clean-up
make distclean

# Prereq: Generate include/generated/autoconf.h file
cp -v /boot/config-5.6.0-2-amd64-clang .config
MAKE="make V=1" ; COMPILER="mycompiler" ; LINKER="mylinker" ;
MAKE_OPTS="CC=$COMPILER HOSTCC=$COMPILER LD=$LINKER HOSTLD=$LINKER"
yes "" | $MAKE $MAKE_OPTS oldconfig && $MAKE $MAKE_OPTS syncconfig < /dev/null

# Generate include/generated/compile.h file
$MAKE $MAKE_OPTS init/version.o

cat include/generated/compile.h

/* This file is auto generated, version 1 */
/* SMP */
#define UTS_MACHINE "x86_64"
#define UTS_VERSION "#1 SMP Mon Apr 6 19:05:53 CEST 2020"
#define LINUX_COMPILE_BY "dileks"
#define LINUX_COMPILE_HOST "iniza"
#define LINUX_COMPILER "clang version 10.0.0-2, LLD 10.0.0"

- sed@ -
