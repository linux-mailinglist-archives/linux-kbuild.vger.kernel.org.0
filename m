Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BD52AA493
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Nov 2020 12:18:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgKGLSA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Nov 2020 06:18:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgKGLR7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Nov 2020 06:17:59 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79944C0613CF;
        Sat,  7 Nov 2020 03:17:59 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id s8so3526190yba.13;
        Sat, 07 Nov 2020 03:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8+HDEmfW+d3xmHdo94Vs4y4ugoydLAecNNDeHtLySM=;
        b=c+RRktz0VjDD4KACbOdWgkcHSP9XBNLVNEwNEeoLHTqV0KPHvGNRHEgvUn65ClWANq
         nv/I0KgJkqx6j7fl25vOwI6y1kvhVEcCNtePmYATD51Tk4NzB1UEte6IjuAdlwdsB53k
         8OIdxCxvMD0MLqESSA5pfmaX2A39ZavkL0Y3Jn6jiVrCyLFpAbJrW3e7g5UwyIYfBmFZ
         UR+6jQq28m6+5Iz8aWx+/ncHIBrz7PGZ1FYiKTKQIW0pJhOisrttisPe4vzPLhOy1pkX
         sHBP388hpsqniafAyXSZ3JIW1oPgA5/Fa2YtkTruYJEX+moUNCzIryqKUxx0mgM27OLf
         z3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8+HDEmfW+d3xmHdo94Vs4y4ugoydLAecNNDeHtLySM=;
        b=ZiNNUihQ+qwy3KmDlIY+PFe0Dg+3Y4OfU6fGH8GRNDLAjwd36Uvnw1/X2xSrqEgFva
         7yjEkhSEwA/k8TDyUxe/DU1HrEb+UnPC1a1aCcQkkfXJj9tEH07vj4qY9B6+Swbp/eqB
         Nt0F1RwFCMZrp3Bs0m76tYAna4RnDOwQWqW3fqkVq9LarlnMttAG1G5VDvLRfA6qLOu0
         YHelSLCTDNIKV2PSTzqAfHBBnxLPWNm6tLsR0p9LMKEW9zRdbjq84ShSriHJaN8b9uAs
         1Zx4/3FxwTGsarIKguAzz/n84xRy//I+I3+oxF+xOBQIwj6FQ04S4gaKdWFylReA+4Wg
         PuAA==
X-Gm-Message-State: AOAM531BeHA1DEnUyU/VEz/3ZFzYR4JahxLlT3N+Gcdlo77dU+WnlEkN
        5/BOuBD5Bbk+gZUPmGsLHceaWL+dVpgyvmXXbSY=
X-Google-Smtp-Source: ABdhPJyz2DCKQfmWAO3ofj481SrtXqoNApOQmhgcPMO67AOG4mtxicGNnuyjCpj758bzgmZfRRku5IqIDtjydtj2z0U=
X-Received: by 2002:a25:61c5:: with SMTP id v188mr2774947ybb.422.1604747878765;
 Sat, 07 Nov 2020 03:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20201107070744.1133811-1-ndesaulniers@google.com>
In-Reply-To: <20201107070744.1133811-1-ndesaulniers@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 7 Nov 2020 12:17:47 +0100
Message-ID: <CANiq72nR89xB_J3YVu8zC2MOTzVCDb26r+KofkNLWhYG=in6Uw@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: enable -Wfallthrough for clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Joe Perches <joe@perches.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 7, 2020 at 8:08 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> Partial revert of commit e2079e93f562 ("kbuild: Do not enable
> -Wimplicit-fallthrough for clang for now")

Wait, it says partial revert because it is one, but doing it this way
does not enable the option back for GCC (and Clang).

Shouldn't it be a full revert?

Cheers,
Miguel
