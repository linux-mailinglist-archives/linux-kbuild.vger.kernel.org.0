Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD9F3FE502
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Sep 2021 23:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343833AbhIAVhM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Sep 2021 17:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241103AbhIAVhL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Sep 2021 17:37:11 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D65C061575
        for <linux-kbuild@vger.kernel.org>; Wed,  1 Sep 2021 14:36:14 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id l10so2023297lfg.4
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Sep 2021 14:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IYemb+IVIGMJMpiffbPQhUFiWax0UjI4yymjBbO+x2M=;
        b=L3OYKEs58Snx5mC+czL344+tZCIO7gfpz++GT7mAJJ9TkuGPjlXiYIOypkBLHsfxzx
         ds+STBdb8Ysq9cPQg06QQe80hsqF++3uZ2kqZQdkxsBDjcVYbjIWPXjRsuzwUZsae9l9
         mKlZ8KFBOIQgr5ExFEYl0ynTDLEaiIPke2C9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IYemb+IVIGMJMpiffbPQhUFiWax0UjI4yymjBbO+x2M=;
        b=az9Ke+gtblia5qtUFRR4PUJN3A0QaAOT2/+GS1liGVHTku6GDqjGkEYF5Zxl0gOvnY
         aLZaRPA5Zz/rDfFReht1aJGhJoz+bjIuZvkfxZSrWLTqT/Q2n4nyMf+fJXz+Qi96nk6q
         SYu0hGVABRM2Oj95FLZFpq36byXAdI579hNn0sZRsbt6/LsRsrhzkCVl2bSDQwtPdWIq
         pPFa6O/gE6fpekHoJSJwd5DcyIPTS2ST7mYJibdqBM2olIrm4yVYQ4Vapm7E2jq68IfF
         Q8i+UmI4Mkm4fg5OUk05DgUIU/fxqtdzn7G3VRQ+BjP2jw2GDOpm4hI38vaB2nJgAIPB
         tv7A==
X-Gm-Message-State: AOAM531YCrPwqTOi9ncQg/nMsjQB5cYYC5h5hqsSawIxHt5OrhW4EaU4
        kdQUhx5zXS0Lp4GKeZ8CbHLDaVe3jsvlKqEU
X-Google-Smtp-Source: ABdhPJymKgQCzXiMzVJ50eSOs/4zU+VYauyzb+/gs3jofeJbw8WweAA7oKPMUCAu/k0odOI2+lV/Rw==
X-Received: by 2002:a19:6510:: with SMTP id z16mr1079519lfb.566.1630532172518;
        Wed, 01 Sep 2021 14:36:12 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id u3sm66584lft.149.2021.09.01.14.36.11
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 14:36:12 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id m28so2003022lfj.6
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Sep 2021 14:36:11 -0700 (PDT)
X-Received: by 2002:a05:6512:128a:: with SMTP id u10mr1107687lfs.40.1630532171691;
 Wed, 01 Sep 2021 14:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATrzUSQg8pnpG1cDbA0sRdAeQGyy7d3ZqFJ4HMZymB=xQ@mail.gmail.com>
In-Reply-To: <CAK7LNATrzUSQg8pnpG1cDbA0sRdAeQGyy7d3ZqFJ4HMZymB=xQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Wed, 1 Sep 2021 14:35:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjbjVb5wNURa7-_PtvKqf96X-7a1OoUDPJjo9rz68YB=Q@mail.gmail.com>
Message-ID: <CAHk-=wjbjVb5wNURa7-_PtvKqf96X-7a1OoUDPJjo9rz68YB=Q@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v5.15-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 30, 2021 at 6:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> After pulling this, you may see new warnings like this:
>
>     arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing
>
> They are just trivial Makefile mistakes, and patches
> already exist. So, they will be fixed sooner or later.

I refuse to have new warnings in my tree, particularly during the merge window.

So I will not be pulling this, since I do indeed see those warnings
when doing my test builds.

                Linus
