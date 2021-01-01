Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4812E85D2
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Jan 2021 23:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727284AbhAAWcJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Jan 2021 17:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727147AbhAAWcJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jan 2021 17:32:09 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED778C061573;
        Fri,  1 Jan 2021 14:31:28 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id w17so20107011ilj.8;
        Fri, 01 Jan 2021 14:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=jztGCgEhZcyHZnfVt3Ftdbo2JqWYXrffl5TxWTjnd6E=;
        b=k/duNVksiGSVSP6ioL4e95+kgOS3C+j+XttQ9eUQ23IU8PzN0JwmRQ1/uBHfHiPKyM
         A97Tu0nEBMXB1qhy+YtPD5E+bl8YRNpAQ5yaR39W9oaNElavDcfxdcV6Gh0ctOz7teOz
         EomtdaP+5CX3znpDnFzJQzZRf0cUCvgD0jhBKxGTvj1jiwbGUVH1IAtoWtw+8RvERX4y
         9qP3Ag3Pg3UpEG8Dxj1DVqkrGTDV05/BOK04Rocj+MDGmRGG+aPAo1cY4BFahY40T4g5
         iv9UwYdHFzaiXAFb1pxSAniIemJm24P2dsp6E51PFV/Zxp7a18I+SSYREjItVbNLK4Mv
         yUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=jztGCgEhZcyHZnfVt3Ftdbo2JqWYXrffl5TxWTjnd6E=;
        b=nFJxCLRUrCEb4sVR3e/xaPakRw+XXq263W67ZL0Cgkl3NTj1eIltFd6hvJht9nPbA6
         gFXznmvbBnWVCjEIiVkIAJ/X+3tc2BLXbX3/gRjzwT3kDu7t4OzieSoE3vZjIfBaPIWa
         lJyKTrFVq44zLSySCCwgqPTQhm2C0/eVWoOcZDXz0YcL3T8kdd9u/6O3ZNktDT58lc76
         LHP+IYbNWLTxhRUhYcKo6ty007Pbb5vdS9JIGis0tG2lyPvngyHl9rKUAEX4zmPl1Ojw
         gXEXob6PaIaff8R3pdvY5UxYEuSSQuS4+X5FBT/DS1++uSN87ZUCQFxYvVQZ0YEz04hs
         wzZg==
X-Gm-Message-State: AOAM530A4Joqtb02SOxeh/jE6qeQhxfgksnrvF66+0v8263BXnvGs8tP
        s8n6hWzTaAAOHkcuaWbHjJ1lOawfVsx3EsJCOmA=
X-Google-Smtp-Source: ABdhPJzDxwN33E6yBsB3JmSWq5AQLevbKew7W7ks3jPowciJ/BSDL+U/7gm5yjty7EJZPIy9Esyrg1azP+r9ViaVxYU=
X-Received: by 2002:a92:d1cd:: with SMTP id u13mr44320065ilg.186.1609540288350;
 Fri, 01 Jan 2021 14:31:28 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
 <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
 <20210101161435.GA344@duo.ucw.cz> <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
In-Reply-To: <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 1 Jan 2021 23:31:17 +0100
Message-ID: <CA+icZUUdHz1mqTy4AD7-ja6Y8w9bXB-Cc_5g3OeUSRu4zRxcUA@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 1, 2021 at 7:55 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Fri, Jan 1, 2021 at 5:14 PM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Hi!
> > > >
> > > > > $ dpkg -L kmod | grep bin | grep depmod
> > > > > /sbin/depmod
> > > > >
> > > > > $ which depmod
> > > > > [ empty ]
> > > > >
> > > > > $ echo $PATH
> > > > > /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
> > >
> > > Ok, I think this is a broken setup that has a separate /sbin but does
> > > not have it in the PATH.
> >
> > That's how it is supposed to work, AFAICT. It is so on Debian here,
> > for example.
> >
> > /sbin is for management commands, why would I have it in PATH when
> > running as normal user?
> >
>
> I am here on Debian/testing AMD64 and waiting for feedback [2].
>
> For now I have applied the diff from [1].
>
> - Sedat -
>
> [1] https://marc.info/?l=linux-kbuild&m=160919738006768&w=2
> [2] https://marc.info/?l=linux-kernel&m=160919729606750&w=2

Fixed upstream, see "depmod: handle the case of /sbin/depmod without
/sbin in PATH".

- Sedat -

[1] https://git.kernel.org/linus/cedd1862be7e666be87ec824dabc6a2b05618f36
