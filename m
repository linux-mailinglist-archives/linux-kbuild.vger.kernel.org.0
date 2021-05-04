Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6AC372AD0
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 15:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhEDNTy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 09:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhEDNTy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 09:19:54 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95619C061574;
        Tue,  4 May 2021 06:18:58 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id e15so7367763pfv.10;
        Tue, 04 May 2021 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CblgwW7Ud4f+9B1bK3aZ/7Lhxg480Ys59O+QR93vR6A=;
        b=HUCmFuhh8rWhVdsZN+H9ct9cpQQQ8X/8g5TSNpCqhizZ8EbPmq5SSLxpKk2jeUMdaX
         Tj9yd9u0iJ0+fauwyryct8gHTiPFZj6s+oGlCBMXIEenq7xhQhcoDyUjJJnTvFcswe4G
         kvI65Ho+kQrl2l3KFtE6JOsBNLDlKGMenC/VffsODCsr4+WtgNGh8Vdn/eHvTRdHQyrt
         XMRsS43lgRgSqlQQPaedD7v9I5rEUNCo2b0cfLiNvnFweSGe0SD5mJrLPaklTOGdbo/x
         q0TOBJBYgVHNa+tO2YzSKYk817yKK3IV1bzf14n9rSOL8mbUx4mXvj74RSVzQHw+2W9K
         Tr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CblgwW7Ud4f+9B1bK3aZ/7Lhxg480Ys59O+QR93vR6A=;
        b=hQIfQTaSFbQNsrqe+hbh5Hg47s3qiYcz/V6I+erAcpD9p+MNMw4Ek4+hSxWdnLWVZE
         t/UdqhDdZKQ6NWCT0eyVHRTBeHBuu2M0jy04isvtxaAhqWm+auF5Z11J5n5G1IBo+gpg
         HpGibnxucm2uUXzjRiX1NYF3e4hgCTMCn0DRt74M0138B+0lVxY0sjhGZrBA686zGpXH
         4R5kJlmVS6khdOwhelpj47ehn3fy0fLnxooR1oxPGhWuJGKejrVfrMQxkobAGOFe3aeS
         wIzx5P7xQ0GwdYf4lNCQBgMUlrsIw+7eLmvi9jEdZSdk80BJDJ2ufulcwdbTo27ofb4f
         zjXQ==
X-Gm-Message-State: AOAM531YFF/ycyV5QRPnnspY94SAZboJWsRv0Zkaok9n7TolHMdiROCE
        kEvhakRf/sIotego9PW/CV8E4Lkvlkx/Zr6D3FM=
X-Google-Smtp-Source: ABdhPJx5/8RQyp1LMuT4Dl9J/CS/IVFtFhu6zNbV+WzSdT3rLdKRijmds7H+X6buGhqrh+XMoJnP1gnFM230fMgVSDo=
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr5273402pjr.181.1620134338124;
 Tue, 04 May 2021 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
In-Reply-To: <8b5f1d57-1357-affd-565f-f4826f3ecbdf@csgroup.eu>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 4 May 2021 16:18:41 +0300
Message-ID: <CAHp75VevBN1AKpZetMfY7tUU0ghjc7_g7Vw=+rPxTfdifqqhFw@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" 
        <linuxppc-dev@lists.ozlabs.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 3, 2021 at 9:17 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 01/05/2021 =C3=A0 17:15, Masahiro Yamada a =C3=A9crit :
> > The current minimum GCC version is 4.9 except ARCH=3Darm64 requiring
> > GCC 5.1.
> >
> > When we discussed last time, we agreed to raise the minimum GCC version
> > to 5.1 globally. [1]
> >
> > I'd like to propose GCC 5.2 to clean up arch/powerpc/Kconfig as well.
>
> One point I missed when I saw your patch first time, but I realised durin=
g the discussion:
>
> Up to 4.9, GCC was numbered with 3 digits, we had 4.8.0, 4.8.1, ... 4.8.5=
, 4.9.0, 4.9.1, .... 4.9.4
>
> Then starting at 5, GCC switched to a 2 digits scheme, with 5.0, 5.1, 5.2=
, ... 5.5
>
> So, that is not GCC 5.1 or 5.2 that you should target, but only GCC 5.
> Then it is up to the user to use the latest available version of GCC 5, w=
hich is 5.5 at the time
> begin, just like the user would have selected 4.9.4 when 4.9 was the mini=
mum GCC version.

And we may end up in the case when gcc 5.x will be more buggy than
v4.9.y (as once proved by nice detective story where compiler bug
produces a file system corruption).

--=20
With Best Regards,
Andy Shevchenko
