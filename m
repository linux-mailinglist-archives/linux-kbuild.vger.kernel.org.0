Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 711E9434E3B
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 16:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhJTOv0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 10:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhJTOvZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 10:51:25 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3165AC06161C;
        Wed, 20 Oct 2021 07:49:11 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id l7so9040600iln.8;
        Wed, 20 Oct 2021 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fI7q9bSy10kq6cygcSIh1Jg75Jpa8rMiA6bcvJr155o=;
        b=I7qMRfFVmoyxKG9DSwevt5bjKYqp1PH5hv77A5+xiNZpergvh7pWG+srarEclI/LKh
         9cwc5fT9SV11C0R53WLzbUm1TAkN9lkXEaSpm1yiY3ezlb8KK/wWY9+SFFXMwLULo93t
         7Q93rvae34KVceUmvKutY/UjOvPptn0R7S/wFGGzHs3nUe2t7bKWUp9FriNLoMiE1XMd
         kNSum3y7Zsl67uLHJA/2hhfjXNpsBYDw+sIpyqOt/jOr/MYUMzlR4cZfgD1e0kkqM68l
         rA/FIdHQGdD/85ktz7PS26jWSABMI4BKxXT+JAYoMIBfU6fcPVyME5GgYDO+3NhElEdZ
         dV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fI7q9bSy10kq6cygcSIh1Jg75Jpa8rMiA6bcvJr155o=;
        b=f7aM9XEZz5r69eE5SNVFZvZTjRLXCx5bndbbVQECjmPxDx5IZuyI4uKb+nXasduuE0
         X4q91xtpE8iNb1KfRMks0ySkb56dDA6XoPnytjxtO94S8CvrNpJTwzPynuBnoAAnYb59
         MNipILj5AXZ8vqM8PYTfzcWDvSpdRPf9OOSTY9TdtBV+3BquL5c+4I5Hu2UpNfMG6AYE
         Q3wKGjwlYuTZHJqnG7DCvYiRLB/uvCC/pV2nNbYFjsXPvWSL3rKrLHh1ZhgU8EuVyrlx
         thUiui1f+aQ5KyLtHlsjR0l9N+5l9K8c4Ubxhj149bUcnAjYTMwuZ3p+IGcdN/536rUD
         naTg==
X-Gm-Message-State: AOAM532qbvDOysN8JOA9TVACpdZBq2m1foA+2yj6GruVI/y2TsX6I6L0
        UMOIE+YtcgG/P5aT6oflpAg63io0vliOt7yV09M=
X-Google-Smtp-Source: ABdhPJwZn9zjVTqNY+9dsIKovzb+H7crSRdEvVp49jrI+ZiiZmjUE5frgHeNrvQtDhNigYmmWHcYnP+CNFkjcVDhtcE=
X-Received: by 2002:a05:6e02:1543:: with SMTP id j3mr187448ilu.151.1634741349940;
 Wed, 20 Oct 2021 07:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211018203023.036d8362@canb.auug.org.au> <a1b2bdda-d1cf-807b-6a84-73a3e347639c@infradead.org>
 <20211019085811.362b4304@canb.auug.org.au> <CANiq72=+5w7KzVKmN57ud5+GGEiuRbtgezfROGAuO=b-OYeWAA@mail.gmail.com>
 <20211020155627.7d6f6637@canb.auug.org.au> <81c2e5c6-7388-3d1d-87a9-1b000517661b@infradead.org>
 <b0eddd67-e62f-c6c3-37d1-8c69f27c51fb@infradead.org>
In-Reply-To: <b0eddd67-e62f-c6c3-37d1-8c69f27c51fb@infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 20 Oct 2021 16:48:58 +0200
Message-ID: <CANiq72=zBuRWdYQBE=i_pmv57QS7ZGNKZzL2wegNYeB=4G-JyQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 18 ('make' error on ARCH=um)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 4:46 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Stephen, Miguel,
>
> No problems like this in linux-next 2021-10-20.
>
> thanks.

Thanks for the confirmation and apologies for the issue.

Cheers,
Miguel
