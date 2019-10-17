Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF480DB0EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 17:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404792AbfJQPR6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 11:17:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43728 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405685AbfJQPR5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 11:17:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id n14so2968698ljj.10
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2019 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UqAZqXYydjkJ2Ybde7iVzFGdB8wnMfjwdh5C0M8C72E=;
        b=C3G/lKw4L8XWRmC575DNqxT0r8VqSreCB9sld5uxxlbR8lreT5HEIAFzucG7CZww7A
         y0ObcOG/yFqIwj5I56/XgN52Nf9rfeDsJj6sY8p5YG86ubp23hFST4+9BVKesfUuIvRq
         yptCi6sXsUnRq0+rnc70WFBTnzut4K090AIIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UqAZqXYydjkJ2Ybde7iVzFGdB8wnMfjwdh5C0M8C72E=;
        b=F0x6eqr/rX29df8nvoRP/z7YZCEZxGPrce7Sx/DPWbWPMLujmwsJfoadS1+wkUKT7t
         G/IjUXqR81c8MsRxywtPjTIfU+JsOPDJSAoatyLYK8lG0WYu/fFKiOc/+/WcDiSoVGPW
         h8n7b3WISkUSABhuvS44cRMOJA3Jfn/cV/R2GSj47cB9rB+22Tepf4za4B5hUHbQ2oZP
         8rNYlbLg71rAlUrEU/m5VzrzwpraFXnHyD606FbuZFhJWOu+GShl2lzqIt382AbDnBVX
         iqhn6pAZP/eZQU9djflo16zvo/5mCwi7ZJV2f6FHG9+Eh8LRRZ0YjimHIlCAfEFOPiNn
         5WGQ==
X-Gm-Message-State: APjAAAUJLKXP0jy5IjlKB/g7Z9fWPlJe1aIQpE6EzKaUSDev0ZfKGh0L
        soz7X/3thh7X9PfuKokBBVkLcXrhwLQ=
X-Google-Smtp-Source: APXvYqwy0p5whsbrg/lkOgdRZteyYfT+who00KRge8mtCvVs4PSwlU9HU8s8fqMhP/d4+9ToQFG5Fw==
X-Received: by 2002:a2e:63c7:: with SMTP id s68mr2982809lje.244.1571325473922;
        Thu, 17 Oct 2019 08:17:53 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id r19sm1270771ljd.95.2019.10.17.08.17.37
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 08:17:40 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id j19so3010953lja.1
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2019 08:17:37 -0700 (PDT)
X-Received: by 2002:a2e:9848:: with SMTP id e8mr2944245ljj.148.1571325457066;
 Thu, 17 Oct 2019 08:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <57fd50dd./gNBvRBYvu+kYV+l%akpm@linux-foundation.org>
 <CA+55aFxr2uZADh--vtLYXjcLjNGO5t4jmTWEVZWbRuaJwiocug@mail.gmail.com>
 <CA+55aFxQRf+U0z6mrAd5QQLWgB2A_mRjY7g9vpZHCSuyjrdhxQ@mail.gmail.com>
 <CAHk-=wgr12JkKmRd21qh-se-_Gs69kbPgR9x4C+Es-yJV2GLkA@mail.gmail.com>
 <20191016231116.inv5stimz6fg7gof@box.shutemov.name> <CAHk-=wh9Jjb6iiU5dNhGTei_jTEoe7eFjxnyQ2DezbtgzdoskQ@mail.gmail.com>
 <20191017001613.watsu7vhqujufjxv@box.shutemov.name> <CAK7LNAT8968tYxePbS_RD0n52dLfs1vx+tdKc_64PwCzwGOgAw@mail.gmail.com>
In-Reply-To: <CAK7LNAT8968tYxePbS_RD0n52dLfs1vx+tdKc_64PwCzwGOgAw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 17 Oct 2019 08:17:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjj_FB-PvBVqAo4h+bKgnaHiFKPw_+84X8P7uBo+qYukw@mail.gmail.com>
Message-ID: <CAHk-=wjj_FB-PvBVqAo4h+bKgnaHiFKPw_+84X8P7uBo+qYukw@mail.gmail.com>
Subject: Re: [patch 014/102] llist: introduce llist_entry_safe()
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "Kirill A. Shutemov" <kirill@shutemov.name>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sasha Levin <sasha.levin@oracle.com>,
        Andrew Pinski <apinski@cavium.com>,
        Michal Marek <michal.lkml@markovi.net>,
        mm-commits@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Ingo Molnar <mingo@elte.hu>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 16, 2019 at 10:21 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I tested -std=gnu99 for ARM with pre-built Linaro toolchains.
>
> GCC 4.9.4 was NG,
> GCC 5.3.1 was OK.

Ok, so the gcc-5.1 cut-off from my gcc git tree conversion looks to be
the right one. I wasn't sure how official/complete the git conversion
was.

> If we increase the minimal GCC version, we might end up with dropping
> more architecture.

That I wouldn't worry about. If some architecture can't get a gcc
version from the last five years, I think we _should_ drop it.

Historically, the problem has more been distro gcc versions. An
unmaintained architecture that has a compiler that is ancient I don't
much care about, but if we lose testers that use ancient distros, that
loses real coverage.

That's true even if it's just one or two actual users that upgrade
kernels - we found a real bug not that long ago because rmk used some
ancient Debian install with a new kernel. That's the kind of odd use
we want to encourage, and that matters. Hexagon? Not so much.

Although I think rmk actually had a new compiler and cross-built the
new kernel, so that likely wasn't the issue in _that_ particular case,
but in other cases it might have been.

              Linus
