Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6C41F80B4
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2020 05:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgFMD2V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jun 2020 23:28:21 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35118 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgFMD2V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 23:28:21 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 05D3Rq2J028614
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2020 12:27:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 05D3Rq2J028614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592018873;
        bh=NrT9WKW8ICRri6H0i31++ApFyuMeorHDfuUEz7imeH8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BOR1BdX6weLFi80KyW1WDnk4PVwD3UWaQDBlUaT9qTwnOXJy4d8iN1+sG0QtCiwl3
         d0eSFn+/eN6BDDFbBF2NrmDgyc1rOW2dRBbVl1efBzp5VBi61ArO2MUgRKl67bPDaA
         oJ36DWGgG5DmoS+KwKfwfqxv7Aa2Ffc6okA+pgT5XPUdMruwnhEzAffdsVOeJloB/s
         Tj7GaUAw2cL0mVX7rKdLXhp1Pb1QZI+F376sCQBSHnFA/p3UejHFEwLBeTFLoV+pYl
         CpM+1BSodkFv58UvuRFs7PibIC4hTdCMgm0O7wtdtJeuq7p6S/4uzEZXw29erseyMl
         bfT3h9ZSgmLjw==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id g44so3878322uae.12
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 20:27:52 -0700 (PDT)
X-Gm-Message-State: AOAM530aMde38Dtq1zEkbDVPfMA6BLv/lNJp7tqueUIL5iY2rqnOxlOg
        CkE+CfgFaIgDzmUJufPt6YxHmSLn0s41lG1HSHA=
X-Google-Smtp-Source: ABdhPJywx0FGSccpAcmDy1E80QSGVesuRil7hSquBqirNmrzQ3sVZMoCENxV9R1RAFMs7Ycse0ix73EjnA4asvLo+bM=
X-Received: by 2002:ab0:13f3:: with SMTP id n48mr262174uae.109.1592018871893;
 Fri, 12 Jun 2020 20:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com> <CA+icZUUaNujMwrZFbwT1FtksCXFgnM9AohzRoq7xM8jrMN=Q5A@mail.gmail.com>
In-Reply-To: <CA+icZUUaNujMwrZFbwT1FtksCXFgnM9AohzRoq7xM8jrMN=Q5A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 13 Jun 2020 12:27:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ94yQW4AEvdKgg=Ew2xWYLfh3OjCtxfmr-hJmwWtpiLg@mail.gmail.com>
Message-ID: <CAK7LNAQ94yQW4AEvdKgg=Ew2xWYLfh3OjCtxfmr-hJmwWtpiLg@mail.gmail.com>
Subject: Re: LLVM_IAS=1 and DWARF-4
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 13, 2020 at 4:17 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Masahiro,
>
> when I build with LLVM_IAS=1 I want to force DWARF-4.
>
> CONFIG_DEBUG_INFO_DWARF4=y sets "DEBUG_CFLAGS += -gdwarf-4".
>
> I tried:
>
> [ Makefile ]
>
> ifdef CONFIG_DEBUG_INFO
> ifdef CONFIG_DEBUG_INFO_SPLIT
> DEBUG_CFLAGS    += -gsplit-dwarf
> else
> DEBUG_CFLAGS    += -g
> endif
> ifndef LLVM_IAS
> KBUILD_AFLAGS    += -Wa,-gdwarf-2
> endif
> endif
> ifdef CONFIG_DEBUG_INFO_DWARF4
> DEBUG_CFLAGS    += -gdwarf-4
> ifdef LLVM_IAS
> KBUILD_AFLAGS    += -Wa,-gdwarf-4
> endif
> endif
>
> If I set LLVM_IAS=1 ---> CONFIG_DEBUG_INFO_DWARF4=y shall be set automatically.
>
> Dunno if "KBUILD_AFLAGS += -Wa,-gdwarf-4" is a good idea.
>
> "KBUILD_AFLAGS += -Wa,-gdwarf-2" is known to break with LLVM_IAS=1.
>
> I am lost in ifdef-eries...
>
> Any cool ideas?


Sorry, I am not familiar enough with dwarf
to understand these flags...


>
> Regards,
> - Sedat -



-- 
Best Regards
Masahiro Yamada
