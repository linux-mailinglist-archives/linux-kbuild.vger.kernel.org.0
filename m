Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01D1217437
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 18:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgGGQkP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 12:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbgGGQkP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 12:40:15 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2165CC061755;
        Tue,  7 Jul 2020 09:40:15 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id q74so20297039iod.1;
        Tue, 07 Jul 2020 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H8DnR4JFzX5FV9pn+i8vQlvDk8lKjNy3TDBekUaLnWY=;
        b=aYP0Ke6qrQ322SvoUeWMbxXuQwIfaQYSWPYQ0EEQdhWHZzzhUk81ZtykXd1GPbIreV
         0SMPevR10bkEmZK+AeTCShRw2vYRageGssEA6u+UD7O6hTz0lXZwIKuLAqIF2QLVykiK
         ckEvJtdzd4XNd/cLFNQHsFVg01CGlLuU0HIE3fI/Qnc8qJhC9Tg0/9XPgkY+8ywjRk7g
         q2qpjgoozl8uiJaBhZbOpsTYGC/jSV/sstuKDcF0drSEE1VPspCUwJEFjETGz670hpNS
         1OqzcFi7kXVkeRzkJDHoC5amynzSgx9Ab0akIdBNt8HI18zw1z67yFIMkDp6rxhC+i1x
         VvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H8DnR4JFzX5FV9pn+i8vQlvDk8lKjNy3TDBekUaLnWY=;
        b=scHIOS+ilJpkxaRHQalCACOJ5ci6lxnoKAtfuumClJYqY3b6jDnC+COEU3Yt49Qu/v
         +YGr76iOnE0hxiv0aOXorVkOhx9OYBna1c7Zoho/6QrzBKt/G4C3OZE/o1vqxviVSH1T
         nUhwdqJaUfgrVAG9en7EEHkP6JMdxzGOG9z72N8fiBHnya070Xq2hDTh95KmsN49/zUJ
         4hJOjVmxAvXRL/z3Hc3haD/voPfGmnKSyDkigESTMMdHQn1Ej907pr8IF2b0E5iTEY0F
         wCgqQJW3yEWjjXynjoA+eSflhZsM2CmryZM7L07YM11txrNbVqqouRfnEnMmneN8hLK1
         +yuQ==
X-Gm-Message-State: AOAM530umJQmyVGCBcMzPfq9/CN6RWZzm5cug9AkWiEIb5BmHg873aKt
        227KJNzLgDI128jV1kaMHubACiU0LUMs7gHRbSk=
X-Google-Smtp-Source: ABdhPJxS1vGz+PqkpyRPiJAYu2ILWZ1meFxgUxuxpzj3ckU7ixSEUINJAyPaap+N85KD5I0wVyvFLVNUne67L+rigsE=
X-Received: by 2002:a02:cd06:: with SMTP id g6mr29485216jaq.37.1594140014469;
 Tue, 07 Jul 2020 09:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-5-nickrterrell@gmail.com> <CADYdroOfCsGsjid9aSOLoRf9gycc1iLD9JndH8WF+Rg+a5Gu-g@mail.gmail.com>
 <3C253838-35BF-4B0D-AE19-E81B08B3A377@fb.com>
