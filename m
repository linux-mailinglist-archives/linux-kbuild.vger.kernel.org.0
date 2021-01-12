Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9EED2F2502
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 02:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbhALAjZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 19:39:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728959AbhALAiq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 19:38:46 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7A7C061794
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 16:38:06 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id q22so1044863eja.2
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 16:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAGK7QJnpAigixBsDwJOzFarQpa+uBn1LCtFQ6nqZOg=;
        b=Zj+qOLhHhCXzhbKC6BIAew+AX4ps5bw/ov5suzZPwzPwiHyKHAlZpPGpfXEv10EV0C
         f+u28iptdt6p3p/fA/LMgRUvZ0kd2jfsUajM6UJUSBoPn2lAtcEaVibSRudyHVAG4Dsh
         5wbu9vfoEfHtNNaSfcndmEfzD+b2I4KevWgCKhp795ZOltdJO0dx3nFQahcQtqyMYYOD
         C+m5v5SJZNDC8hJ4kQip8/63FIZVNzGX83A1ZZhSRmCpE6039rjwpXxqRHRMtjE9QYc0
         9ucW1UVi0j32EE9Iam8Z1bs/Sa6LKBX/qLkboU4v1MA6+NRGJrzDgARi25KLBaPpYdf+
         oFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAGK7QJnpAigixBsDwJOzFarQpa+uBn1LCtFQ6nqZOg=;
        b=AhyRVQRsed3f9Xb+bJ/S3vNfRJm0j2WHBsTa1T0X3x4hyOcKtS+i7SmfRolruFlkzs
         IcWOeNFbhLnTbeYs2VMp4CU/8rznIDYx4PzeVvWw8JDwjl9Tk7aC+uD3rh1lcEV0xGL8
         vTynK3egi/A+gMWPGn3mBCVUmpsg9wAwlA1AZ9sHduJqe6x4IB4DQ90EXznANHnx0+F5
         UIezustqdzST2PmBX1LOpzjXW0IWFHL0V7B7ADNOYS+WKALEPdxAIOFZBFpzerPF4Yln
         UwiWWLwmDu+MM3XU2KfPhMQmVkNJoj5Ol9Xp3BTgHja5CHPJWPc2jet4TdEWay3igZ2t
         Ycdw==
X-Gm-Message-State: AOAM530oQplVsbUodT4sUmqLDCaoiKOgTa7bnyxtKDSwj+xdeCELTRgr
        fxPVa0MISIBriskrFqMw4MTW3Oq/arbnAj127MGB
X-Google-Smtp-Source: ABdhPJxzGLv08AscXEmZjjVg2gsLIwKeoO6Prumvngl5LoIbvGS5MQiYEFtsPvhL3T6YwqPt/MFDm1VJuygtgOcJAMM=
X-Received: by 2002:a17:906:1194:: with SMTP id n20mr1301510eja.269.1610411884658;
 Mon, 11 Jan 2021 16:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210111201224.l5r2zxuyd7ayszke@google.com>
 <CAGG=3QWo5_wwTMHtif4BzFssByaW1ScvpaEH1p1nZ6ymVggLjA@mail.gmail.com> <20210111203120.daeef4yuwgmk5em4@google.com>
In-Reply-To: <20210111203120.daeef4yuwgmk5em4@google.com>
From:   Bill Wendling <morbo@google.com>
Date:   Mon, 11 Jan 2021 16:37:53 -0800
Message-ID: <CAGG=3QVs8dUaqcnuHYiaqccMhp7OmkxewZ_PAhAr96todNJhfQ@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Fangrui Song <maskray@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 11, 2021 at 12:31 PM Fangrui Song <maskray@google.com> wrote:
> On 2021-01-11, Bill Wendling wrote:
> >On Mon, Jan 11, 2021 at 12:12 PM Fangrui Song <maskray@google.com> wrote:
> >>
> >> On 2021-01-11, 'Bill Wendling' via Clang Built Linux wrote:
> >> >From: Sami Tolvanen <samitolvanen@google.com>
> >> >
> >> >Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> >> >profile, the kernel is instrumented with PGO counters, a representative
> >> >workload is run, and the raw profile data is collected from
> >> >/sys/kernel/debug/pgo/profraw.
> >> >
> >> >The raw profile data must be processed by clang's "llvm-profdata" tool before
> >> >it can be used during recompilation:
> >> >
> >> >  $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> >> >  $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> >> >
> >> >Multiple raw profiles may be merged during this step.
> >> >
> >> >The data can be used either by the compiler if LTO isn't enabled:
> >> >
> >> >    ... -fprofile-use=vmlinux.profdata ...
> >> >
> >> >or by LLD if LTO is enabled:
> >> >
> >> >    ... -lto-cs-profile-file=vmlinux.profdata ...
> >>
> >> This LLD option does not exist.
> >> LLD does have some `--lto-*` options but the `-lto-*` form is not supported
> >> (it clashes with -l) https://reviews.llvm.org/D79371
> >>
> >That's strange. I've been using that option for years now. :-) Is this
> >a recent change?
>
> The more frequently used options (specifyed by the clang driver) are
> -plugin-opt=... (options implemented by LLVMgold.so).
> `-lto-*` is rare.
>
> >> (There is an earlier -fprofile-instr-generate which does
> >> instrumentation in Clang, but the option does not have broad usage.
> >> It is used more for code coverage, not for optimization.
> >> Noticeably, it does not even implement the Kirchhoff's current law
> >> optimization)
> >>
> >Right. I've been told outside of this email that -fprofile-generate is
> >the prefered flag to use.
> >
> >> -fprofile-use= is used by both regular PGO and context-sensitive PGO (CSPGO).
> >>
> >> clang -flto=thin -fprofile-use= passes -plugin-opt=cs-profile-path= to the linker.
> >> For regular PGO, this option is effectively a no-op (confirmed with CSPGO main developer).
> >>
> >> So I think the "or by LLD if LTO is enabled:" part should be removed.
> >
> >But what if you specify the linking step explicitly? Linux doesn't
> >call "clang" when linking, but "ld.lld".
>
> Regular PGO+LTO does not need -plugin-opt=cs-profile-path=
> CSPGO+LTO needs it.
> Because -fprofile-use= may be used by both, Clang driver adds it.
> CSPGO is relevant in this this patch, so the linker option does not need to be mentioned.

I'm still a bit confused. Are you saying that when clang uses
`-flto=thin -fprofile-use=foo` that the profile file "foo" is embedded
into the bitcode file so that when the linker's run it'll be used?

This is the workflow:

clang ... -fprofile-use=vmlinux.profdata ... -c -o foo.o foo.c
clang ... -fprofile-use=vmlinux.profdata ... -c -o bar.o bar.c
ld.lld ... <output file> foo.o bar.o

Are you saying that we don't need to have
"-plugin-opt=cs-profile-path=vmlinux.profdata" on the "ld.lld ..."
line?

-bw
