Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3348720C44C
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jun 2020 23:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgF0VVV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jun 2020 17:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbgF0VVU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 17:21:20 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3146DC061794;
        Sat, 27 Jun 2020 14:21:20 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p20so12537107ejd.13;
        Sat, 27 Jun 2020 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AwcUoZ2DlMXyTZtvJ0Lmbr63pHLhP215A09SSXnXClI=;
        b=Mx6RoFeR/Ck4U9qvb9ZPLp7WvLGriqe/9DN5rovoGUbLUQOCutq9hovGaB3cYgGzo/
         N1SJiv74qzjFsFdAHhfgfslnAIfWzbNJVWyU6FFPA8+8+2gdvlhwelZ99BrikGEr9VJz
         12Pv0azYwsBIXFCSSWHAZqgNVV7StTzYp1q+hjdfkl7kHO9wnbareh6PLxDODt8J51he
         SoWp5N6XKYYPFYRYawWJMndL6bDu5V9/dYnXh8v2IMa+/kjjiqY/9bjdjLbbSklIFxZx
         PYyl/dnp4zuQAByHjU/5DkHP5ad9LlP9Sj7FMxZlIa6uuuztP83rdC7jRPDf3ZdJP/If
         w/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=AwcUoZ2DlMXyTZtvJ0Lmbr63pHLhP215A09SSXnXClI=;
        b=bwUAaipk97CfF+oKbTtGKspn6Ty4wXRJLE64xtJ7zyMNN9zqZGCsRtWJvOozQmd/nQ
         6hfQy8wrhykyNF7Tvq5vgpoCigv7IoTCX4ESt0Nvg90zmceffqyaOXV7GNha1b5btm4T
         bQw0dzekHoFqOYUJnhXnO0kd6b+/4V1H8PxjkIHofXgaoBjTsT/KyPLPQ83+2GlHuKLT
         WhQwyQXyOX8il5U2FGiwNmVF/GJdSyEHlLWQqeYFpN5wU3bnE3jjrf3SgdPrLCu/OrrJ
         Z/idyoLRm70SmU6Zw/wC28lqPGzluQmME+xhvmYXvQ6NREEzWSs9X1eCfh+rD2ZQLGAz
         sM7w==
X-Gm-Message-State: AOAM530OTo9qEimlRRXy5QZSq0lMhwgbJsVysxV+/e8o5tRJ1hgUVDk2
        EYzOebT0GeABhPVr5+q39kA=
X-Google-Smtp-Source: ABdhPJyBEaOyZduzpuzMh64TuWPVwioUuPg13DbrOMG5X/S1cObi/uy/zz9lPn3OS3BFLZHz8w0/Qw==
X-Received: by 2002:a17:906:469a:: with SMTP id a26mr7601258ejr.198.1593292876950;
        Sat, 27 Jun 2020 14:21:16 -0700 (PDT)
Received: from dumbo (tor-exit-4.zbau.f3netze.de. [2a0b:f4c0:16c:4::1])
        by smtp.gmail.com with ESMTPSA id js3sm21345263ejb.65.2020.06.27.14.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2020 14:21:15 -0700 (PDT)
Received: from cavok by dumbo with local (Exim 4.92)
        (envelope-from <cavok@dumbo>)
        id 1jpIG8-00054j-Lw; Sat, 27 Jun 2020 23:21:12 +0200
Date:   Sat, 27 Jun 2020 23:21:12 +0200
From:   Domenico Andreoli <domenico.andreoli@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
Message-ID: <20200627212112.GA18721@dumbo>
References: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
 <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
 <20200626214026.GB25753@dumbo>
 <CAK7LNASRL6jaaxZreFK+iDmFHuw6QLSS0n08gZNkyhcsNunAnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASRL6jaaxZreFK+iDmFHuw6QLSS0n08gZNkyhcsNunAnw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 27, 2020 at 09:02:52PM +0900, Masahiro Yamada wrote:
> On Sat, Jun 27, 2020 at 6:40 AM Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> > On Fri, Jun 26, 2020 at 03:16:58PM +0900, Masahiro Yamada wrote:
> > > On Fri, Jun 26, 2020 at 5:51 AM Domenico Andreoli <domenico.andreoli@linux.com> wrote:

[...]

> > > >
> > > > +       arm64)
> > > > +               make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> > > > +               ;;
> > > > +esac
> > > > +
> > >
> > >
> > > Or, you can use INSTALL_PATH="${tmpdir}/boot"
> > > to make it shorter.
> >
> > This does not work, INSTALL_DTBS_PATH gets somehow defined along the
> > twisted path to buildtar and therefore needs to be explicitly specified
> > for the new destination.
> 
> It works.
> 
> See line 1002 of the top Makefile
> 
> export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)

Exactly. INSTALL_DTBS_PATH is _exported_ in the top Makefile.


This is what it seems to happen, in the order:

1. outer 'make dir-pkg'
   INSTALL_DTBS_PATH is exported with some content

2. control arrives to buildtar
   INSTALL_DTBS_PATH is there as environment variable

3. inner 'make INSTALL_PATH=${tmpdir}/boot dtbs_install'
   INSTALL_DTBS_PATH is already set, therefore it is not modified


To make the inner invocation work, I see these two options:

1. 'make INSTALL_DTBS_PATH= INSTALL_PATH=${tmpdir}/boot dtb_install' (untested)

2. 'make INSTALL_DTBS_PATH=${tmpdir}/boot/dtbs/${KERNELRELEASE} dtbs_install'

I chose 2 but I can switch to 1, if you prefer. No problem.


Regards,
Domenico

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
