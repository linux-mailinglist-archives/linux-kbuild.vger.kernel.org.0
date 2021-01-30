Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA3D309126
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Jan 2021 02:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233093AbhA3BCI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Jan 2021 20:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbhA3A72 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jan 2021 19:59:28 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89918C061756
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 16:58:30 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id o16so7782364pgg.5
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 16:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vY5qfUxdXCT/eobTl+36hSbsQCTFZU3e/5axsUhR+gY=;
        b=F9ABbjx9K8dh+DHwtMVe1pNmo1PfZnrNKt7BOp/DfjurjXFLxFKYJibjtIR0SgqvgQ
         Eh3ncYjaLS1o8k0Y3M8FzZe6kVZR8zbkj9mqIGl4iP0Mi9zAG02//q2gbf0FVFDP1Kb0
         JnSB5OiM1EXI14+qYkx6D0zO05icm48bzeRqO5DObQnYOcWCBJsqvHl9CeRQk25KWkze
         vXJiDqsh8vscqg96wHrDVLHq04dDmO7u4tVMLge+j5pybhGyOlDeyzJ4l4TGb3xO+94q
         BOZaBaya8hYeNjjd8JlZIs/21v2uTWMxuRnplN8PZNyFX2iylIn5GwDPyDZamNq6lW4K
         2YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vY5qfUxdXCT/eobTl+36hSbsQCTFZU3e/5axsUhR+gY=;
        b=Q8L7q8IkS/choB8SchS0mS03C2A+a4IydDTYW4pJokmS/ECGRabPh7J/goQjIiAxI+
         BQmc1J3t9ygkjhfN50mOBjVGoPIXLujv6dVfwN5CWMdJ5Y2MtxbGlH4bVh5ERkhXY3Qp
         KW2YoyIQp6m1MTVX+d6smEe/VhA+ddi1bRx0VaMaaCoxY/VXewXAh1XKM/JECcESDeht
         5ZDPeylDCnN6XclJFGh24lK4elLcVzumCRYz7DJKsf6YwLFVovYSnX/xyj/uxs1j4bWF
         wOHfF6WcFi0AbvJsk3xHIv1hmwyzv4yetxvIaPBVMKJ/0jdB6GjZMxi+MumRbUGB6cTS
         THpg==
X-Gm-Message-State: AOAM532jRQFb4WddYfzmJlALjHM7CM4wKVGBPrMxI3aQv7cJiHKb00Du
        oy4RzGj5UOyOuvqn2k1QTUM05d0m6DrwTKDOoRkOrA==
X-Google-Smtp-Source: ABdhPJxMeluNQVHvcV1ZnNWC6PT/4wuUBMB0oK9z5Rwk+bZ1VF2lhvL8TNsNrEdGkTUaqwtI5qp7n7/UeDworva0+U8=
X-Received: by 2002:a65:628a:: with SMTP id f10mr6909626pgv.380.1611968309986;
 Fri, 29 Jan 2021 16:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20210129194318.2125748-1-ndesaulniers@google.com>
 <CA+icZUXpn_VKePTpnEhcpuSxPkuQTSKYfsVeMbxU9-rBp1ZJXw@mail.gmail.com> <CAKwvOdniSiaBkGOO32ZuGCv=1SBwaqdRsHUo31n+O+g0ek5P_Q@mail.gmail.com>
In-Reply-To: <CAKwvOdniSiaBkGOO32ZuGCv=1SBwaqdRsHUo31n+O+g0ek5P_Q@mail.gmail.com>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Fri, 29 Jan 2021 16:58:18 -0800
Message-ID: <CAFP8O3KcyPH-sjwoTet-W8_L5vfbiXmkWgxwyPJFY=_JFxvsTA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Kbuild: DWARF v5 support
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Caroline Tice <cmtice@google.com>,
        Nick Clifton <nickc@redhat.com>, Yonghong Song <yhs@fb.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 29, 2021 at 4:46 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Fri, Jan 29, 2021 at 4:08 PM Sedat Dilek <sedat.dilek@gmail.com> wrote=
:
> >
> > On Fri, Jan 29, 2021 at 8:43 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > DWARF v5 is the latest standard of the DWARF debug info format.
> > >
> > > DWARF5 wins significantly in terms of size and especially so when mix=
ed
> > > with compression (CONFIG_DEBUG_INFO_COMPRESSED).
> > >
> > > Link: http://www.dwarfstd.org/doc/DWARF5.pdf
> > >
> > > Patch 1 is a cleanup that lays the ground work and isn't DWARF
> > > v5 specific.
> > > Patch 2 implements Kconfig and Kbuild support for DWARFv5.
> > >
> >
> > When you will do a v7...
> >
> > Can you look also at places where we have hardcoded DWARF-2 handling...
>
> Ah, sorry, I just saw this now, after sending v7.  Can we wait to
> purge DWARF v2 until after we have DWARF v5?
>
> In fact, if they are orthogonal like I suspect, why don't you send
> some patches and I will help you test them?
> --
> Thanks,
> ~Nick Desaulniers

Basically the distinction is just between DWARF v2 .debug_line and
DWARF v5 .debug_line .
(-gdwarf-4 adds an extra maximum_operations_per_instruction (constant
1) compared with -gdwarf-2 but that can mostly be ignored).

Refinement among -gdwarf-[234] just clarifies things and is not going
to affect debugging experience in any case.
So I agree with Nick that it can be done separately.
Note: such clarification can make things a bit ugly because binutils
before 2020 does not recognize -gdwarf-[345].



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
