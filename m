Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C764329B2
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Oct 2021 00:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhJRWVI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Oct 2021 18:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhJRWVH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Oct 2021 18:21:07 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5743C06161C;
        Mon, 18 Oct 2021 15:18:55 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id d125so18111560iof.5;
        Mon, 18 Oct 2021 15:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O4Cl7rQY6UihJ8OG3pvvrpFfvwN0U29biQDTj754OeE=;
        b=LIxdzhs0aXZM12qF1ewvwQiaQUJKAV48DahO7iRPZ0OcZRweOSx2shKkHSnUHKwQm9
         ZgxClbpMOAIULfQVIlp0DWRt9namQNJBrlrrLGNDl98EUy5/Sxhg03670ukgVMX5f2YH
         07wKGZuFj9+dQg72UZoY3JVS+SBD0aBak1OKoBwgnnWV8+lhUZqp1eB9Jg5X23Nwq/y4
         mAD0wB2HmiWVRnMGvkZivDsuMLf1+jQ8yqvIu4Rlzoe8ge2K1v0I4eiEIoxn4C72m5Yc
         pXT7jTxquC7vnkw+Cjvz+zIuBM9k9FwZx8uhHvP5PB2VN4Flts6fnK0Z+JHfuPaVNSUa
         Uk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O4Cl7rQY6UihJ8OG3pvvrpFfvwN0U29biQDTj754OeE=;
        b=MIksuC6fpsGDijh8TiO63fUX6dPJTKXKW3BGjslw6+rZpcnJmnicTgntLyNuN8caJK
         Gjc2WUrygbJMCWlChqyR5+3U34OIZgy9E1h2zsZt9vLVDXzYpo8Fms/utBo36IlkBecr
         7pzJn+EBpdsUJx7xmqpsKEriFynOJUNGMfe62juDT0/tfyC9wLVDBwEuiy+FE/CbQ742
         8rQrU47YatGwCAV2m41bGnYTw277QbBUvGUAoBRKNJi5oOSjvhlNkjXLj1kBPBuIKbV7
         KPZoAjPeE3QGpDm1eklwl3V+trfqUs9qcRXKa/3IZigDyAKX1z9xXegBK3YoIYkA/y1k
         YSeA==
X-Gm-Message-State: AOAM533GKk9O1p4Mx1XflGsE8Cl3MmKD5eRznUMfex1PvARnhJPWqPM9
        52bEEmkFh4efdRzZDCBW6Ma28TMyBnLK3UXA+aY=
X-Google-Smtp-Source: ABdhPJzKclVdx8J4wBZle/K9Q+8N1HaFM8sSrjTx9vzBnG1XtaICa5LvPQKFbCRveyZrv6QQyoZH2f/ve6T15+Z+7O0=
X-Received: by 2002:a5d:8903:: with SMTP id b3mr11657664ion.44.1634595535272;
 Mon, 18 Oct 2021 15:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211018203023.036d8362@canb.auug.org.au> <a1b2bdda-d1cf-807b-6a84-73a3e347639c@infradead.org>
 <20211019085811.362b4304@canb.auug.org.au>
In-Reply-To: <20211019085811.362b4304@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 19 Oct 2021 00:18:44 +0200
Message-ID: <CANiq72=+5w7KzVKmN57ud5+GGEiuRbtgezfROGAuO=b-OYeWAA@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 18 ('make' error on ARCH=um)
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
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

On Mon, Oct 18, 2021 at 11:58 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> In commit
>
>   c862c7fee526 ("Kbuild: add Rust support")
>
> from the rust tree, these bits should probably not be there:
>
> -ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  include $(srctree)/scripts/Makefile.clang
> -endif

So this was on purpose -- we need the Clang flags even in GCC builds
for bindgen. But now there is that `$(error ...)` added there :(

> Miguel, does that seem reasonable?

Of course, for today please feel free to apply your fix (i.e. to put
the conditional back to where it was). I will solve it on my side
tomorrow.

Cheers,
Miguel
