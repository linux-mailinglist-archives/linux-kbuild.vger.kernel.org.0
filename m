Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B563D35FF06
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 02:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhDOAs2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 20:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhDOAs1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 20:48:27 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEDFC061574;
        Wed, 14 Apr 2021 17:48:03 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id c195so24214355ybf.9;
        Wed, 14 Apr 2021 17:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MllpCSIPMGfCbWa4NZxlMqGZ/D3zjxnnOzGw5yr7J00=;
        b=rnlshmz0m5uO0F1y596lEBhYgquF6kLp205P3AdzdDicA8uoNpWprlOsqd5meqbQ0F
         5RVT7lQQLJe7qCPVUWsztBXCTm2ErU2/oUWlQLxbsG79Q+jycEMAU4CovGt3usIOizn+
         j8QbynvRYejfKT1mKclK8PnURuxPe2HUctQecr2afgwyCQ4FGIFhBBDnzRW2FvF9ePTO
         h+Y4PGU4IoRnUg/l7hniNi7NE0ettMzQ7q1kBs+1kA6W1JyGU0+Vge8fU08nh+j+4bkp
         m5nWYJUYQFj23rrfKReqNGBCjnwgvueurmjFJn4etT41dSnVBm6f/cIEqgqhvrKf6PHw
         8grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MllpCSIPMGfCbWa4NZxlMqGZ/D3zjxnnOzGw5yr7J00=;
        b=T4NTcVKslgAZiiaqsuWo5txzk+IW/QMoRj998410x+vKgmo4vcLhJ/4C1h6CDqyVbJ
         nVBS91+D477jLkOl8AQNReV52cm33Uo14LlwFa1XUmA3wvPVkib9INHipz9oyAeI2DeZ
         8simxNTFcF5uUN3Fb2jOEiKetPpL6kNa4F6IhfuZkl8qMTaXTQEtS0nur24jcbhaJbWe
         3L/JYm1RweAvm0H2s1LuUCToOxhaWTm9CJ7oyUTvBRtZUmIqP/d2H19sG5pJOsAiUS8e
         F5doSUunx9f5xOLI5n70V/A3DRs/s4sIEw8n1FLIwV0q4HI32UTTVwMmWigFKMTc++vN
         ph3w==
X-Gm-Message-State: AOAM531f5cynxY0sVR28fTDM+RneCyVJSit+3HJhDnmBokPcunNACWjb
        yLN+DmYTgsjnvnT2oOCWqLv3K5x/lh/L9kpgWEc=
X-Google-Smtp-Source: ABdhPJyFnt/9OejzItdMJY3l1hqEaYduiYaS/FBnAk5Q+XVduQ29yG/Y19SvcLZMhCf/aky519Hvhg8+8PpGUf8rVec=
X-Received: by 2002:a25:b781:: with SMTP id n1mr971106ybh.115.1618447682909;
 Wed, 14 Apr 2021 17:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-4-ojeda@kernel.org>
 <CAKwvOd=YV1Ck3hYKEC9035o+yghy_Oh1VWAyeGLQP5B9SR9xLw@mail.gmail.com>
In-Reply-To: <CAKwvOd=YV1Ck3hYKEC9035o+yghy_Oh1VWAyeGLQP5B9SR9xLw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 15 Apr 2021 02:47:51 +0200
Message-ID: <CANiq72kwge0-d-MYQ2vR9NBTe+0CKwzaVYtG3BEMjB-kLQ2e+g@mail.gmail.com>
Subject: Re: [PATCH 03/13] Makefile: Generate CLANG_FLAGS even in GCC builds
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 1:47 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm ok with this approach, but I'm curious:
> If the user made a copy of the CLANG_FLAGS variable and modified its
> copy, would TENTATIVE_CLANG_FLAGS even be necessary? IIUC,
> TENTATIVE_CLANG_FLAGS is used to filter out certain flags before
> passing them to bindgen?
>
> Or, I'm curious whether you even need to rename this variable (or
> create a new variable) at all? Might make for a shorter diff if you
> just keep the existing identifier (CLANG_FLAGS), but create them
> unconditionally (at least not conditional on CC=clang).

This is only for the GCC builds -- and yeah, it is a hack. I still
need to think a bit more how to do this better; although ultimately
the proper solution is to have `bindgen` use GCC like it does with
`libclang` and avoid this altogether. That way we can ensure the
bindings are correct, support plugins, etc.

Cheers,
Miguel
