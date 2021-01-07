Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB8D2ECAEF
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 08:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbhAGH15 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 02:27:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726154AbhAGH15 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 02:27:57 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE6EC0612F6
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jan 2021 23:27:16 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id q7so2343331pgm.5
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jan 2021 23:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vTGhjHR1vsg+Mr43HN4cyueuEjB0/vHkOdTIvdJMuEI=;
        b=N33IJmbkbnKTgBru1x+Bc6gzjJkYSr4kISEarysGplTh5RD8yJhsRm+T+a0RXU98lh
         iItU7n6DmJGPUikqEuuIxWJXIFayZK9DM977/7K1ChuWeyDUgQTzNncPVDbcpr7jxLhb
         yzJW24grUhNRXERPvP/FmMdVBSe6SvOONqQu644NxxibMpUiKAUoWt7h/Cc1+MGEOEH2
         lT4kYtJykr08jOA39hiYKmdPD58tKFfGboJOs5UsK4XJuYKs6xhkgj/pIGwy2CI5P87p
         UlCyoSOGozI9H54eesz5b8IlLKG225aw6AZ9uEgAoLkkE2NS6ULVhpzJ1vTtkN9/bgE9
         PHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vTGhjHR1vsg+Mr43HN4cyueuEjB0/vHkOdTIvdJMuEI=;
        b=YlGBqkVO1zqsfNBiFcbXVOlBcZpCHqeOKuVL4e4zDIZEmDrjv5ui9w0VaFbbdi/Iqi
         t0GeKubWqM3IPmhQAylRWLCv1uXb78XZKm9AtxNtFceK0J3kY62mbmvVrVCwdez8czh1
         jReUFmAv7s5CMf/bbTcR5psGT0t3Zn+HK/MAjZtJeJqt6j4bxEY1c/0DtvxJVON5mfiv
         d4QycfRuBlItipMsF9PXuaGpNPc6tCGe8THPeO8UVNjHOqSDl+PClTD0GuGRvPYtxkRu
         fuJAD9w2hvoxuace9V5GqaslqGImhA6ZJvIN5aW8rM7RFHBFvdf6GLi8nHdS/SyqdT5d
         dt5A==
X-Gm-Message-State: AOAM531wDs0U8vUcDynfZlE5nHkgPboP7VLJLZqhRwxj0tk68NZobxbA
        Pm3lYd78HLFqstGlYejwtojQk9lzw+62AQ==
X-Google-Smtp-Source: ABdhPJwWCXkCtc9Ql0FAXoIcgCxNwxWJcNJRgjQZQ3Djqh8Dx1vdHZm2bTzQIVbLeDk7XK8/WxnxCg==
X-Received: by 2002:a63:2b42:: with SMTP id r63mr552559pgr.316.1610004436040;
        Wed, 06 Jan 2021 23:27:16 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id c10sm4182974pjn.22.2021.01.06.23.27.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 23:27:15 -0800 (PST)
Date:   Thu, 7 Jan 2021 12:57:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210107072712.si2pdaatbqkpizhb@vireshk-i7>
References: <cover.1609844956.git.viresh.kumar@linaro.org>
 <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 07-01-21, 14:28, Masahiro Yamada wrote:
> On Wed, Jan 6, 2021 at 12:21 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Tue, Jan 5, 2021 at 4:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > Hello,
> > >
> > > Here is an attempt to make some changes in the kernel to allow building
> > > of device tree overlays.
> > >
> > > While at it, I would also like to discuss about how we should mention
> > > the base DT blobs in the Makefiles for the overlays, so they can be
> > > build tested to make sure the overlays apply properly.
> > >
> > > A simple way is to mention that with -base extension, like this:
> > >
> > > $(overlay-file)-base := platform-base.dtb
> > >
> > > Any other preference ?
> 
> Viresh's patch is not enough.
> 
> We will need to change .gitignore
> and scripts/Makefile.dtbinst as well.

Thanks.
 
> In my understanding, the build rule is completely the same
> between .dtb and .dtbo

Right.

> As Rob mentioned, I am not sure if we really need/want
> a separate extension.
> 
> 
> A counter approach is to use an extension like '.ovl.dtb'
> It clarifies it is an overlay fragment without changing
> anything in our build system or the upstream DTC project.
> 
> We use chained extension in some places, for example,
> .dt.yaml for schema yaml files.
> 
> 
> 
> dtb-$(CONFIG_ARCH_FOO) += \
>     foo-board.dtb \
>     foo-overlay1.ovl.dtb \
>     foo-overlay2.ovl.dtb
> 
> 
> Overlay DT source file names must end with '.ovl.dts'

I am fine with any approach that you guys feel is better, .dts or .ovl.dts. I
wanted to start a discussion where we can resolve this and be done with it.

Thanks.

-- 
viresh
