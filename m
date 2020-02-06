Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B13FA153CCA
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2020 02:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgBFBye (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Feb 2020 20:54:34 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:43219 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbgBFBye (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 20:54:34 -0500
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0161sLWB013371;
        Thu, 6 Feb 2020 10:54:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0161sLWB013371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580954062;
        bh=fYu5qSWDlyPR/anptL+BYhN5tzSdBVO/zoDfzstuN44=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LCJup8AFmkhz46Hw2VBHNYGakgtBiJOJ9C6xSkTww/uotGVBpuRZX6SB/Vv+3wEbF
         FWqGdZICSpwK9VFqSe6CjHV1fr9VEQgng/STdoGkhyn8NSB1L4lY71yuuAHKiBLNDI
         EwqpQQ8Z3CqmrQz4ZUdmwnEuzwopa7j5GV1aM2IGln8kn0dm/TnIMSkxFNTsHl14Yq
         Mn6eOV0KPqZmOMCtqf+rGFt8F2ByLkhTf1s8c1utmdA3lkYOsQb6Dn/J85wZZ7kDxF
         oFKY8TRFCBaNseYhvMX3tYEJpxkqtr6TFsFYrRQRU/uC8V1l8FVKGFYljGne6JDf3J
         0LOB2wiuRojtQ==
X-Nifty-SrcIP: [209.85.221.172]
Received: by mail-vk1-f172.google.com with SMTP id b69so1178176vke.9;
        Wed, 05 Feb 2020 17:54:22 -0800 (PST)
X-Gm-Message-State: APjAAAUDLeihNVPU3WWZ318gaCRVg4dah8hhw/FXrbDMLsEaDKDXxNc0
        rOQpjYvWsM8EEiUpHNUwHMQzDCxhSfiW3UH9Jms=
X-Google-Smtp-Source: APXvYqxHSV/Jx6V/ajGP02WdniwHTc/a78EFjyD/aiY26Z26n4zwgD33O5EwfaOS+YXT3IohqmXYYFasoZB2vdvRmS4=
X-Received: by 2002:a1f:bfc2:: with SMTP id p185mr542468vkf.73.1580954061054;
 Wed, 05 Feb 2020 17:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20200203164708.17478-1-masahiroy@kernel.org> <CAHk-=wiERN+VgxBEOUKMhZFG-yAvVjmDSZXGR22vQBZETQ75yg@mail.gmail.com>
In-Reply-To: <CAHk-=wiERN+VgxBEOUKMhZFG-yAvVjmDSZXGR22vQBZETQ75yg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 6 Feb 2020 10:53:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREEkuZeXXzGbtemZ=A-YX6Jn6WOtD0azBxaiDiOxLp2w@mail.gmail.com>
Message-ID: <CAK7LNAREEkuZeXXzGbtemZ=A-YX6Jn6WOtD0azBxaiDiOxLp2w@mail.gmail.com>
Subject: Re: [PATCH] initramfs: do not show compression mode choice if
 INITRAMFS_SOURCE is empty
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

On Tue, Feb 4, 2020 at 2:35 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Mon, Feb 3, 2020 at 4:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > This commit hides the Kconfig choice in that case. The default cpio
> > is embedded without compression, which was the original behavior.
>
> Btw, is there any way to figure out automatically what the initrd
> compression is (for the external case)?
>
> Because I think it would be lovely to be able to have sane defaults
> for the CONFIG_RD_xyz things.
>
> I'm assuming the answer is "no", simply because it comes from distro
> installs, but I thought I'd check.

I think the answer is no.

For external initrd, it is up to distros,
and we have no way to know the compression type beforehand.

We know it after booting.

init/initramfs.c has the following line:
pr_debug("Detected %s compressed data\n", compress_name);



-- 
Best Regards
Masahiro Yamada
