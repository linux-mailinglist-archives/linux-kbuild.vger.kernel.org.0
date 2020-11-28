Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1762C7584
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 23:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388022AbgK1VtS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 16:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729823AbgK1Sap (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 13:30:45 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F41C02B8FC
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Nov 2020 10:28:52 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id r24so11967436lfm.8
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Nov 2020 10:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eGDndFrV+B41FUm0rBqaTWW6GcKei+83JgpSLF04Y7w=;
        b=bUXH/5+0xZCjoD49lFhvhBHOl2Oik0drcHRCVi0eywu8IrMLqHBAH+EL/nF40LJ+SS
         sLw++ze+tS2I8qxrFeyJ8ElqKutyBiSRKI2gu2HfwvI4jtY/s2OOFdZpiXszYg5vWlPK
         PXhA+vcYp0dxmUbrLzCRSF9vPKSzPuCMvp1Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eGDndFrV+B41FUm0rBqaTWW6GcKei+83JgpSLF04Y7w=;
        b=YkN8C2PC+O694G2+w+IVTsVjpZs2NS8qkfkZJ1TekfRSlyA4DE3crVhgfqgWl5Nkaj
         lCx4IN/abkNz02tGkX/c2+/KRCK7r+5VnAlDr3AsYEa16PFw9fZoG+iHURALng1LLx2c
         jkeIj5XqBugwf/vJR7i+1HJH+dDntihzheFIzizlPJYES1Wy6vs/nuCpmfcDbDA4ntMz
         5RZfb/LqJOlItbDqXh5ARqg3RLXW1pumwUm4Hr3+jANVZ5mQzaHhx5UN/FiRA/VtCibd
         vu0WiWkEh3EvdmApjKfEbAl3qFZPow40hZByTK1Zdr5zjUhSL7nqzHFzxu0foHbZiqwA
         x8Qw==
X-Gm-Message-State: AOAM531+fSFcBQAqg+5wkgdDDYC2HOnCtfrjzgJEubAFoQ6aUCI/1z8F
        p7F7Qseqh8gEKpiaOapl4nBBoOcsjW+kxQ==
X-Google-Smtp-Source: ABdhPJy/MBT9+I/8IEqXJ0d0ZvzxihWpKRdtUtvRqfIa01EhNm5FCAYGR7OiZCLE9vZjJmOtCwf6PA==
X-Received: by 2002:a19:f504:: with SMTP id j4mr6094681lfb.163.1606588130205;
        Sat, 28 Nov 2020 10:28:50 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id q191sm1409237ljb.139.2020.11.28.10.28.48
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 10:28:48 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id d20so11931875lfe.11
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Nov 2020 10:28:48 -0800 (PST)
X-Received: by 2002:ac2:4199:: with SMTP id z25mr5936619lfh.148.1606588128248;
 Sat, 28 Nov 2020 10:28:48 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
 <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
 <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com>
 <CAHk-=winw=9xh6SmFJPZgi8ngVR-ECTA-kDAAU3DEPLMoUrzVA@mail.gmail.com>
 <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com> <CAK7LNAQtABssBH2LGThgv-F3_aSrz9Hd-ra9Yyu4-FFzY1nsUw@mail.gmail.com>
In-Reply-To: <CAK7LNAQtABssBH2LGThgv-F3_aSrz9Hd-ra9Yyu4-FFzY1nsUw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 28 Nov 2020 10:28:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com>
Message-ID: <CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: multipart/mixed; boundary="000000000000af75be05b52ef291"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--000000000000af75be05b52ef291
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2020 at 11:05 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As for the cc1plus cost, I got a similar result.
>
> Running scripts/gcc-plugin.sh directly
> took me 0.5 sec, which is a fourth
> of the allmodconfig run-time.
>
> Actually, I did not know this shell script
> was so expensive to run...

So it turns out that one reason it's so expensive to run is that it
does a *lot* more than it claims to do.

It says "we need a c++ compiler that supports the designated
initializer GNU extension", but then it actually includes a header
file from hell, rather than just test designated initializers.

This patch makes the cc1plus overhead go down a lot. That said, I'm
doubtful we really want gcc plugins at all, considering that the only
real users have all apparently migrated to clang builtin functionality
instead.

        Linus

--000000000000af75be05b52ef291
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ki212utg0>
X-Attachment-Id: f_ki212utg0

IHNjcmlwdHMvZ2NjLXBsdWdpbi5zaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvZ2NjLXBsdWdpbi5zaCBi
L3NjcmlwdHMvZ2NjLXBsdWdpbi5zaAppbmRleCBiNzlmZDBiZWE4MzguLjU5ZGI4N2JmZjQ1NiAx
MDA3NTUKLS0tIGEvc2NyaXB0cy9nY2MtcGx1Z2luLnNoCisrKyBiL3NjcmlwdHMvZ2NjLXBsdWdp
bi5zaApAQCAtOCw4ICs4LDggQEAgc3JjdHJlZT0kKGRpcm5hbWUgIiQwIikKIGdjY3BsdWdpbnNf
ZGlyPSQoJCogLXByaW50LWZpbGUtbmFtZT1wbHVnaW4pCiAKICMgd2UgbmVlZCBhIGMrKyBjb21w
aWxlciB0aGF0IHN1cHBvcnRzIHRoZSBkZXNpZ25hdGVkIGluaXRpYWxpemVyIEdOVSBleHRlbnNp
b24KK3Rlc3QgLWUgIiRnY2NwbHVnaW5zX2Rpci9pbmNsdWRlL3BsdWdpbi12ZXJzaW9uLmgiICYm
CiAkSE9TVENDIC1jIC14IGMrKyAtc3RkPWdudSsrOTggLSAtZnN5bnRheC1vbmx5IC1JICRzcmN0
cmVlL2djYy1wbHVnaW5zIC1JICRnY2NwbHVnaW5zX2Rpci9pbmNsdWRlIDI+L2Rldi9udWxsIDw8
RU9GCi0jaW5jbHVkZSAiZ2NjLWNvbW1vbi5oIgogY2xhc3MgdGVzdCB7CiBwdWJsaWM6CiAJaW50
IHRlc3Q7Cg==
--000000000000af75be05b52ef291--
