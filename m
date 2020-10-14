Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511AF28DB0E
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Oct 2020 10:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgJNITl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Oct 2020 04:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728922AbgJNITd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Oct 2020 04:19:33 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C90C041E73;
        Tue, 13 Oct 2020 21:43:15 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j136so1162742wmj.2;
        Tue, 13 Oct 2020 21:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=yAoSXHRwpGz7nBgURGl4h1iZHKvaWjYO9+dk8dtTzEM=;
        b=Y91XoDmgSV0T8y7s38jad1TN0OqdQ/W7/i8P2ncbuMKEZD2rOkSZiUQTJlsuYKHtPU
         EAZV7qv1rUsvdBWUoA886/Y95M9vZa/oxqlJFhM8q/1rrvT6J84jeJlhZi8NQCojqDrj
         Tes5NzvdJSB+DVYiNzB7Z+JvVuOHpaiNru8rAGagKUdC0j9MPOurw7mLoHNDCbFsPoZS
         n583hEDRzu2p7Kqe01AlohE9ec6ZDpWlycrOa7cs+BNDFjntEoiVKIrhkwJA/95FI/mV
         FSdQmGYWryAjzzPk7+g9a6lDfDynMecp9R4n0hxGRZiNmkM4V9grSiY5O0gZsORtJ/5Y
         3abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=yAoSXHRwpGz7nBgURGl4h1iZHKvaWjYO9+dk8dtTzEM=;
        b=JOHhwdfZKe4yD68bJyQjxY1BrYQE1wRftfXe8xqtgIenqTaOY8P4GQhtxNJ2213hOx
         fD+oN3qVtAq71HlsTo/SSr3bVLtG6EKsROmhtrRgm10x9+rHzWBwCEtARl/T2SJKzjTb
         TVDO6uIxoT9bHFvUOjeYa2623nfyFopsNSrlV4OFe2FTmlQnB1GpDzM8mcYZSEDMOFsG
         FJMdqGXeClm45nrcn8OcDxzyEX37aohLgT35SsGCdXRpHcPbsm8Ht9sAYGWcIax2jW5v
         P/NFtkz7TrMExm8Gq7gQMHL2t4CPkr2S/Agaku02sj/eBOxi15KmsGN/DhBtqSE74ZKZ
         +EFw==
X-Gm-Message-State: AOAM532UQZiR34uXFHvqv+IdJYqNTrWuPGrD9kwZqhm8vBZwb0i5xfaJ
        UbiOnJKPRe5pVwy73pOOnz0=
X-Google-Smtp-Source: ABdhPJxLj7cfYT+/1rNY1VWyuk/FeNLUT9YgTom+iIidb6iYPJvpU8+DuMBSQu3AZwhlP+GOUgdJYw==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr1410127wmh.158.1602650594160;
        Tue, 13 Oct 2020 21:43:14 -0700 (PDT)
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
        by smtp.gmail.com with ESMTPSA id h206sm1713989wmf.47.2020.10.13.21.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 21:43:13 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Wed, 14 Oct 2020 06:43:06 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] kbuild: doc: describe proper script invocation
In-Reply-To: <CAK7LNAR+W9h95sUZFwRHiyiDbUxn9b7KN5P1zKOAdR2emxp7=g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010140636020.6186@felia>
References: <20201001075723.24246-1-lukas.bulwahn@gmail.com> <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com> <CAK7LNAR+W9h95sUZFwRHiyiDbUxn9b7KN5P1zKOAdR2emxp7=g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Wed, 14 Oct 2020, Masahiro Yamada wrote:

> On Tue, Oct 13, 2020 at 11:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Oct 1, 2020 at 4:57 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > > During an investigation to fix up the execute bits of scripts in the kernel
> > > repository, Andrew Morton and Kees Cook pointed out that the execute bit
> > > should not matter, and that build scripts cannot rely on that. Kees could
> > > not point to any documentation, though.
> > >
> > > Masahiro Yamada explained the convention of setting execute bits to make it
> > > easier for manual script invocation.
> > >
> > > Provide some basic documentation how the build shall invoke scripts, such
> > > that the execute bits do not matter, and acknowledge that execute bits
> > > are useful nonetheless.
> > >
> > > This serves as reference for further clean-up patches in the future.
> > >
> > > Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> > > Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> > > Link: https://lore.kernel.org/linux-kbuild/CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com/
> > >
> > > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > > Suggested-by: Kees Cook <keescook@chromium.org>
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >
> >
> > Applied to linux-kbuild.
> > Thanks.
> >
> 
> No, not really.
> 
> I will re-think if this is the right thing to do.
> 
>

Masahiro-san, Andrew Morton has already picked this patch in his branch; 
so, if we do not shout loudly, it will be merged. And we can follow up 
with a solid improvement for rc2.

I am happy to rework the documentation and help guide and review the 
follow-up patches that have been sent by Ujjwal.

Please provide some specific feedback what is wrong and why; I think the 
basic request not to rely on the execute bit from Andrew and Kees is still 
valid. Maybe we just need to be more specific on the rules to follow in 
Makefiles and have multiple examples for the different cases to consider.

Thanks,

Lukas
