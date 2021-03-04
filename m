Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DFB32D2DC
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 13:29:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240508AbhCDM2d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 07:28:33 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:21218 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240540AbhCDM2O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 07:28:14 -0500
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 124CRL6O022357;
        Thu, 4 Mar 2021 21:27:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 124CRL6O022357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614860842;
        bh=K1n8abg19tbJt4HLdCItAkYqr2CXKH4BHG6ea09tldY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=id7zM4g1tb7as+yaQD1bXa1YI/8i3Jnp+q1nZoBhyC1TWZSytotVDAY6vioem5XMl
         FJEGn+q1HriH2uWetSR6ld2pUrRw1RmetI1+SNZgFyJZofNad160OVqqh8sWtOIR3S
         In9D62w2vuayvNC1vRfBwXqbJHcPgtN9vXh4/kvbibm9q/aGSylcJAiRDGmWs2Armp
         SHmMerbwtSBx/fKI5/71XUxYvWT7s4cASNwsegEra1h8xdMOPfiCkNLQZCOmpkaMMZ
         iPmUiycn0/QOYXCfuaNIRZj24zIeGTLPPPCVypqerp/IGNVAUQlmVu1qrTL6bJlP5f
         ISnfX7AnvOzbg==
X-Nifty-SrcIP: [209.85.215.173]
Received: by mail-pg1-f173.google.com with SMTP id t25so18811673pga.2;
        Thu, 04 Mar 2021 04:27:22 -0800 (PST)
X-Gm-Message-State: AOAM533OqQmp1AJWjUXi7Om8Mp5MERBTbLIOOiIz8V+Ww671mFvCjDh5
        HakpTJNzMLgsLgH0iosu0ZRyQZycL3kkEfm63nA=
X-Google-Smtp-Source: ABdhPJydaxOVDIRSR3zkg2rR/wPg+9722gh5UJfR9yVEU8tak6XmKRI1oL2RgrEk/19rvxp6xN8MaXsrnOggaoeZe28=
X-Received: by 2002:a65:41c6:: with SMTP id b6mr3423612pgq.7.1614860841381;
 Thu, 04 Mar 2021 04:27:21 -0800 (PST)
MIME-Version: 1.0
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble> <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble>
In-Reply-To: <20210303191516.6ksxmng4pis7ue4p@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 4 Mar 2021 21:26:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5h2s5ZDx3xOiE2upyGXtPf44f5A76YYUeM1Tk93QXNg@mail.gmail.com>
Message-ID: <CAK7LNAS5h2s5ZDx3xOiE2upyGXtPf44f5A76YYUeM1Tk93QXNg@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Frank Eigler <fche@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 4:15 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Mar 04, 2021 at 03:49:35AM +0900, Masahiro Yamada wrote:
> > > This problem is becoming more prevalent.  We will need to fix it one way
> > > or another, if we want to support distro adoption of these GCC
> > > plugin-based features.
> > >
> > > Frank suggested a possibly better idea: always rebuild the plugins when
> > > the GCC version changes.
> >
> >
> > That is just another form of the previous patch,
> > which was already rejected.
> >
> >
> > - That is a hack just for external modules
> > - Our consensus is, use the same version for the kernel and external modules
> >
> >
> >
> > I use Ubuntu, and I do not see such a problem.
> > (I have never seen it on Debian either, except sid.)
> >
> > I see Fedora providing GCC whose version is different
> > from the one used for building the kernel.
> > That is a problem on the distribution side.
>
> I don't understand.  Are you suggesting that a distro should always
> release GCC and kernel updates simultaneously?

Well, as Greg says, given that GCC is less frequently upgraded
than the kernel, this should not be a big deal.

https://lore.kernel.org/lkml/YBBML2eB%2FIXcTvcn@kroah.com/



> How is this problem specific to Fedora?  Please be specific about what
> Ubuntu and Debian do, which Fedora doesn't do.

I do not know what they exactly do. Looking at only the result,
Ubuntu and Debian do proper engineering, which Fedora doesn't.




>
> Adding Linus, who indicated in another thread that we shouldn't force
> exact GCC versions because there's no technical reason to do so.
>
> --
> Josh
>


-- 
Best Regards
Masahiro Yamada
