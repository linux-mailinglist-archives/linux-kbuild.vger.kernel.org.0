Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C044920C94A
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 19:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgF1RqN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 13:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgF1RqM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 13:46:12 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78795C03E979;
        Sun, 28 Jun 2020 10:46:12 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id z17so10969387edr.9;
        Sun, 28 Jun 2020 10:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R4NV7ZXUyGxQT+NbkPwPy+JARllPu6O11kPu6TTALnk=;
        b=JEbamC6/5d34z41avnGchuvb/He/2xsnrG6xzmvifbDHhoDRIEfWrSjJ/pc0tC+r0q
         x/cq1S3heyeIphZOUZ/sOiSFULZFO0eq18Ih7oKyAHykE/qZjsHE87PSIiHREVy9QxPo
         V3nCty1jmZbgwrcpDjbLMUFX7UHMFFFq0xKCXy+5Pf3AMAnnsxNpxyt8St6aTpDI0pMY
         MFQTi8qIhCZDwV47GjDiVYanPFzt57gaazsexxRIBr2H+7ixrUuqnbKaK+TQKWiOQcc9
         xGbCfiZaZ/6WRShQCaZ9PXiCeI9LbeD4cWDZbi7qIwyA2XXWuy2oSwZQ2XosYBXRvIUZ
         XBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=R4NV7ZXUyGxQT+NbkPwPy+JARllPu6O11kPu6TTALnk=;
        b=dW2X8Hxv63S91zHSfqV7Bjw54TNDHg1W7OeQo9cX2rBS3HTuxdODjJKe8d6QhXill2
         R0EKoBoWHGPMU6IrMvP2tjNNPsJOroMRrvJq7GUVyJvBdGkGmyc0suj2TdJwgH6OshHR
         DPxHWtoRcTVEqmzUDMqTgiKbtwln0ZLd0MzB4x0u/AhEq2l3Eq3rbYVWoaIk7Wc8wHC6
         Cn0lF+brssOgkZx563akO8r9zkiKgs+qFmrB3c8R7zxrxeoIobMka0285SH0t+aZkSFi
         xF6V4FupbsbkgQ36LvYtZlDzElq+kszADVgzBT/uNdImYrJJDH362VNY0Sxm6/l58kiu
         H41g==
X-Gm-Message-State: AOAM532GWJMyppGRF786QFPk4/sbM8asO+UYl1IjSuwZvU79MxP/rtdh
        vTD4RB7EZS5P6F9QaTGPXVeWhMr+8sc=
X-Google-Smtp-Source: ABdhPJzAodcx4cnaOgTt2nCuM+DLcNI6Yju9NJx5mlCpxdlC74zw/l+TDTqJUVM7eUV3e0oJgnxULQ==
X-Received: by 2002:a50:d78f:: with SMTP id w15mr14258228edi.245.1593366371211;
        Sun, 28 Jun 2020 10:46:11 -0700 (PDT)
Received: from dumbo (tor-exit-16.zbau.f3netze.de. [2a0b:f4c0:16c:16::1])
        by smtp.gmail.com with ESMTPSA id v11sm12707549eja.113.2020.06.28.10.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 10:46:10 -0700 (PDT)
Received: from cavok by dumbo with local (Exim 4.92)
        (envelope-from <cavok@dumbo>)
        id 1jpbNW-0005Ls-2V; Sun, 28 Jun 2020 19:46:06 +0200
Date:   Sun, 28 Jun 2020 19:46:06 +0200
From:   Domenico Andreoli <domenico.andreoli@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
Message-ID: <20200628174606.GA19923@dumbo>
References: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
 <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
 <20200626214026.GB25753@dumbo>
 <CAK7LNASRL6jaaxZreFK+iDmFHuw6QLSS0n08gZNkyhcsNunAnw@mail.gmail.com>
 <20200627212112.GA18721@dumbo>
 <CAK7LNARhsyo0OoS+fibCn3tt4J7_iwfsSn8TvzjxZ4K_bwreUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARhsyo0OoS+fibCn3tt4J7_iwfsSn8TvzjxZ4K_bwreUA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 28, 2020 at 12:46:28PM +0900, Masahiro Yamada wrote:
> On Sun, Jun 28, 2020 at 6:21 AM Domenico Andreoli
> <domenico.andreoli@linux.com> wrote:
> >
> > On Sat, Jun 27, 2020 at 09:02:52PM +0900, Masahiro Yamada wrote:
> > > On Sat, Jun 27, 2020 at 6:40 AM Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> > > > On Fri, Jun 26, 2020 at 03:16:58PM +0900, Masahiro Yamada wrote:
> > > > > On Fri, Jun 26, 2020 at 5:51 AM Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> >
> > [...]
> >
> > > > > >
> > > > > > +       arm64)
> > > > > > +               make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> > > > > > +               ;;
> > > > > > +esac
> > > > > > +
> > > > >
> > > > >
> > > > > Or, you can use INSTALL_PATH="${tmpdir}/boot"
> > > > > to make it shorter.
> > > >
> > > > This does not work, INSTALL_DTBS_PATH gets somehow defined along the
> > > > twisted path to buildtar and therefore needs to be explicitly specified
> > > > for the new destination.
> > >
> > > It works.
> > >
> > > See line 1002 of the top Makefile
> > >
> > > export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)
> >
> > Exactly. INSTALL_DTBS_PATH is _exported_ in the top Makefile.
> >
> >
> > This is what it seems to happen, in the order:
> >
> > 1. outer 'make dir-pkg'
> >    INSTALL_DTBS_PATH is exported with some content
> >
> > 2. control arrives to buildtar
> >    INSTALL_DTBS_PATH is there as environment variable
> >
> > 3. inner 'make INSTALL_PATH=${tmpdir}/boot dtbs_install'
> >    INSTALL_DTBS_PATH is already set, therefore it is not modified
> 
> Sorry, I was wrong.
> Your analysis is definitely right.
> 
> 
> I will apply v4.
> 
> Thanks.
> 

Thanks to you!

Domenico

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
