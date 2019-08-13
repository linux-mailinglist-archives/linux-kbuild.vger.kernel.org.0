Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9BA8BCDD
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 17:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbfHMPRN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 11:17:13 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33834 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729580AbfHMPRJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:17:09 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so45201004pgc.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V7Vc4h0uj52QiwgSeM0HPukUmZe8eSiGizdlDL0MsZc=;
        b=P58NEDX0lnVGsZU02FJGgu1WCftMbcsmAGAcXiE7Xb3cVlW6g9TV9PSHnrWt3vN+Dt
         diFNATsZYO0/dQY4zcCvxfHVeAM1Dr+hofEa35Ujsw80oCfT7a2jVP1Snuvw0nnqduYi
         w0ZT+GGbOKqN62X0k3yhwSn+srvND/prdhLP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V7Vc4h0uj52QiwgSeM0HPukUmZe8eSiGizdlDL0MsZc=;
        b=FJywOOa4d6hSxvNwqdoUBprpSI7quE9s+2g266uXtc/wclf42Yr7WNiDjNEdtQHniD
         ZsvIIHGlvzRK5Ze2G+3RLrZ/IGhIF/8hiuyCb3DMMFu2o1k711xMWz0hueqJY9QVjoRM
         RGM+uT5nAb+uaYyMb4RyMHcm4ljZ19KOoaQnYSkUfv1bjjb3Wj8mCXpRVKmjSbDF5Z94
         VnwFy5KgHNvQH9u4d9rTPR2jJg8kGcPb6Q33Atwd6hsMvqpB33tp6sdxS7ZRcUkdiRyl
         CAQtcCwJlZb1UCvUCWCbtpEx7x0MgWXcGbBU5xfdoEkVt5t8Ev2MiuWJcS8jR7OL++2h
         sxxg==
X-Gm-Message-State: APjAAAXOAthOR9bhzuubEUDhMeT3J0jUHzWy67PbVfKjCYeNTNU+gurT
        rlsbW6Yxcg/isl1YLfIZvg9SDA==
X-Google-Smtp-Source: APXvYqzdtns2c4giPlmpu+B6bbvmjTOe7WdwtgrBU07H2NoFsZCpTEecyrlJ+ul2Mk/0Vd0UPiLCVg==
X-Received: by 2002:a62:f24b:: with SMTP id y11mr15994459pfl.0.1565709428876;
        Tue, 13 Aug 2019 08:17:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o32sm1850120pje.9.2019.08.13.08.17.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 08:17:07 -0700 (PDT)
Date:   Tue, 13 Aug 2019 08:17:06 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] kbuild: Parameterize kallsyms generation and correct
 reporting
Message-ID: <201908130815.33BA0DE322@keescook>
References: <201908121448.4D023D7@keescook>
 <CAK7LNASSkD3SzS5do1REjTe8n7RqUKsLGc2XwWJ7PKJ-z18Oig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASSkD3SzS5do1REjTe8n7RqUKsLGc2XwWJ7PKJ-z18Oig@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 14, 2019 at 12:00:05AM +0900, Masahiro Yamada wrote:
> On Tue, Aug 13, 2019 at 6:49 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > When kallsyms generation happens, temporary vmlinux outputs are linked
> > but the quiet make output doesn't report it, giving the impression that
> > the prior command is taking longer than expected.
> >
> > Instead, report the KSYM step before the temporary linking. While at it,
> > this consolidates the repeated "kallsyms generation step" into a single
> > function and removes the existing copy/pasting.
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> 
> Hmm, I did not notice this.

He either until I was getting link errors from MODINFO :)

> How about showing the link stage explicitly?
> (Is it too verbose?)
> 
>   MODINFO modules.builtin.modinfo
>   LD      .tmp_vmlinux1
>   KSYMS   .tmp_kallsyms1.o
>   LD      .tmp_vmlinux2
>   KSYMS   .tmp_kallsyms2.o
>   LD      vmlinux
>   SORTEX  vmlinux

I'm fine with this -- it's probably the right thing to do since getting
vmlinux link errors fro KSYMS probably doesn't make sense either. ;)

> If this verbosity is OK,
> you can move 'info LD  ${2}' into vmlinux_link()

Done.

> Anyway, I like the clean-ups in this patch.
> 
> This is just my personal preference, but
> may I ask two cosmetic changes?
> 
> [1] Could you move kallsyms_step()
>     between  kallsyms() and mksysmap() ?
>     I want to collect function definitions
>     to the top of the script.
> 
> [2] Could you shorten 'kallsymso_previous'
>     to 'kallsymso_prev' ?

Sounds good. v2 sent.

-- 
Kees Cook
