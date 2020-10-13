Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFEE028D365
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 20:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727454AbgJMSDe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 14:03:34 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:53208 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgJMSDe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 14:03:34 -0400
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 09DI38lq032478;
        Wed, 14 Oct 2020 03:03:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 09DI38lq032478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602612189;
        bh=ZdabOmTJd4TzuNZj+GhBAWjpxu8eB+TtqLnoZkWEOvA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uD5HVMxgGO4iZvaNvk/wXJgAWJN+JL8+f4t9xnxaXjgLwubwBb0vNdrqzFsxSI5Tp
         mw/ajF4v0eCejHShgKnI4CKZ6V6so8rpZP/s8NJffh6C7P45FiDlbIOOEbZstRuEJx
         Wym+dFqtzsOE64byhNgcEZ421jwPgpoWnLMQVWfAWWM7lm6tOt6Q2/Kb8W++OnG6cI
         bczwuVU/4/GE+5S5LtDSmioxslSf6HdLEQt3wdzgQbvO0kmqvKb9MifXX9Oihwr+Fz
         mi3rSH8B0ULZqozqL38qpRQd2JzRg4CMy1oySqRwwoc6VIdR9w2ila+n2Rs1FIAsPD
         oYZfo7j4Tfn+w==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id f19so241702pfj.11;
        Tue, 13 Oct 2020 11:03:08 -0700 (PDT)
X-Gm-Message-State: AOAM5306Yg6MDyliuHADINA//6rf7HgDrjE3UkesDGLgNw1StjBprdsI
        l4H4r6jAoAAodOb7qq/jxv36KLlKUIbKsJE9BiA=
X-Google-Smtp-Source: ABdhPJz9b0OWNsXKxkGpr+N8kc5HAWmcGlPA3yZZdhkMKnRbdsfcW0A53EomwMrN1fGDuOP1Keg/5EfQ9vdMQ3DHQw4=
X-Received: by 2002:a63:778f:: with SMTP id s137mr599296pgc.7.1602612187843;
 Tue, 13 Oct 2020 11:03:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201001075723.24246-1-lukas.bulwahn@gmail.com> <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
In-Reply-To: <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 14 Oct 2020 03:02:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+W9h95sUZFwRHiyiDbUxn9b7KN5P1zKOAdR2emxp7=g@mail.gmail.com>
Message-ID: <CAK7LNAR+W9h95sUZFwRHiyiDbUxn9b7KN5P1zKOAdR2emxp7=g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: doc: describe proper script invocation
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 13, 2020 at 11:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Oct 1, 2020 at 4:57 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > During an investigation to fix up the execute bits of scripts in the kernel
> > repository, Andrew Morton and Kees Cook pointed out that the execute bit
> > should not matter, and that build scripts cannot rely on that. Kees could
> > not point to any documentation, though.
> >
> > Masahiro Yamada explained the convention of setting execute bits to make it
> > easier for manual script invocation.
> >
> > Provide some basic documentation how the build shall invoke scripts, such
> > that the execute bits do not matter, and acknowledge that execute bits
> > are useful nonetheless.
> >
> > This serves as reference for further clean-up patches in the future.
> >
> > Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> > Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> > Link: https://lore.kernel.org/linux-kbuild/CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com/
> >
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Suggested-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
>
> Applied to linux-kbuild.
> Thanks.
>

No, not really.

I will re-think if this is the right thing to do.




--
Best Regards
Masahiro Yamada
