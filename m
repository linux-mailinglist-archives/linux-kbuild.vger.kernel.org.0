Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1CDA9C93
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2019 10:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730867AbfIEIHA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Sep 2019 04:07:00 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44223 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfIEIHA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Sep 2019 04:07:00 -0400
Received: by mail-qt1-f196.google.com with SMTP id u40so1708983qth.11;
        Thu, 05 Sep 2019 01:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AIQLXRbVyNYLq+ol22DsuLqLcT0DV8DAEZvd/28G2Y8=;
        b=FpRpchdKvqMSkeJ/5sO8CMY+J41eGcJpVvUO/UgNZuOSlALFlDpcO48+hiau/B5PuP
         08TnU2+DvodbwLUZe8hq6yMOV4HU3+YfKmwWnN2wBiLiOuqAFLMRl21Mn4lKQLBU7HEm
         CHwpvJdX65HhElRoArF/NQ7exDZe45eOFMd4mjM0TzoNaYGuazl1VmDvI3OM7oiDMYgF
         7BNB98KVpSy2wJqdZDjxlmNWIYBQm7f2k4pa/aamWWsJ/ODQghE4AlZjkJ1Xl3xr/tZG
         8rZ35EJuE5Ei+TeMEABSFUTmFmbsr0V+gnAtYVA3LCjnTMg3zw1qktQpUup9NXjun1II
         G4dQ==
X-Gm-Message-State: APjAAAUSPGtBqx0zzdoanSpPnukavMkDOUmgSxY2bdf4JV/UUQP7x38u
        UEWU1hUSdU5PdZfiVSjCd5kMQ+aHeUdb/p1b2lc=
X-Google-Smtp-Source: APXvYqzex4fLXZ/mKlGNUOU0ZQUObckXY2DD8ddIDBJhMKhbD6Zom5YIMIJqBjYLOTSaVc52F7CeU76TxQx7Vq/TSLc=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr2220290qtn.204.1567670819019;
 Thu, 05 Sep 2019 01:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <CAK8P3a0kPFojqAWqXEAcitVMjBA5ABc=rRx=zHMxXat+gCz=gA@mail.gmail.com> <20190904224050.GA82176@archlinux-threadripper>
In-Reply-To: <20190904224050.GA82176@archlinux-threadripper>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 5 Sep 2019 10:06:42 +0200
Message-ID: <CAK8P3a3d-hFFznJAXOjtemV02Zzm_wJW2LefLONRJmobYodmrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] kbuild: refactor scripts/Makefile.extrawarn
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 5, 2019 at 12:40 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> On Wed, Sep 04, 2019 at 11:46:45PM +0200, Arnd Bergmann wrote:
> > On Sat, Aug 31, 2019 at 6:26 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >
> > FWIW, I just found out I missed a bug that clang failed to warn about
> > because of the  -Wno-format. Apparently gcc warns only about type
> > mismatches that result in incompatible calling conventions (e.g.
> > int vs int64_t) but not smaller types (int, short) that get converted to an
> > int anyway. Passing -Wno-format turns both off.
> >
> >       Arnd
>
> Hi Arnd,
>
> This has been fixed in clang 10.0.0 but this areas has not been updated
> as nobody has sent a patch yet:
>
> https://github.com/ClangBuiltLinux/linux/issues/378#issuecomment-524411147

Ok, that's good. I see that on clang-9, the documentation also
mentions that -Wformat control -Wformat-extra-args -Wformat-invalid-specifier
-Wformat-y2k -Wformat-zero-length -Wnonnull and -Wformat-security.
We can probably turn these all on, regardless. The only warning
that produces output here is -Wformat-security, and only in a couple of
files (number of warnings per file from a few hundred randconfig builds):

   384 kernel/trace/ring_buffer_benchmark.c
    176 samples/trace_printk/trace-printk.c
    174 kernel/debug/kdb/kdb_io.c
    102 arch/x86/kernel/e820.c
     80 fs/btrfs/check-integrity.c
     67 fs/reiserfs/prints.c
     63 fs/xfs/xfs_log_recover.c
     54 fs/quota/dquot.c
     53 lib/test_printf.c
     39 sound/core/sound.c
     28 arch/x86/kernel/cpu/mce/core.c
     21 kernel/trace/preemptirq_delay_test.c
     19 sound/core/seq/seq_clientmgr.c
     17 sound/pci/hda/hda_bind.c
     16 sound/usb/mixer_quirks.c
     16 arch/x86/kernel/cpu/mce/amd.c
     15 net/smc/smc_ism.c
     12 kernel/debug/kdb/kdb_main.c
      8 net/netfilter/nf_conntrack_helper.c
      4 kernel/power/suspend_test.c
      3 sound/pci/rme32.c
      3 net/dsa/dsa.c
      2 sound/pci/rme96.c
      1 sound/soc/sof/intel/hda-codec.c
      1 sound/pci/korg1212/korg1212.c

      Arnd
