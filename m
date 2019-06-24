Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D009750923
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2019 12:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbfFXKmr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Jun 2019 06:42:47 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:56254 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbfFXKmq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Jun 2019 06:42:46 -0400
Received: by mail-wm1-f54.google.com with SMTP id a15so12276223wmj.5
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Jun 2019 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q883E1TSKpw+8Z8/vLIrUQrvnvTA4vR/WV9GJinwpYU=;
        b=Xaw+C38e/CezApMz3QojV7i85dRjg5/G7ci9YV2sEkBDlquzKE3G7aYXfiODpMzR2n
         jENoHuyYNVLtcpuh4hVtnOmAG5Qe+hup+jI3lwgM1rGSyuS//JYi60L24r7bvaTHMz4N
         ZJFx1wysOiBWC5RsWFsGsQBdhf2yqXzJvTcv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q883E1TSKpw+8Z8/vLIrUQrvnvTA4vR/WV9GJinwpYU=;
        b=HMUsLFmWT+7YZml9oAfLU9XZj9vlR4K4yae1rpHGk5FZBbGKVALvt8GItk0KBFx+gv
         FWHxw/egcHTl0BYm0HJl479vxSVZ5nePGlCcxELu2PXtwYeDRMcKxFm60PwBd0+0isXB
         t9RjBNkVBnhrVdtLb3kjLnx2xLhS5hN3XhILpVoXHAtHOB+K9TxMJ1wOrMxnyP3h2KO6
         mNAhfBHRtm7gVckoGGRd52XMdoabg7WjaMKbJHJZ9/dvNJAC2uY3r/VALrHei90o8cYA
         fosB/hZ0SXUw0p+07oqdOoch0/EFth2ToC8ncX4a2uy0oqVGXuWoynUDVQEaUzppUF+r
         2VPA==
X-Gm-Message-State: APjAAAW7SFhsJfmM3+N7U9jeNXSCfekbMiO1jHKxtsF8XEC9f5u8mhYN
        Ho8x6S4PIQpyH/9dXdStaI/lFDY5z9apnEkFI8XDJA==
X-Google-Smtp-Source: APXvYqxT5XqU+T41zf4YRFiyF2TLqKZmo1od90mkk6zd77tdB3Ro93HS/rncirTRa/tO3JkD2WeJgwfrpiSW7rAL7qo=
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr15845237wmc.77.1561372964887;
 Mon, 24 Jun 2019 03:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com> <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org> <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org> <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
 <20190610151407.GS21245@kernel.org> <20190610152542.GA4132@kroah.com> <20190610191417.GW21245@kernel.org>
In-Reply-To: <20190610191417.GW21245@kernel.org>
From:   Ignat Korchagin <ignat@cloudflare.com>
Date:   Mon, 24 Jun 2019 11:42:34 +0100
Message-ID: <CALrw=nFcp-+C7ceTFj=R=aG0Z5OpRRVXFoUxUoh=CjcfW79-+g@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Ivan Babrou <ivan@cloudflare.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Greg,

> > For us it seems applying the following 4 mainline patches makes 4.19.x
> > branch perf compile with GCC-9:
> >
> > 4d0f16d059ddb91424480d88473f7392f24aebdc: perf ui helpline: Use
> > strlcpy() as a shorter form of strncpy() + explicit set nul
> > b6313899f4ed2e76b8375cf8069556f5b94fbff0: perf help: Remove needless
> > use of strncpy()
> > 5192bde7d98c99f2cd80225649e3c2e7493722f7: perf header: Fix unchecked
> > usage of strncpy()
> > 97acec7df172cd1e450f81f5e293c0aa145a2797: perf data: Fix 'strncat may
> > truncate' build failure with recent gcc
> >
> > I also checked that 4.19.49 compiles fine with GCC 9, although with a
> > lot of warnings, mostly from objtool, like "warning: objtool:
> > sock_register()+0xd: sibling call from callable instruction with
> > modified stack frame". But it's a start.
> >
> > Can we apply the above-mentioned patches, please?

> I'll look into these after the next round of kernels are released.  I

Did you by any chance forget to queue these patches? :) (the build is
still broken for GCC 9.1)

> guess I'll go find a distro that has gcc9 on it to actually test
> things...

BTW, Arch already has GCC 9.1 package, so no need to compile your own
anymore for testing:
https://www.archlinux.org/packages/core/x86_64/gcc/

Regards,
Ignat
