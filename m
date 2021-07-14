Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2601B3C8B67
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 21:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240060AbhGNTHZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 15:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240088AbhGNTHX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 15:07:23 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A0FC061762
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 12:04:31 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a12so5384909lfb.7
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 12:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qboNP9wECqxtAQPwi4Gka7E9oHhS1YQMu+Q8JxA7ak=;
        b=glh504o9Z7GfM84TfN6a9e1MVve+NDS52G62Hq+T8wU2hET7iB2/LaVZ85dbskzDgh
         yAhIlfeW60S6JOo6yc3CQ/IrfJT+6DnE98rLe7dMWar89uMeZPDVQtzoII2b3yZofc4W
         nDIrMzgD5EdLgxaeyj2u+vGDFkWBSBw0uXR4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qboNP9wECqxtAQPwi4Gka7E9oHhS1YQMu+Q8JxA7ak=;
        b=dRek2JeoQUs9S3638lE3jbl6VilhszUHMrAi2aC/3HCxWaDuZ0r+d2sc4+/CQhComf
         gTxF87q7CzQ30IY+wZHB8h6UMaRtF/S2WktUexnXGxAnuMbm0tIfrrGAStUwxmT0enOH
         dFZGxexfZZKbUJAc4Jb8rrF5rkDQWRXGOhE77Jmf8nFI0kBeYH5ZcCUGR8uC6W13e6Pv
         r/6dqcDHupTWIHXhov6YL8zdS7g2wE1UP1zxng9rwZUTH8kMrVXO2zJSLcTO/9vg/l/n
         VxOAI/oaqxTNa2UyEEWF/X/Y12UhBtN53aAVeE1P1ZkfD87jSu+uX9uK7WyyRVjJEzkW
         f0+Q==
X-Gm-Message-State: AOAM533Y+Prk7rUuxMcUxqrI1Y51OSljczhY+4sK/rI68x9d1C0i6iKL
        j1I42hRvZr5f+55jHafb5tfdaVrSd5O30i3R
X-Google-Smtp-Source: ABdhPJyGacENhu4sgsGIEw2v4sc/G0lxHRWe96320enSrVjTZN+cW0UtJn5BujB4SlHVWDLtIELFrg==
X-Received: by 2002:a05:6512:cf:: with SMTP id c15mr7647169lfp.317.1626289469116;
        Wed, 14 Jul 2021 12:04:29 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id k12sm225599lfv.14.2021.07.14.12.04.24
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 12:04:25 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id bn5so4596608ljb.10
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 12:04:24 -0700 (PDT)
X-Received: by 2002:a05:651c:1798:: with SMTP id bn24mr10307687ljb.335.1626289464172;
 Wed, 14 Jul 2021 12:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
 <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Jul 2021 12:04:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
Message-ID: <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 14, 2021 at 11:20 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Do we demangle rust symbols when printing a trace from a warn/panic?
> That would be nice.

I think it would be pretty much required. Otherwise stack traces are
going to be very very painful.

In fact, I'm starting to think that Willy is right: we should use
hashes for the "real" symbol name, and have demangled names for
printing, and at no point would the kernel actually want or need to
have the nasty mangled names.

(This wouldn't be rust-specific - using hashes for module linking
sounds like a good diea for C code as well, even if the de-mangled
names for printing are then the regular ones)

Anybody interested in looking into that? It would make this "big
kernel symbols" patch immaterial.

             Linus
