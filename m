Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00CD677D2D
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2019 04:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfG1CAu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jul 2019 22:00:50 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34809 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfG1CAu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jul 2019 22:00:50 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6S20gq1021926;
        Sun, 28 Jul 2019 11:00:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6S20gq1021926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564279243;
        bh=1StgZ7toBadRIFusd3MMhpL7syLCIpeHXWYmnW8RdcA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FlAZoaL6ZWIuIbIkKQ9luAcDLcuqrVZr87ltddsU4GU4WkU6tIVYRJymvTChQFXe0
         yNE+/DUbvktwqPMTuSCRtO8HCuZAUgfbkY5gIAo1uodsYzmD9H6MnorJd1Y+kmFN65
         GEBwXpUn8PJTZXfXbuEl1JJh512fWBNkGF5bvmQUq93nE76N6Fq9x1Pj19gHWvSYdc
         QJwiRbuOq71GMgWy9HGMRkidzW8FNrszCiIF/X7/DVqwEdNcRGkwRG0JvGcHz+ohir
         OZpC0bXumXaH7Pj0nnFco5bXl+cMdI74bbGQkes8nN092zSgx5LGRwVMQqHNrekapF
         ipC1lUadPDKiQ==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id y16so38531013vsc.3;
        Sat, 27 Jul 2019 19:00:43 -0700 (PDT)
X-Gm-Message-State: APjAAAVaKhXZpqaWPv/GHhZnV1pdj/JfGqjqbuuqzfS71WL9OuCmiff4
        kY6e6JXg4PdV1j/d2WNyjAqITfGMWxGJAkttjNw=
X-Google-Smtp-Source: APXvYqylAly0hHSvMnGSADD0tFRGSyBQFHfEEYB6I5sCu1zbsbJZKWjKBNmSqr9fCs8jVdzGgCoiyBEKcNqb4isRRRU=
X-Received: by 2002:a67:f495:: with SMTP id o21mr63702471vsn.54.1564279242289;
 Sat, 27 Jul 2019 19:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <CAK7LNATg1m_pzsZqGDUOUZHzv6jn2K0My8vFWbOVdUSTMQ05Ug@mail.gmail.com>
 <5232680b-5303-3d63-db51-de65eea76e3a@linux.com>
In-Reply-To: <5232680b-5303-3d63-db51-de65eea76e3a@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 28 Jul 2019 11:00:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5AM_fU36_9vc9wVJhxbzD5Xc72-mqBw6M3k_-9KZjjQ@mail.gmail.com>
Message-ID: <CAK7LNAR5AM_fU36_9vc9wVJhxbzD5Xc72-mqBw6M3k_-9KZjjQ@mail.gmail.com>
Subject: Re: [RFC PATCH] modpost: check for static EXPORT_SYMBOL* functions
To:     Denis Efremov <efremov@linux.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Sun, Jul 28, 2019 at 4:14 AM Denis Efremov <efremov@linux.com> wrote:
>
> Hi.
>
> > Could you drop the solved ones from the list?
>
> Yes, of course. Do you want me to remove all symbols fixed with patches
> or only those are in-tree now?
>
> Should it be like this:
>   1. "torture_onoff_cleanup" [kernel/torture]
>      "torture_shuffle_cleanup" [kernel/torture]
>      Patch: https://lkml.org/lkml/2019/7/4/411 (accepted)
>   2. "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress]
>      Patch: https://lkml.org/lkml/2019/7/8/842
>   3. "drm_client_close" [drivers/gpu/drm/drm]
>      Patch: https://lkml.org/lkml/2019/7/3/758 (accepted)
>   4. "ahci_em_messages" [drivers/ata/libahci]
>      Patch: https://lkml.org/lkml/2019/7/10/550 (reviewed)
>   5. "ftrace_set_clr_event" [vmlinux]
>      Patch: https://lkml.org/lkml/2019/7/4/609 (reviewed)
>   6. "rmi_2d_sensor_set_input_params" [drivers/input/rmi4/rmi_core]
>      Patch: https://lkml.org/lkml/2019/7/8/999 (accepted)
>   10. "empty_zero_page" [vmlinux]
>   11. "phys_base" [vmlinux]
>   12. "hypercall_page" [vmlinux]
>
> Or like this:
>   1. "empty_zero_page" [vmlinux]
>   2. "phys_base" [vmlinux]
>   3. "hypercall_page" [vmlinux]
>
> Well, I could remove this list at all. It seems like the following list
> with existing commits is enough to show the problem of static exported
> functions.

Yeah, I agree.
Showing some existing commits is enough.



> I will resend the patch shortly after.
>
> Regards,
> Denis



-- 
Best Regards
Masahiro Yamada
