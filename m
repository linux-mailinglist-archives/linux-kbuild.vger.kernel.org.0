Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E158120BBB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 23:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgFZVkb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 17:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgFZVkb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 17:40:31 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2783C03E979;
        Fri, 26 Jun 2020 14:40:30 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id e15so8010819edr.2;
        Fri, 26 Jun 2020 14:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4dtaHq7RJqNsgj0DxlS9fhiPuUoM0iQPtx7ZzHAiU4s=;
        b=u9Zydu+IlMh9/LszZ92CggQlY9OQl1g+evFpM5Es9gv9XLcQcc+9KabLPAuenDbKtx
         EXSDWShwfIlbTrrA57mrRRMWbHDUrnzb1X45qD79S1Tm2MZHqDuAERzRF/Oko05LY0ed
         yy0vpHQkgV7P9tPEsYAHbX1VIep+NblU+/b9YtRORhq9nwD+OliGRjs9zS+sYJeg6AD3
         BTSPgED2cZEaoEQ4O4wnTCpZL1fofxzDNNVHnBwoHG1irycB1yN46eUaUJ+y86fTk2sK
         osCLm2sFh/gulrBchGzIQkA+akXv4utKMlVQosr/uo3vX3tk/7qmGwJS3RhK389cZbgX
         5zfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=4dtaHq7RJqNsgj0DxlS9fhiPuUoM0iQPtx7ZzHAiU4s=;
        b=j3d4KmxtbpxywlGnIsleoZKPvlKbdDFTmLa3U6/JuzFdu9zXgUkWthVBqFXUAkH8Ry
         LI+dg/kjHIEwcn0BupgJd7oiD8/WPlKFf1aoemC3civ7lKjQZA7anYSoIiy6cmUZF39w
         Q6QnwL0c7q23tWLdjyc0zrTCBnh01oYOy0BqIgZNxvesP0efmf10j+lkddItmJdC3X4f
         6tPnYfJ4GQAuLRHsQl+lQwRCIkVYqe7C085SglIJsCBRhuavOgIVXftNIWeUTMaC4bQk
         duHxc3g1YgcTjtiJreqYZqwKjgsdYvLm+dNYd0QopBthhBj9yS0Vy25Hd6+VIHxTJ3Yw
         D5Fw==
X-Gm-Message-State: AOAM530cNlYFixCC6F6/a6iRLEFQY8Vp9ThGf3U9tJqxt2so+6XWHaHn
        tkxsPMYUe028IibHcsE3/QQ=
X-Google-Smtp-Source: ABdhPJy++/BzY6fHC4sgfGghocYPBjr++MH93TDtva6eLgfryARtAm541FP5Kvsf3weDh6k7PXqJhg==
X-Received: by 2002:a05:6402:3113:: with SMTP id dc19mr4552096edb.20.1593207629538;
        Fri, 26 Jun 2020 14:40:29 -0700 (PDT)
Received: from dumbo ([2a0b:f4c2::1])
        by smtp.gmail.com with ESMTPSA id mf24sm918386ejb.58.2020.06.26.14.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 14:40:28 -0700 (PDT)
Received: from cavok by dumbo with local (Exim 4.92)
        (envelope-from <cavok@dumbo>)
        id 1jow5C-00070x-PD; Fri, 26 Jun 2020 23:40:26 +0200
Date:   Fri, 26 Jun 2020 23:40:26 +0200
From:   Domenico Andreoli <domenico.andreoli@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
Message-ID: <20200626214026.GB25753@dumbo>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
References: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com>
 <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 26, 2020 at 03:16:58PM +0900, Masahiro Yamada wrote:
> On Fri, Jun 26, 2020 at 5:51 AM Domenico Andreoli
> <domenico.andreoli@linux.com> wrote:
> >
> > From: Domenico Andreoli <domenico.andreoli@linux.com>
> >
> > Make 'make tar-pkg' install dtbs on arm64.
> >
> > Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
> >
> > v2:
> >  - Destination path includes the kernel version, as expected
> >
> > ---
> >  scripts/package/buildtar |    9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > Index: b/scripts/package/buildtar
> > ===================================================================
> > --- a/scripts/package/buildtar
> > +++ b/scripts/package/buildtar
> > @@ -125,6 +125,15 @@ case "${ARCH}" in
> >                 ;;
> >  esac
> >
> > +#
> > +# Install dtbs
> > +#
> > +case "${ARCH}" in
> 
> Instead of checking ${ARCH},
> can you you do
> 
>      if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
> 
> ?

Done in v3.

> 
> This is what the deb package build does:
> https://github.com/masahir0y/linux/blob/v5.7/scripts/package/builddeb#L145
> 
> 
> > +       arm64)
> > +               make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> > +               ;;
> > +esac
> > +
> 
> 
> Or, you can use INSTALL_PATH="${tmpdir}/boot"
> to make it shorter.

This does not work, INSTALL_DTBS_PATH gets somehow defined along the
twisted path to buildtar and therefore needs to be explicitly specified
for the new destination.

> --
> Best Regards
> Masahiro Yamada

Thank you for the review.

Regards,
Domenico

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05