In-Reply-To: <3C253838-35BF-4B0D-AE19-E81B08B3A377@fb.com>
From:   Norbert Lange <nolange79@gmail.com>
Date:   Tue, 7 Jul 2020 18:40:03 +0200
Message-ID: <CADYdroOfF=oD+BrbS2pCf-DgEz=XhzkMXZzhXC+UrALcHPyogA@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
To:     Nick Terrell <terrelln@fb.com>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Am Di., 7. Juli 2020 um 17:32 Uhr schrieb Nick Terrell <terrelln@fb.com>:
>
>
>
> > On Jul 7, 2020, at 3:19 AM, Norbert Lange <nolange79@gmail.com> wrote:
> >
> > Thanks for the respin.
> >
> > Am Di., 7. Juli 2020 um 05:51 Uhr schrieb Nick Terrell <nickrterrell@gm=
ail.com>:
> >>
> >> From: Nick Terrell <terrelln@fb.com>
> >>
> >> * Adds the zstd cmd to scripts/Makefile.lib
> >> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
> >>
> >> Architecture specific support is still needed for decompression.
> >>
> >> Reviewed-by: Kees Cook <keescook@chromium.org>
> >> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> >> Signed-off-by: Nick Terrell <terrelln@fb.com>
> >> ---
> >> init/Kconfig         | 15 ++++++++++++++-
> >> scripts/Makefile.lib | 15 +++++++++++++++
> >> 2 files changed, 29 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/init/Kconfig b/init/Kconfig
> >> index 0498af567f70..8d99f0c5e240 100644
> >> --- a/init/Kconfig
> >> +++ b/init/Kconfig
> >> @@ -191,13 +191,16 @@ config HAVE_KERNEL_LZO
> >> config HAVE_KERNEL_LZ4
> >>        bool
> >>
> >> +config HAVE_KERNEL_ZSTD
> >> +       bool
> >> +
> >> config HAVE_KERNEL_UNCOMPRESSED
> >>        bool
> >>
> >> choice
> >>        prompt "Kernel compression mode"
> >>        default KERNEL_GZIP
> >> -       depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNE=
L_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERN=
EL_UNCOMPRESSED
> >> +       depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNE=
L_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERN=
EL_ZSTD || HAVE_KERNEL_UNCOMPRESSED
> >>        help
> >>          The linux kernel is a kind of self-extracting executable.
> >>          Several compression algorithms are available, which differ
> >> @@ -276,6 +279,16 @@ config KERNEL_LZ4
> >>          is about 8% bigger than LZO. But the decompression speed is
> >>          faster than LZO.
> >>
> >> +config KERNEL_ZSTD
> >> +       bool "ZSTD"
> >> +       depends on HAVE_KERNEL_ZSTD
> >> +       help
> >> +         ZSTD is a compression algorithm targeting intermediate compr=
ession
> >> +         with fast decompression speed. It will compress better than =
GZIP and
> >> +         decompress around the same speed as LZO, but slower than LZ4=
. You
> >> +         will need at least 192 KB RAM or more for booting. The zstd =
command
> >> +         line tools is required for compression.
> >> +
> >> config KERNEL_UNCOMPRESSED
> >>        bool "None"
> >>        depends on HAVE_KERNEL_UNCOMPRESSED
> >> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> >> index 916b2f7f7098..d960f8815f87 100644
> >> --- a/scripts/Makefile.lib
> >> +++ b/scripts/Makefile.lib
> >> @@ -413,6 +413,21 @@ quiet_cmd_xzkern =3D XZKERN  $@
> >> quiet_cmd_xzmisc =3D XZMISC  $@
> >>       cmd_xzmisc =3D cat $(real-prereqs) | $(XZ) --check=3Dcrc32 --lzm=
a2=3Ddict=3D1MiB > $@
> >>
> >> +# ZSTD
> >> +# -------------------------------------------------------------------=
--------
> >> +# Appends the uncompressed size of the data using size_append. The .z=
st
> >> +# format has the size information available at the beginning of the f=
ile too,
> >> +# but it's in a more complex format and it's good to avoid changing t=
he part
> >> +# of the boot code that reads the uncompressed size.
> >> +# Note that the bytes added by size_append will make the zstd tool th=
ink that
> >> +# the file is corrupt. This is expected.
> >> +
> >> +quiet_cmd_zstd =3D ZSTD    $@
> >> +cmd_zstd =3D (cat $(filter-out FORCE,$^) | \
> >> +       zstd -19 && \
> >> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> >> +       (rm -f $@ ; false)
> >
> > Is there any reason not to use '--ultra -22' ?
> > As far as I understand the other patches, the decompression should be
> > able to handle it,
> > and in terms of time required for a kernel build the difference is
> > insignificant.
>
> For kernel compression there isn=E2=80=99t a strong reason not to use `--=
ultra -22`.
> It may slow down decompression a small amount, because the difference
> is that it has a 128 MB window size instead of a 8 MB window size.
>
> However, that probably isn=E2=80=99t want you want for initramfs compress=
ion,
> which can optionally now use this same command. We could go like xz
> and have both cmd_zstdmisc and cmd_zstdkern, and only use `-22` for the
> kernel version.

Realistically, that's only relevant for an compressed internal rd with an
uncompressed kernel (means not really realistic, I haven't seen such a
thing in ages)
Means time is not the issue, but memory for a way to small
decompression window is.

>
> It also looks like there were a few minor changes made to the other
> compress cmds in this file while these patches have been out, so I will a=
pply
> them to zstd as well.
>
> I=E2=80=99ll submit a new version with these changes today.
>
> > And would it be better to run zstd on a prepared file instead of
> > stream enconding?
> > windowsize would be adjusted to min(windowsize, filesize) for one.
>
> Yeah, that would be helpful for initramfs compression when the file is
> smaller than the window size, since it would limit the memory necessary
> For decompression. But, it wouldn=E2=80=99t help kernel compression.

It would also allow you to unconditionally use -22, as the drawback
for the internal rd would be removed.

>
> For that we=E2=80=99d have to create a temporary file, because it looks l=
ike these
> commands potentially accept more than one input file. Do you know the
> standard practice for temporary files in the build system?

Nope, from peeking around (grep -r '\bmv\b' | grep Make),
I'd use something like this (completely untested, sorry)

cmd_zstd =3D ( trap "rm -f $(@D)/.tmp_$(@F)" 0 && \
       cat $(filter-out FORCE,$^) > $(@D)/.tmp_$(@F) && \
       zstd --ultra -22 -c $(@D)/.tmp_$(@F)  && \
        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
       (rm -f $@ ; false)

On the other hand I would hate if this tinkering further delays upstreaming=
.

>
> Thanks for the review,
> Nick

Thanks for the patch ;)
Norbert
