Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2B0215D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 11:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbfEQJB7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 05:01:59 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35467 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727338AbfEQJB7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 05:01:59 -0400
Received: by mail-lf1-f68.google.com with SMTP id c17so4793556lfi.2;
        Fri, 17 May 2019 02:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zXhhv+Sa/ff/KB9qp4Lp8NFmvMMZIPlLkNgYtudU3OA=;
        b=u3toRtS6LS+5LI/R0e0emyIDs6FSGEnXwh4s9f2Y1uUPJJbMz4V6tqvyoZO5PmHd2n
         NE97is0XlAEICUPRoPADGaj5/ZabVwYT7W7KwO7z1THoRVkBLmCX49GVc31HDLDq7hWh
         Soqd/4PuAdkwezqZG2UjPA2sCYmUHmdC71A3UmEQYqfoxihfSOBR36gycDdW+Inhvgw8
         IPmcGwLz279rKCREW6vGHcICm40vRRLR+wuiGVNwwp5ay/PQKr6F7B1szZh5RMQPEpqe
         XAgcRApsfANNrQ5WsFGGiP6yytOiDr9UhPeQXqzFBAJfXsJXSnsFvb7XmdEJdTg8belT
         cP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXhhv+Sa/ff/KB9qp4Lp8NFmvMMZIPlLkNgYtudU3OA=;
        b=V3k8RY9AAJygvzqpq8bsaPtk2waudYweBhSiyZLXEWeLf3g8nXFT4ti55t/mBOWb7K
         N20p9R+9zRMhS+jSQgO0sM/dB2D3YioaFX9CUfiTeQG16QNHGL0tURoe6OESDsYB6tK+
         O3KhF3z9ycoAEYd+miVoBcUzVYSkz0Z4FW5lJoKpNturkP81RNrzVh3qHOvHZL8Tdbyp
         nCExXdtKlyaWSy3Qc47fQ76+uqsUrQniX/h5nOWVwWCs5yR4OSrNgevgA4jHhG5J/H6w
         BYvP7anxVvRJKDpMb0NE/UWmwM/yopFsWcSMIlMzWs84mabx/6rTbcz+h2MZ8SA6TzUI
         wQ1g==
X-Gm-Message-State: APjAAAV57OHx4V686TVlB4e7lqSBHYLCkEJzXhhbaMvS4IxKAzpb9hVE
        9yFDHQiuyyLRUlxevmIt9Sq7eA0sbUbs4M5ms5s=
X-Google-Smtp-Source: APXvYqwuh8ziBDC6KfJBa90QRUmgFZWmN01Cl4v8ywMPuqHE4hphG9uOeeWrQXxwzmcYDEuXSyZ5bjV6bJbKjLZEqrw=
X-Received: by 2002:a19:5f56:: with SMTP id a22mr22358969lfj.157.1558083716813;
 Fri, 17 May 2019 02:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble> <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com> <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com> <20190517085126.GA3249@kroah.com>
In-Reply-To: <20190517085126.GA3249@kroah.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 17 May 2019 11:01:45 +0200
Message-ID: <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ivan Babrou <ivan@cloudflare.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
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

On Fri, May 17, 2019 at 10:51 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 17, 2019 at 10:35:29AM +0200, Miguel Ojeda wrote:
> > On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > Right; if there is anything you can reproduce on linus.git I'll happily
> > > have a look. If it doesn't reproduce all you have to do is find the
> > > patches that make it work and ask Greg.
> >
> > Just to clarify: Linus' master is clean of these issues with GCC 9.1.1.
>
> Great!  Care to find the patches that did that work and send me the git
> commit ids so that I can queue them up?  I don't have gcc9 here yet on
> my systems, so I can not test for this.

I am unsure about the perf and the objtools parts (Peter/Josh?), but
about the -Wmissing-attributes I cleaned, they were these:

a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
init/cleanup_module")
c0d9782f5b6d ("Compiler Attributes: add support for __copy (gcc >= 9)")
ff98e20ef208 ("lib/crc32.c: mark crc32_le_base/__crc32c_le_base
aliases as __pure")

Cheers,
Miguel
