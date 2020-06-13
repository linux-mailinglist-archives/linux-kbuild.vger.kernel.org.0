Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87101F811B
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2020 07:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgFMFef (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Jun 2020 01:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgFMFef (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jun 2020 01:34:35 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648D0C03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 22:34:35 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id u13so12468898iol.10
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 22:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=3FAi0jj3pS8ivx4w+90eQ33svMjn/6FwpawOBfX1/R0=;
        b=sSdAJ5Nj9v8TH2i1+lS1F/b9in3SwjMv1fU/dLX+RF8NrWS4pggoHJM+apOLH7vkNm
         KL3ebSXHTWqS7JOc0Oe0kAsA4R25BrWDEEAXyxrwMf8np35Wu56DE6CSUAs1SnBis5Ru
         vXkD1uMXMO7L2Hl81T7MIkfef8RR+sKWIZJ1/CmM2nqdFPZhBeCSmijXNndcWlPIgnBO
         X7NchUdJ2uaMNF8gr5c+hEShuJqiC1mKrSP0aivfxu8yk9qdZcfPonwAfas4XUK/TGbf
         C6Uw8I74OGfZhAU31InYIPFYKqcc+d+qbQoMG/puJWGoUfj4MGvInnUwJpGOiHSuJzSQ
         9y2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=3FAi0jj3pS8ivx4w+90eQ33svMjn/6FwpawOBfX1/R0=;
        b=gJeU0v2/veBRsoGLoKU48gIeBe4IRVpzDVemVRTPc54l09G7MGLx2w9K90XaEoWEgF
         jWIdSAh1QHxwmfo700nB+GqZwjcq28/QPFbys4pf7kOflsALWyAjZOB3Y3ZO/4XU1Cjq
         bsRE++Chl2osJbChBLoD5x5gDPRap0kXfts2s/NnYPIL5RFP4cP21CdOvZxLTsK6ohxP
         GmuYlw62Aiaa6qXb6a5yxcpTjjrQa+FdLbhQzmbFUhS+orCtoJWLPCKbtlD+8NVyD5qm
         lh9+YD8IPr/QXzzaIppJBai7Br3bJtVP6M7rmclHJz2DooUDhMDDUjXtW1DKU5KybO51
         0/rA==
X-Gm-Message-State: AOAM530zzVZuYWGZSKW4+76qduf5GDCNYWjSexyY8NQDLIeHRbyMP+tn
        EOkYNCO6rfJuHDkdseQ4bawHtlNuv6S8EtK+pFQ=
X-Google-Smtp-Source: ABdhPJx4rnFuyVkgs4LntgSMA26NFiMNs39KGLHoLNx4Ps4Ms09kz97ZwVPGwa8FQ96V8CuRhXOvX+4yMtI6bMAE4jM=
X-Received: by 2002:a05:6602:2c45:: with SMTP id x5mr16586060iov.80.1592026474094;
 Fri, 12 Jun 2020 22:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
 <CA+icZUUaNujMwrZFbwT1FtksCXFgnM9AohzRoq7xM8jrMN=Q5A@mail.gmail.com> <CAK7LNAQ94yQW4AEvdKgg=Ew2xWYLfh3OjCtxfmr-hJmwWtpiLg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ94yQW4AEvdKgg=Ew2xWYLfh3OjCtxfmr-hJmwWtpiLg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 13 Jun 2020 07:34:22 +0200
Message-ID: <CA+icZUVSHCi2fcwn0-CWkNJVadwKR9W=w1s8xKec2bZST4-3dw@mail.gmail.com>
Subject: Re: LLVM_IAS=1 and DWARF-4
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 13, 2020 at 5:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Jun 13, 2020 at 4:17 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro,
> >
> > when I build with LLVM_IAS=1 I want to force DWARF-4.
> >
> > CONFIG_DEBUG_INFO_DWARF4=y sets "DEBUG_CFLAGS += -gdwarf-4".
> >
> > I tried:
> >
> > [ Makefile ]
> >
> > ifdef CONFIG_DEBUG_INFO
> > ifdef CONFIG_DEBUG_INFO_SPLIT
> > DEBUG_CFLAGS    += -gsplit-dwarf
> > else
> > DEBUG_CFLAGS    += -g
> > endif
> > ifndef LLVM_IAS
> > KBUILD_AFLAGS    += -Wa,-gdwarf-2
> > endif
> > endif
> > ifdef CONFIG_DEBUG_INFO_DWARF4
> > DEBUG_CFLAGS    += -gdwarf-4
> > ifdef LLVM_IAS
> > KBUILD_AFLAGS    += -Wa,-gdwarf-4
> > endif
> > endif
> >
> > If I set LLVM_IAS=1 ---> CONFIG_DEBUG_INFO_DWARF4=y shall be set automatically.
> >
> > Dunno if "KBUILD_AFLAGS += -Wa,-gdwarf-4" is a good idea.
> >
> > "KBUILD_AFLAGS += -Wa,-gdwarf-2" is known to break with LLVM_IAS=1.
> >
> > I am lost in ifdef-eries...
> >
> > Any cool ideas?
>
>
> Sorry, I am not familiar enough with dwarf
> to understand these flags...
>

Hi Masahiro,

Thanks for your precious time and to be so honest.

Regards,
- Sedat -
