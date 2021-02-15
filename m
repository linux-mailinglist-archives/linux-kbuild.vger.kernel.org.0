Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582E231B81D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Feb 2021 12:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhBOLhx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 06:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbhBOLhu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 06:37:50 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06AAC061574;
        Mon, 15 Feb 2021 03:37:09 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id p186so6873767ybg.2;
        Mon, 15 Feb 2021 03:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B+jVS23cudsZ3/C7Np0YEsBLyRvAeO7S41/Z3TysYA4=;
        b=JOG10Mwgzcelkb7dKTHw5XvgWJ0BoRmP2jL7R0/nVWE+iKRP6sEubvec/4zOBoQGqN
         zTNj0+5N3ydhyl9Ig/APiq+27nG20MX7nORYefA7qxGHvOE/TC05urOIWefrko/wM+2d
         5gwWiS4Z5VB4xzqE/0nJbtTHon15qTu0Xns6QmuGSL7gsDlNY3lrdAuvouPGjzo7Dt3R
         kT7c6RqKtjqwxTFMBQJi4ZMCiUJuPreih9pmyolvnmdvXLTcdIYIkbyvowbkp0F0nk/S
         LwLqbOQTjVni5bDRI/kBHLzrt/o8WMvX449FK1QY0hOB/9Zr+P7oQbA0bTtgUJ48cxBp
         324A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B+jVS23cudsZ3/C7Np0YEsBLyRvAeO7S41/Z3TysYA4=;
        b=AndmPQg76Sz5TthQRPd6W9UL4VLPmce6hOma9Ve5apD7cp6m7Ah34NksA3M1G4MZN2
         tyym1bXZ6DXMUXggKqJ9vZ2qzd6uIxH60DGsB8QLY9f02Gs1+8wqtM56rW1Vc8jPoCZO
         0PaGfn+vTK+y1nFhNNAjnahYi5XBJ82tPKu/iR76j9FNpZCSjHtH9KI7te4ugba9zVS/
         vSYTut74pAEvLHZao1bVyZ0UXF62iF1wnSlW+Z50IxtRgoq+ZKEllKflxClB5EP+RPu0
         lMwqUzoBEnMet7BPN9iWenHAvQKqwEYZaESHN7A7sQ/GUHWWhnFTmw2n1U2ZuLpp6qPD
         w+yw==
X-Gm-Message-State: AOAM530fDmccFOviBjS/CrYnRi77Dd6pXHtil+Pq6GFhhwxN4uefZ597
        5QCPoNRix8y0v5DQUT09Ln3eTh4u8KqvgnPdQGELEQMk
X-Google-Smtp-Source: ABdhPJz0aZIlcn747RqSVtx7SAdvlxB/DBXw9CVYFNWg0ypH7MzqUjs38lC20M3YmEeK3i3pXoUinAoYWYu4dEd7VT8=
X-Received: by 2002:a25:e08b:: with SMTP id x133mr12997895ybg.138.1613389029240;
 Mon, 15 Feb 2021 03:37:09 -0800 (PST)
MIME-Version: 1.0
References: <20210208195439.GA1097868@ubuntu-m3-large-x86> <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86> <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86> <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
 <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
 <CALuz2=ck_=M6Dd8oFgWxnRGdipWOsdL2KODZQSmodh2N7Z8T-w@mail.gmail.com>
 <CAK7LNAR06H3Ue5SG3=6u1veyjg+kXXb2isEBsHVQEtMMJ3d2Tw@mail.gmail.com>
 <CALuz2=fHXZ=NrVdRNzyromD88wp9pAzYC9nffPt6y5YM=sJniw@mail.gmail.com> <20210214232820.GA55343@24bbad8f3778>
In-Reply-To: <20210214232820.GA55343@24bbad8f3778>
From:   Stephen Zhang <stephenzhangzsd@gmail.com>
Date:   Mon, 15 Feb 2021 19:36:58 +0800
Message-ID: <CALuz2=e6F62G8z+tupLnSMT6gFi_St7EQHF-1ZPvQfGb2Ndirg@mail.gmail.com>
Subject: Re: [PATCH v1] clang_tools:gen_compile_commands: Change the default
 source directory
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Tom Roeder <tmroeder@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nathan Chancellor <nathan@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=8815=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=887:28=E5=86=99=E9=81=93=EF=BC=9A
>
> This will actually work for the regular build system as it uses the full
> path to the files when O=3D is outside of the source tree. My comment
> applies only to the tools/ build system, which Masahiro has explicitly
> said he does not want this script to support.
>
> Cheers,
> Nathan

Thanks for the clarification. I start to get what you mean.

Cheers,
Stephen
