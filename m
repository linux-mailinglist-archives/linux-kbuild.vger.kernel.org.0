Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 251F2ED495
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2019 21:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727968AbfKCUaY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 Nov 2019 15:30:24 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:46239 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfKCUaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Nov 2019 15:30:24 -0500
Received: by mail-il1-f195.google.com with SMTP id m16so12963591iln.13;
        Sun, 03 Nov 2019 12:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/Dl0NwpxyUS4OH0o/CTzf2Lvn1O/Yggm8DAxZlB9h4=;
        b=ArRwMuxganAAYmG/hR7ZbkL3oypgIcEP9iJg2bRJ9hEVDrBof6yXbS2uhpbce6amYd
         +r7K19XMwFQYby4mMn1ngH3+0mIYE5TlnENiepO9CAeL4x9HykNkKzWW+7nqvc+8tWHW
         fPXLeOizDKgIn3fxG5WjDRUEPdYidJczn5a4OsouNU0OYPCJor7mw296LSmRq9GISzeE
         4R85msRkDBbkYs6bQ/bCO4oxcLg2J7OtLr6pqfvQM/cUYuxPrksiDZq0ZicexH17TUyG
         em8sLGCKxML7OAnFhBtdXfoG74RaRPRzLNRPUNw+G9SeNuid1maf7829FySfSEHBqCQD
         c93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/Dl0NwpxyUS4OH0o/CTzf2Lvn1O/Yggm8DAxZlB9h4=;
        b=JAcfBIJo6y3WDjbB8eJG9cbb+cWc6Skun4+6AwwsUWxPjTJ5GUaIKI/MZQyynuJ6TR
         CKj2IU4WDwy/NjlZctsfIbQxk87mv+5xzdSvJWfHYkw5tewjMRfSOnwuv9+g11LMZb12
         bees9RqhdMqVkkn/KNofhTFUq221KoVxHcf3Dg0hzuijA53h3vOF/7EB/V08xzTRhlWi
         v91LmifCYKC3g1MnPqQau12nnaXUjxWx8R3YIewN6NzdCumIKoQx9pF8z8AGFkyTnc57
         O5pOVztinAG0QFg2VkaFCJqJz+GXLvRBm32rhCrL3d4vOKPKaOZFwLYoqZew+QmD5RfR
         ivIg==
X-Gm-Message-State: APjAAAWZ35AznbzssAx/ApVPUNDfTaAEDYzBDQxvCQdeu2LVbRSvu9vN
        2ugmg873nNmUHANdkJn9/xwMxGY95K7h5rQWUVo=
X-Google-Smtp-Source: APXvYqzbEO1NCskGj2hIK2eS8hrKYu7Lw6F4wA4jSUL9l8Oi6NAB3ieraFCVh9tB0mdGN3qSNXyGRyuKXzmXXNDeTXY=
X-Received: by 2002:a92:1793:: with SMTP id 19mr24909394ilx.3.1572813023146;
 Sun, 03 Nov 2019 12:30:23 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
 <20191029150119.19823-1-e5ten.arch@gmail.com> <CAK7LNAT0HdWrHaubdjNuVSEdQWvqj6SkXNybs5LvEd2i9Ku1cA@mail.gmail.com>
In-Reply-To: <CAK7LNAT0HdWrHaubdjNuVSEdQWvqj6SkXNybs5LvEd2i9Ku1cA@mail.gmail.com>
From:   Ethan Sommer <e5ten.arch@gmail.com>
Date:   Sun, 3 Nov 2019 15:30:11 -0500
Message-ID: <CAMEGPiraGzabPXUzWVNDFkkJ-4rLD00uyMnE44Kgebu5ht6t2g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: support byacc as alternative YACC to bison
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> Hmm, this is unfortunate since there is no common way to
> specify the header path directly.
>
> I am not sure how much effort we should invent
> to support non-GNU implementation
> since we already rely on various GNU tools.
>
> If we decide to support byacc,
> we must carry the restriction
> that bans GNU-extension.

I just realized that I accidentally only responded to Masahiro with my
previous email from a few days ago so I'll just quote it here:
"I feel like changing 10 lines to support a different yacc
implementation that supports most of the GNU-specific features here
isn't the same thing as banning all GNU extensions, and in regards to
the file prefix, the method in my patch creates the same file names as
the bison-specific one for the 3 cases it is used for, and the flags
used for it are POSIX yacc compatible. In my opinion increasing
compatibility shouldn't have to be all or nothing, and it makes sense to
make changes that increase compatibility without outright banning GNU
extensions entirely."

Aside from that, patch to dtc has just been applied, so pulling the latest
upstream changes as well as the v2 of this patch should be what would be
needed to support byacc.
