Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D1C613D5
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2019 06:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfGGEdS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Jul 2019 00:33:18 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:41220 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfGGEdS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Jul 2019 00:33:18 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x674X71S031442;
        Sun, 7 Jul 2019 13:33:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x674X71S031442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562473988;
        bh=9y9VZo1OOhLrBRWbqZR2U3aVpRoNwiIjm2wb+Db2h6I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K5uQwG/gV5WfxYKMAynH7MtvcqPSU1qOD97NfUWLVva6O3novZQVOq4HEHJA5FE5H
         2VSrx2Qvb0sDMkonq+s3j0EJGKL0Q3YJkUMU5m+fP84rv78ApVDgcRNJeJKjunZlGH
         XD3vgCOLIoP47jOWepQPdRKoWsF+LAaK5XenerIk3FNWF+zk7DQTYlh/q9GNdcOztv
         XCnvChd2qQruQ/2OToM3H5vt7i30UXJM7IVTfQGbm1JYrdeJMq8uUw5Iou9UF/yFvh
         YrV1QhXdeUXzNicVEMJkyrIHQCtDTW19ZPwlZ7x4xjD94Sf9MxChVvrrR7iuOY8xae
         vJQ6bw/rrQlGQ==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id m23so6157338vso.1;
        Sat, 06 Jul 2019 21:33:08 -0700 (PDT)
X-Gm-Message-State: APjAAAXNUv1Z+5DgIgqgepJ/prD1z5IwpUG3w+oB0eAjHvPGcyP6l6N/
        SJXhC8LuedOn6WibMdjVD81f2knesmxi0e72YJ0=
X-Google-Smtp-Source: APXvYqxra+LfZS9nfi0sDyRHRub/gVnA3uNXL37EWEQHctWP8UsXqrmvixYooJnHmIivO0HvP9SQEIXpKCYZsn4wwfo=
X-Received: by 2002:a67:f495:: with SMTP id o21mr6711974vsn.54.1562473987256;
 Sat, 06 Jul 2019 21:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190628051300.30678-1-yamada.masahiro@socionext.com> <CAK7LNAQ8M_z-z8tp-OiU=n13iggqEyY084S5HNS3p8LwM3qc1g@mail.gmail.com>
In-Reply-To: <CAK7LNAQ8M_z-z8tp-OiU=n13iggqEyY084S5HNS3p8LwM3qc1g@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 7 Jul 2019 13:32:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQJV+W9+1GVBVLiF4Bk-Womf=Gxqi8b2n173Y0xaaNkvA@mail.gmail.com>
Message-ID: <CAK7LNAQJV+W9+1GVBVLiF4Bk-Womf=Gxqi8b2n173Y0xaaNkvA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -E instead of -c for __cc-option
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 6, 2019 at 11:37 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Fri, Jun 28, 2019 at 2:13 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Use -E instead of -c like scripts/Kconfig.include
> > This makes the compiler flag evaluation slightly faster.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
>
> Applied to linux-kbuild.

Dropped because 0-day bot reported build error.


-- 
Best Regards
Masahiro Yamada
