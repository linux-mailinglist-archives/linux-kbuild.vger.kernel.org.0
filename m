Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D122F2787
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 06:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbhALFJC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 00:09:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbhALFJC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 00:09:02 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26AC8C06179F
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 21:08:22 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id n25so678889pgb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jan 2021 21:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Sd4SGwEbhz9BejbXxxhTvp1jezaj6wrGznpvA69dFNM=;
        b=FJbWFSIOzDLDXHpm+2p7dB9rOBqikORVq+WjR4YvYFVJUnyv7JFnr+pPbfKoyplaNm
         A25p+ZadVEMbnaLgMrbpNoXB0a6DYVkfoaPq2en3qMUgPD93v2XecQtY5I9OcA/LJmi5
         5eNKVafv1OjCkDGmB54ZYUVY3S1bt+9y1Y02NmUcxBdrKs9AzN1Q3lrlDmVeBRTggKAo
         4AcydnlJ0jvnc7hlfaHp86JbgqmyvHIa9467lJvr7fddhbMHaIyRF6tc4V/rTZTPHp1h
         21u2dHYGglkyb5wkdjXOF0/1EzXaVyk/kxjOUro6Suha2YUne1ntEn+4T9JnsokCBaAh
         FQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sd4SGwEbhz9BejbXxxhTvp1jezaj6wrGznpvA69dFNM=;
        b=GJXtUQ5OUyPQ6hLDuAUvWCvXUtHsDcuiQMKGybdp9PGLoqOY3Fh9fhI0Lme59muGJX
         Y1InWcwKVpc2iKQ3QQpdNGx5zoohkboW35oFOtegUWoz/VzWCwT6SlTl8zmacSMvpq5H
         DXI0i0mU4K8dYIf8EI+maa9uEwL9oJKaXMnkViQcTcqrIE9l5Gw6pPZ3GX7ZT1BL1tzS
         AkWJ7ydKPhdG4CZm+PU18V8UF8AC9GJ+DcAhXc0bvR3g16MdL4ooSni4Q3sBx6xs61Sz
         jidpH3Fh36VrnBaDLbbwiE2w6DTZIDj1dB/CDMpWyeOIlxu2DDBS0IgdBFzglrBA5b6h
         HNNw==
X-Gm-Message-State: AOAM530UUy9gwCN9tigLbeJrcw/AvaHongl84gSCj69Qo+y9uH0tqU9m
        G4XkhCQsjHvfPDYNGwr/BX8jxA==
X-Google-Smtp-Source: ABdhPJw3HyNAMIKQrv5kZzTiCGKJplCtA3NLocDcpeShiHtImIa/ka1z27mK+6DyT04gjY/Z1lqyqw==
X-Received: by 2002:a62:fc4b:0:b029:1a8:4d9b:9767 with SMTP id e72-20020a62fc4b0000b02901a84d9b9767mr3154035pfh.22.1610428101592;
        Mon, 11 Jan 2021 21:08:21 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id x125sm1736517pgb.35.2021.01.11.21.08.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 21:08:20 -0800 (PST)
Date:   Tue, 12 Jan 2021 10:38:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V3 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
Message-ID: <20210112050818.s6ctvd6ihd2dt2d2@vireshk-i7>
References: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
 <72c3a4f63dde3c172c11153e9a5b19fb6cdb4498.1610000585.git.viresh.kumar@linaro.org>
 <1d9369aa-b7aa-6d06-0d44-6ef21bc639e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9369aa-b7aa-6d06-0d44-6ef21bc639e3@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11-01-21, 18:44, Frank Rowand wrote:
> On 1/7/21 12:25 AM, Viresh Kumar wrote:
> > We will start building overlays for platforms soon in the kernel and
> > would need these tools going forward. Lets start building them.
> > 
> > The fdtoverlay program applies (or merges) one ore more overlay dtb
> > blobs to a base dtb blob. The kernel build system would later use
> > fdtoverlay to generate the overlaid blobs based on platform specific
> > configurations.
> > 
> > The fdtdump program prints a readable version of a flat device-tree
> > file. This is a very useful tool to analyze the details of the overlay's
> > dtb and the final dtb produced by fdtoverlay after applying the
> > overlay's dtb to a base dtb.
> 
> You can calso dump an FDT with:
> 
>    dtc -O dts XXX.dtb
> 
> Is this sufficient for the desired functionality, or is there something
> additional in fdtdump that is needed?

Not for my usecase at least.

> If nothing additional needed, and there is no other justification for adding
> another program, I would prefer to leave fdtdump out.

Okay, then I will also remove the stale version of fdtdump which is
already there in kernel since a long time.

-- 
viresh
