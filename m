Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EED66115EEA
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2019 23:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfLGWT3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Dec 2019 17:19:29 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:40990 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfLGWT3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Dec 2019 17:19:29 -0500
Received: by mail-io1-f67.google.com with SMTP id z26so10951332iot.8
        for <linux-kbuild@vger.kernel.org>; Sat, 07 Dec 2019 14:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/9nvi8Yrcd1LEVyV/kg9431K2dtrSxT9gl9QEkR1nHQ=;
        b=ilUdJbyPHfkGXK4Ar8uM+GfwaNLsCB8xQUkIOzbXKiQ9Ik5rh4+a0EOJCklCQbGrfB
         zjPBsUw7f3PWHLprCHvlJ8ngNw2FLYKVqidQnsb9Id9vbt9CvV5TafDbetCf3y4fXZA/
         KPmUZD1wQOjZCw8BcSmbHtS2DE4lCKrvnObIkM7cqojjM04jKW6WMOAhZZTz6AiKgwsT
         OinloHefaow65wYjMlJt0A8Nn5jYtJkh28Ow7idUDhIUvGVvUMnXSdhhAaqL3/OS21hV
         4Q/Z2Ygg6x9UuAYJGtWMeGR6D9D992XUQJ2+DngawGYzQHgRcGZsnRXLBXAtplEoI9iJ
         jz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/9nvi8Yrcd1LEVyV/kg9431K2dtrSxT9gl9QEkR1nHQ=;
        b=TSJGF4kWsjovh3jWqz1NaNzjB7C7m4AMAF/3EWrsJljg9nRz3CZkymwcOPzud26yx9
         V9g7+EZYH96X9CBXNW2MTblumTvN/3aewCY9GHo4gzRZUH+Vh0SPepJuV0BOI5kgBdg6
         km7+qvrXYYM4S6chWa7fkwPsZBl/iI+wfcpZxTGNqZiSH2IDLm326r6/3JWadU8vM7EN
         csmBfA7yM0xqFPeS8uif5NJGdpfN1hZOAsBUADPDKnvS0Z5bNUN5pMcZ1pIZ+QL4ZL34
         SN2RoSagWlNpUPnsLl47TJcgxr+eJ2283tEoqEVfFawcdLjs9mvi2KwkVPhS0ehNeEpz
         j7oQ==
X-Gm-Message-State: APjAAAVfWVmYJWm1NPN7BePGCJA3xT5aXsGiH6gMDBUqYd+onQyRRPeL
        YyAj8yN7akIx1U/hgk8ttqOBq8fS5DGBxYEF+JilJg==
X-Google-Smtp-Source: APXvYqxKyJUhJH+MOZvSvLYvAxouyodwTwkQJWGVJlTId5S4qSwZXCbNQMnlcrEdTyZNT6MpwhI215p1XWZbRONknQA=
X-Received: by 2002:a6b:1410:: with SMTP id 16mr15132643iou.277.1575757168769;
 Sat, 07 Dec 2019 14:19:28 -0800 (PST)
MIME-Version: 1.0
References: <20191123160444.11251-1-yamada.masahiro@socionext.com> <20191123160444.11251-4-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-4-yamada.masahiro@socionext.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Sat, 7 Dec 2019 14:19:17 -0800
Message-ID: <CAOesGMiY65jqo985p_AjLJiXUCFq8AmHMA3xx0LvNwNfjUW-OQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] scripts/kallsyms: shrink table before sorting it
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On Sat, Nov 23, 2019 at 8:05 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, build_initial_tok_table() trims unused symbols, which is
> called after sort_symbol().
>
> It is not efficient to sort the huge table that contains unused entries.
> Shrink the table before sorting it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This started showing warnings on some 32-bit ARM platforms, due to
kallsyms_relative_base changing:

 kallsyms_relative_base:
-       PTR     _text - 0
+       PTR     _text - 0xfffffffffffffe20

The assembler started complaining:

.tmp_kallsyms1.S: Assembler messages:
.tmp_kallsyms1.S:15315: Warning: right operand is a bignum; integer 0 assumed

Also, I clearly see different output with this patch reverted and
applied; I would expect no actual difference if it was correct.

Can we please revert this for 5.5 while this is being sorted out?

To reproduce, build for example am200epdkit_defconfig for ARCH=arm. I
see it with GCC 8.2.0, binutils 2.30.0.


Thanks,

-Olof
