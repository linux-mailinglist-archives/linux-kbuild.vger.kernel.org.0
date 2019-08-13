Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDBE68C445
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 00:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727215AbfHMWdC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 18:33:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:45852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727193AbfHMWdC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 18:33:02 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A894B2063F;
        Tue, 13 Aug 2019 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565735580;
        bh=9DbBq5dcWzNrvnGVWrQDW4EURLxpXB3jukRGzSvp9mM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TIqdKraiAPkRlSKabL5Nlsbq0sQn5Z9EQj56r54V3Tfu6fhOEcdgU8mqjqck/BuQl
         5MkG9hi9M58aLPUeDVaPuH7pbsf7Nv4Z6HC/Ldd7X/MvPoh1lx98HDMOHL2q3xkPwn
         waMdKChpNx+PzcKXzq9AdBSkHcp5WvW+PwiwnBq8=
Received: by mail-qt1-f174.google.com with SMTP id u34so8815824qte.2;
        Tue, 13 Aug 2019 15:33:00 -0700 (PDT)
X-Gm-Message-State: APjAAAX52QgpY5p4R5fHu+Z/df0S7yioO6E5fk+tfWJyNi1kOInCSIJz
        Q4t0vGnzO67qaYrk/lpKMK2l2LsBtx7ak/hrIw==
X-Google-Smtp-Source: APXvYqx6vCGTYHn9vp3DHRaDLAqKW41c7aEzwz8lVJnnYlNH9NTPC7xrhw1MfpZOZTy5Pl2habyHvMt9M0ebMMKQpTs=
X-Received: by 2002:a0c:acef:: with SMTP id n44mr417424qvc.39.1565735579844;
 Tue, 13 Aug 2019 15:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190813183825.9605-1-sboyd@kernel.org>
In-Reply-To: <20190813183825.9605-1-sboyd@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Aug 2019 16:32:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLivZNf9A2bVXKf8eqdmsywQV+KEh5dYVLywNQPfn0P=w@mail.gmail.com>
Message-ID: <CAL_JsqLivZNf9A2bVXKf8eqdmsywQV+KEh5dYVLywNQPfn0P=w@mail.gmail.com>
Subject: Re: [PATCH] devicetree: Expose dtbs_check and dt_binding_check some more
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 13, 2019 at 12:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> It wasn't obvious that this was a command to run based on 'make help',
> so add it to the top-level help for devicetree builds. Also, add an
> example to the documentation to show that db_binding_check can be run
> with DT_SCHEMA_FILES= to only check one schema file instead of all of
> them.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: <linux-kbuild@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <linux-doc@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>
> I didn't find this sent, so sending again!

You had. :)

>
>  Documentation/devicetree/writing-schema.md | 1 +
>  Makefile                                   | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)

writing-schema.md got converted to rst, so I fixed up and applied.

Rob
