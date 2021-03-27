Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6224334B888
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Mar 2021 18:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhC0Rk4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Mar 2021 13:40:56 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:39432 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhC0Rkk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Mar 2021 13:40:40 -0400
Received: by mail-oi1-f171.google.com with SMTP id i81so9058847oif.6;
        Sat, 27 Mar 2021 10:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HN8SP8ubW4h3M5tWUNzO2faltDSpxQo/7ZWviP/phFg=;
        b=XU/vk2YtirD0Bt8x2q4MxOs2zZmywEsWtCeiNrO/3DbG1wUttWV27/oIFvGqkxOYpH
         YqhC5rDoGRk2ipMGBadUNhOF1PHEgkGSPdEkNYkdyEdB/ENLUFYtj+1qWNnfQ5JTMY/C
         bKx8uOmQS2JvEQoKhicIep6n3rLwYv8NV0Q43pb2nb+Hg/hvZSeevOdqOh5E50PNjnzr
         nxxbumgnktlbIvFxFoLyc0/mp1wQ3EVkGY8hDhF9zDw4lmaEh4FNkye+rxNp7Vkkqtc2
         +CfL6lGMlYlS9FI7EXVKCNSkuLY0U+RSOpzu4KgmP6QJZqzKl/3CG02o7cTJSmYfcQU6
         Endg==
X-Gm-Message-State: AOAM533oVbAS9rWkQUwONIN1GrdXPfNl+XNReG4Z4tEMBHj6QZ7k0s20
        d22pGGzrMvb3vrrAuvuK8A==
X-Google-Smtp-Source: ABdhPJweV8zU1h9QeIiuRkjZGJ1zdojaxZDZxnS80Dif/Bh04/parpxGlT7IDf94cWnK4X4pwPuLug==
X-Received: by 2002:a05:6808:b19:: with SMTP id s25mr13778056oij.103.1616866840079;
        Sat, 27 Mar 2021 10:40:40 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
        by smtp.gmail.com with ESMTPSA id y194sm2645356ooa.19.2021.03.27.10.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 10:40:39 -0700 (PDT)
Received: (nullmailer pid 297493 invoked by uid 1000);
        Sat, 27 Mar 2021 17:40:35 -0000
Date:   Sat, 27 Mar 2021 11:40:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     frowand.list@gmail.com
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
Message-ID: <20210327174035.GA291160@robh.at.kernel.org>
References: <20210324223713.1334666-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324223713.1334666-1-frowand.list@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
> source file.
> 
> Rename unittest .dts overlay source files to use .dtso suffix.

I'm pretty lukewarm on .dtso...

> 
> Update Makefile to build .dtbo.o objects instead of .dtb.o from
> unittest overlay source files.
> 
> Modify unitest.c to use .dtbo.o based symbols instead of .dtb.o
> 
> Modify Makefile.lib %.dtbo rule to depend upon %.dtso instead of %.dts
> 
> Documentation/devicetree/of_unittest.rst was already out of date.
> This commit would make it even more out of date.  Delete the document
> instead of continuing the maintenance burden of keeping the document
> in sync with the source.

This should be a separate change. It's also going to collide with my doc 
improvements.

Improvements here would be better than just deleting.
