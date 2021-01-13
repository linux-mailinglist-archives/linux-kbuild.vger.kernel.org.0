Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0AF2F4367
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 05:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbhAME4Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 23:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbhAME4Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 23:56:24 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C736C061794
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 20:55:44 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id w2so468918pfc.13
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 20:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mJKCusvpWtBfKn+y4mKbIiTTyEFF53qpNFGSZqmXVHU=;
        b=AYTgJ9tRKgK3HRW4hrmMHj7DhGnGUEPMNrO18Lx+slvosqt5RDGqMOsTVNyNUVVTCo
         v1pZVH7seXJuz8HaKjdXfJ0lu1ZsmXbEMoDxpSZ/JSrF1Xw0EeiP9M0EEIScTOoKzJG5
         woivZntD0iYcGQ8Gid/i9jTxPu3iGVOMIjqIaSd367us82Nkt/bHZYjrWdKudDQ2CX3V
         kaZyFOPTicOcFAZ5XTx/WGX9MV5XaLfCJOwcxELeXwitDZPj0xChg15Q6vTR5IiJbeZ9
         YmoVMSLr+9m8EffMMzXJpT45GB4+QFPV1tXCSQGpCMDVnwlSKbsKzgXmkYu5caRB+gbe
         oGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mJKCusvpWtBfKn+y4mKbIiTTyEFF53qpNFGSZqmXVHU=;
        b=NRN39eNQAgXcF5iGyQZEqcjoi4xDLd+hPFiv8JbT9VMI5oAL4A6ac2t3xcsgatcHSb
         +O1iJbDDXXEo1HC+oHh92ZxFMEywD0lpwh8qITCrHzxGUbhhy6iNEt7PPEiGZj2b45B6
         PKvVlGwZ711Gd0ZJndEDRWk4Au4IEz36oz3QKNChca+LFdO7fNDzz2Enr96UUMIZO7y4
         CQnnoiu8w+L8LHCKK67YRvoHdJHlNWMJUQbdSp2eur7cazT0hcXccAN7XfJ8DKEaVEAW
         r0Yh8H02FZj95ZuMM8tIGH+WQN9Yz1Nq1hIl/EEBzUBA8ZvSxfl3dOdoh5bw7z6qMRdD
         HdWw==
X-Gm-Message-State: AOAM532yyun6IJZ+/2yegcTb1KZalNYvdfsITN2a2Z3+LnhWYD5UFRKI
        xM68k0FSo4FtJzPScVuSWMeAYQ==
X-Google-Smtp-Source: ABdhPJwTqmk4iglhe8G2D21L3QujLbLeXjPAv+epZYprG0ZGWLUyfbPvPghFsk9qSH1TBXR8r1PVFg==
X-Received: by 2002:a63:e246:: with SMTP id y6mr383697pgj.412.1610513743224;
        Tue, 12 Jan 2021 20:55:43 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id a198sm820054pfa.7.2021.01.12.20.55.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2021 20:55:42 -0800 (PST)
Date:   Wed, 13 Jan 2021 10:25:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V3 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
Message-ID: <20210113045540.s2hg2dxldsyelzkd@vireshk-i7>
References: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
 <72c3a4f63dde3c172c11153e9a5b19fb6cdb4498.1610000585.git.viresh.kumar@linaro.org>
 <1d9369aa-b7aa-6d06-0d44-6ef21bc639e3@gmail.com>
 <20210112050818.s6ctvd6ihd2dt2d2@vireshk-i7>
 <3f0c733a-641f-290f-41b8-62ca22e355b7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f0c733a-641f-290f-41b8-62ca22e355b7@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12-01-21, 12:34, Frank Rowand wrote:
> On 1/11/21 11:08 PM, Viresh Kumar wrote:
> > On 11-01-21, 18:44, Frank Rowand wrote:
> >> On 1/7/21 12:25 AM, Viresh Kumar wrote:
> >>> We will start building overlays for platforms soon in the kernel and
> >>> would need these tools going forward. Lets start building them.
> >>>
> >>> The fdtoverlay program applies (or merges) one ore more overlay dtb
> >>> blobs to a base dtb blob. The kernel build system would later use
> >>> fdtoverlay to generate the overlaid blobs based on platform specific
> >>> configurations.
> >>>
> >>> The fdtdump program prints a readable version of a flat device-tree
> >>> file. This is a very useful tool to analyze the details of the overlay's
> >>> dtb and the final dtb produced by fdtoverlay after applying the
> >>> overlay's dtb to a base dtb.
> >>
> >> You can calso dump an FDT with:
> >>
> >>    dtc -O dts XXX.dtb
> >>
> >> Is this sufficient for the desired functionality, or is there something
> >> additional in fdtdump that is needed?
> > 
> 
> comment 1:
> 
> > Not for my usecase at least.

I answered this question here (and yes I could have been more clear):

"is there something additional in fdtdump that is needed?"

> 
> > 
> >> If nothing additional needed, and there is no other justification for adding
> >> another program, I would prefer to leave fdtdump out.
> > 
> 
> comment 2:
> 
> > Okay, then I will also remove the stale version of fdtdump which is
> > already there in kernel since a long time.
> > 
> 
> I'm confused.  I read comment 1 as saying that fdtdump does provide a feature
> that you need to analyze the dtb created by fdtoverlay.  But I read comment 2
> as implying that you are accepting that fdtdump will not be added to the
> Linux kernel source.

-- 
viresh
