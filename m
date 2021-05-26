Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F2D39106E
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 08:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbhEZGNT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 02:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbhEZGNS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 02:13:18 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B30C06175F
        for <linux-kbuild@vger.kernel.org>; Tue, 25 May 2021 23:11:47 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id i5so95142pgm.0
        for <linux-kbuild@vger.kernel.org>; Tue, 25 May 2021 23:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gbPiSxkPDocMtm20zVFAvhPpgz5/mxvmWnSil/NU8cc=;
        b=cmzrEfMfXPhpDwTF81sh4RuFzjzZR+AKDtuvb7N5Xo7F7NyF+RT61BO55DhsY6HmQB
         q2h7zLbPM2pGV7ZbqVeA4DB9dtBdRduEQBlY3jjnirEKvyP5P4cREcQWPoPiL8vIcqy8
         0N8lL1tdqqqwnqGNFeEBmLdHgp1zGTOE0uuYD/PGrV0l4DuM0aZR8HV/Dmeoiu3rFABX
         uA6ObrrZ3f/v8lf3g7VXEsk/kDdGo1KP5coisDwVAv7D5TWpc3Iakb/BZB5fNttZEMBZ
         +QUXyW5n9Ka7/Qlo3s3s6gOa5yO8cRfXZ6eK7rtUbNd9dZ96alctL+Mrhr0fcYOBJLwj
         YwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gbPiSxkPDocMtm20zVFAvhPpgz5/mxvmWnSil/NU8cc=;
        b=W6H8THyY19zKGQ2aTlRRCPjcHlr+esnQriYCbK7P+uq3tALkyhMC00sKR0hXMdLg1T
         tdIAYRbEAaupKhl9py/RUkdJuB9LgCqW0GrlgolGLEFewNGYtdyGA21U+P0C5FHE7qyP
         m46imekjnSHf7y/TR7ZC8REmXlSvDGbY6AOMmc/teoSrJMdNar7Cwk3h6NANwsgQ7HRc
         4KFcLb+tNvBA6E39FrSuD0eoLHgBK9ffPerzj3YhMJ+Gf1SIQ0EwQojSyA9gnA98LJ3Q
         CRr92IfZtWU4zgsyFM0XNiXTUnkDTWcqUmNDQGaOPxC7SJfONV8IzAmSiCk/MiAUq5As
         DGxA==
X-Gm-Message-State: AOAM532fAy3RKisAMAEoN/FdvVjjv/n7GRCKdslzKUvWVuUvQmGumwa4
        vO0kdAcjtGsrhgum+h9LcCGChA==
X-Google-Smtp-Source: ABdhPJwMEHhu/I2taGS0lmYaSUKN7tJ5HDsDPBPTtC01apjOIv0KzmzScNdqLEy7DGo/G+vnUQhfdQ==
X-Received: by 2002:a62:30c2:0:b029:289:116c:ec81 with SMTP id w185-20020a6230c20000b0290289116cec81mr34147054pfw.42.1622009507172;
        Tue, 25 May 2021 23:11:47 -0700 (PDT)
Received: from localhost ([136.185.154.93])
        by smtp.gmail.com with ESMTPSA id b21sm11842087pfo.47.2021.05.25.23.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 23:11:46 -0700 (PDT)
Date:   Wed, 26 May 2021 11:41:44 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
Message-ID: <20210526061144.yvoaurpz75a3bsjr@vireshk-i7>
References: <20210324223713.1334666-1-frowand.list@gmail.com>
 <20210327174035.GA291160@robh.at.kernel.org>
 <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
 <CAMuHMdXpGKMi-xv6hZQmmEw0JO=Q0WuvUzwJ2v0O28Tx5uW+sg@mail.gmail.com>
 <d1aefaae-7b12-b5fb-4b97-7230bd52c1be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1aefaae-7b12-b5fb-4b97-7230bd52c1be@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 22-04-21, 13:54, Frank Rowand wrote:
> On 4/22/21 3:44 AM, Geert Uytterhoeven wrote:
> > Hi Frank, Rob,
> > 
> > On Mon, Mar 29, 2021 at 9:23 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >> On 3/27/21 12:40 PM, Rob Herring wrote:
> >>> On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wrote:
> >>>> From: Frank Rowand <frank.rowand@sony.com>
> >>>>
> >>>> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
> >>>> source file.
> >>>>
> >>>> Rename unittest .dts overlay source files to use .dtso suffix.
> >>>
> >>> I'm pretty lukewarm on .dtso...
> >>
> >> I was originally also, but I'm warming up to it.
> > 
> > What's the status of this?
> 
> I was planning to resend on top of the upcoming -rc1.

Ping.

-- 
viresh
