Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF6D3AC542
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Jun 2021 09:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbhFRHwG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Jun 2021 03:52:06 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:40351 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233325AbhFRHwF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Jun 2021 03:52:05 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBUuV-1m0WVh28sB-00D0mh for <linux-kbuild@vger.kernel.org>; Fri, 18 Jun 2021
 09:49:54 +0200
Received: by mail-wm1-f48.google.com with SMTP id h11-20020a05600c350bb02901b59c28e8b4so8062569wmq.1
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Jun 2021 00:49:54 -0700 (PDT)
X-Gm-Message-State: AOAM533bC/cu9UXROUTJLiUMxrOIoaYiiGk436rputG8xcbER2Pk5rZs
        Y0NnAOm9XvGHhReuRw2GhGFBipiYAsLE5LoWiQU=
X-Google-Smtp-Source: ABdhPJz3v9cDiqw1241MCYC0NmI31nQv0es6eO7tEMyvu+U1gggIST20XxLlc8G+WkS0dz+zs1hXVU0F0DjC+v2x+ec=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr10009330wmb.142.1624002594206;
 Fri, 18 Jun 2021 00:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <202106051816.t4mlM0Df-lkp@intel.com> <CAK8P3a2cXLWD0m6+k4bcfRwOOM9QhusjSFtaV7EMC2wuh1+UEQ@mail.gmail.com>
 <c3e78409-f321-d0dc-67b1-d2a8d3dd24e2@intel.com> <CAK8P3a2pAKiKACZ_kazXEWMffqbgZV_ZeQ27z8PSy3YbLGQPxA@mail.gmail.com>
 <46eaef63-0e65-94fa-2400-39524faf32c6@intel.com>
In-Reply-To: <46eaef63-0e65-94fa-2400-39524faf32c6@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 18 Jun 2021 09:47:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3eGECyc-QSQfNBhgmAQDUcF0Jnqp0H2OdVaZs6wYu+gQ@mail.gmail.com>
Message-ID: <CAK8P3a3eGECyc-QSQfNBhgmAQDUcF0Jnqp0H2OdVaZs6wYu+gQ@mail.gmail.com>
Subject: Re: [linux-next:master 6856/7430] hppa64-linux-ld:
 init/do_mounts.o(.text.unlikely+0x88): cannot reach dump_page
To:     Rong Chen <rong.a.chen@intel.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Helge Deller <deller@gmx.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Philip Li <philip.li@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/Wdgal9XZVbTi4Yp/Irsz/++ImlVL3gHEAMGSFTKEWn4pKHkuzP
 9VJxrcJQGj4obT0VTLhbolhXTOwMzOgWgOGx/xAB+1JqWZl322CaYkv7XgAvov08QswDEIq
 gO/nXhS2K6u/WqEpIwS0wJksrm/hBvZkSMtLonFuR4AB3wbCYbWMBlcv3QvySrjQWDWxvTL
 HRslPHf/qemUs9SA5HeUg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:B6clANMYpKs=:rpHJp4ietKz7GCezi7lVeD
 Sp0gtRICn+wzhdveDhz5mkziVJtilChZOqlKkwkoRoZ9858EAGryvd6ZIVb3FR96goNPkrpE/
 heDsea6rQWr6Vb9ZO0vKCAAiE5aITw56vTSrbSUywNA5l7N8MtcStpJOKo/CRknq2BLmC4RND
 P1cHeQ+D+tb8GaL0xqFZvVctwTXwz7AIQXQiSvR+OeW9loCHpFXtgBtwpagwAwM8CVmZWnius
 3h7UClq52cCLieTMszRzs5oS3KARxW/PE6OtO9WMJhTeZdctOxUmmIxuqhPKk1iwYgewe4kZT
 WtVrVyCoUpxOSewRd0fRq60GEazoc3suTS/XqBul9bgDmjITXieNRnMqPNsAd56oe3JjVyPV2
 MCNkiDV+e65VuqP/ixZ8v5M9DOMNYz8mb1Pr+C+0aba35ciZA+OS5G1hGqh7e6fR8y8ku1Fa2
 A1HK7A2nFpkcFqIM1UdEhD2DCrmJtLQQoTQ6KVPzIrKwbYuwINbXKozKR89Q+uxN3c0XSsF/c
 kDGqVO2ky65KNddk5kvJA0=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 18, 2021 at 4:30 AM Rong Chen <rong.a.chen@intel.com> wrote:
> On 6/7/21 3:19 PM, Arnd Bergmann wrote:
> > On Mon, Jun 7, 2021 at 8:27 AM Rong Chen <rong.a.chen@intel.com> wrote:
> >> On 6/5/21 7:08 PM, Arnd Bergmann wrote:

>
> Thanks for the detailed explanation, and we have asked advice of
> internal developers,
> we'll enable COMPILE_TEST for randconfig, and check the failures if
> COMPILE_TEST=n
> in future.

Awesome, thanks a lot.

> BTW is there any issue that found by randconfig with COMPILE_TEST=n
> should be reported?

It's definitely possible, but I expect that to be rare enough that
investing your
time elsewhere is more helpful. If you do wish to keep testing this
configuration,
this is how I would approach it:

- Since you have a database of known warnings and errors, a good thing to try
  would be analyze it and figure out the types of warning that predominantly
 happen with COMPILE_TEST=n randconfigs, but still happen occasionally
 with COMPILE_TEST=y, as those are more likely real bugs.

- possibly annotate them to find which particular Kconfig option that
gets guarded
  by COMPILE_TEST causes which output. This should be possible because
  there are only a small number of such options.

- Run a small percentage of randconfig builds with COMPILE_TEST=n and the
  cross-check the output against the known classes of diagnostic output
  rather than individual lines.

       Arnd
