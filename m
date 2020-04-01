Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C183819A90C
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 12:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgDAKAf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 06:00:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34482 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727627AbgDAKAf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 06:00:35 -0400
Received: by mail-wm1-f65.google.com with SMTP id c195so3101664wme.1;
        Wed, 01 Apr 2020 03:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=VmRm3oXm0ZsfcD5pHRu8dORso7GRuFbKemZGwhJZ3mg=;
        b=sdr8z+g6zb/yzMTnL+GD4R49HG1WbT+cnMmqP2SA+LDzot4nhVXtqbrotKTLFuJ0UP
         J8UwNjZqDVpXluSarDMuFbpHrj9iMaadChZ2cOai2Mn582jaI9JqD1fYeIoeNWiCM16z
         7fNs/AqvO7YJjPkRgdEC0rqG9mZUEY99AN2YyucbWm6uT/iVCfJkeLEFm78pBSNmqEFU
         LeV1rl43zuAVS+oO8/jLBKbPtThBfCzJNIPLZdjK3xqX/TLJQloptJVLYuRs2FLBiI1I
         lIM2o3n/6gYzOPbRCu90Yb95O0EPQxTXY5WpbdbPgrhNH4a8x0MwZlQ7IyS0r5lPiFCj
         smCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=VmRm3oXm0ZsfcD5pHRu8dORso7GRuFbKemZGwhJZ3mg=;
        b=lxpOVhf+qop5Ce1Qua8jhnk3lpdZOiLWuUnY6AI2Dzd9ny7EcHkwJD0Ars3DS9Sz5C
         GBSjMTHiAKsGmKpeFNn63RNpYpF/E+DmcuCv2KvQI2W6E0DDccF+4wfC7zuLjF5Pi5hP
         EbR8ac27vehdY2wqEFIzhcag5OMCo3ZYX4LFvoGfkMRL3PG3+0eH+K0hKo+fYA/bcqDf
         neoR31TQykBYhDAmzUOL9HEXuxnQuMA+WHiMuEcss8p4/d9uoYhHWsuXyBSILsv6kdFg
         YBkqz/fvbd8SJgKD/MXoWLs/2ZP7fIPtLDSCWX+WkQ8Q2oJfcYhsP4M1+XRzCDp8uoDM
         UHXw==
X-Gm-Message-State: AGi0PuY2i1prS2zjTo61SIN91LwzvflBLy0XVhr4ARWivZ0JOBVmGVbo
        DEOWYSO9qM7JYOMqnqS0hwIrpOyWU6+549l1INs=
X-Google-Smtp-Source: APiQypKclNINS76hUttgDW/hApv0JqcrQoSocfVi7rT3jY0DpMxb6iTfwOWHlSA3xqsqdePfLh0i/TJHiM+pcRnNWpg=
X-Received: by 2002:a05:600c:2202:: with SMTP id z2mr3324034wml.64.1585735232912;
 Wed, 01 Apr 2020 03:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com> <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
 <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com> <20200401072725.GB27371@angband.pl>
In-Reply-To: <20200401072725.GB27371@angband.pl>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 1 Apr 2020 12:00:35 +0200
Message-ID: <CA+icZUXufL22Fp7ge9uzZ7K5K2MfX-C+HJcDcr06KKNYQOBXoA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and initramfs
To:     Adam Borowski <kilobyte@angband.pl>
Cc:     Nick Terrell <terrelln@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 1, 2020 at 9:27 AM Adam Borowski <kilobyte@angband.pl> wrote:
>
> On Wed, Apr 01, 2020 at 02:52:06AM +0000, Nick Terrell wrote:
> > > On Mar 31, 2020, at 8:11 AM, Sedat Dilek <sedat.dilek@gmail.com> wrot=
e:
> > > On Tue, Mar 31, 2020 at 6:15 AM Nick Terrell <terrelln@fb.com> wrote:

[...]

> > I don=E2=80=99t expect any distro specific changes are required to cont=
inue operating
> > as-is. However, if a distro wanted to switch to a zstd compressed initr=
amfs
> > they would need to update their toolchain to compress with zstd.
>
> Just setting COMPRESS=3Dzstd is enough -- it'll say:
> W: Unknown compression command zstd
> but will do everything right.
>
> Also, just minutes ago someone filed https://bugs.debian.org/955469
>

Hi Adam,

thanks for your feedback and the pointer to the Debian bug #955469.

With "distro-specific changes" I meant the ones to userland - for
Debian - namely initramfs-tools{,-core} packages.
For generating, inspecting and unpacking an initramfs the Debian way
you need a bit more.

In the Bug-BR a patch called "enable_zstd.patch" is attached - seems
to have all what I mentioned in [1].

Regards,
- Sedat -

[1] LINK: https://lore.kernel.org/lkml/CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1x=
YhwkA5k3B3U-5vQ@mail.gmail.com/
