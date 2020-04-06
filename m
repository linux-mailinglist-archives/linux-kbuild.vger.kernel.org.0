Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBB519F3CE
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2020 12:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgDFKrN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Apr 2020 06:47:13 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41102 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgDFKrM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Apr 2020 06:47:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id h9so16835457wrc.8;
        Mon, 06 Apr 2020 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=kd6c2N25HEZts+YP+jU82vZlm0XB3hI9StV8Q2SYi18=;
        b=KzqsCjvyQeXsFJpe6vy3m8t2XIt52zRT6r7HP+tdSEHioDTBvZTmk3Owaez8ITWsq4
         ZnVhfue9kEp7ctIk92PhIauoCQ6/Z8tK90PmlVBDD7GuERISRaXD7Gwp9dE0nh/xoyy8
         ye2oDibBh55XD1CRiXY0TERLmm1xzXiusAbmgXbYWrQ6pz5N5aUS/VxcC4nWnmNXHVmc
         y69WfOzf4a+D7MYGCZqKWBdGNDgXhwunOh0d8GXvlLolSEFxqTx/pvqh987Id+63fMXq
         sw9fLVuORf0jEcIuTsS9MEdvqKHfUB/uzHN3THEUVYnmEoUwhRyhuy0g7kphJ7+RQAPI
         8K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=kd6c2N25HEZts+YP+jU82vZlm0XB3hI9StV8Q2SYi18=;
        b=O261Otp+UCYDxJ/tKEewPCxaWCv/pmp2tQDHQwmesymqxhmFjkPjqugPqojJD7vLS2
         XiMo3zQMznCwCE78GGqSqpBp1VCwZ51e/EsurPN3rTvaAdE/bxpX8HAxtFiKC2A/B7oX
         iLzoFxXuQ15wrKBUSA1q/+IUWsgW1bU7gc7ubfiF4Ylhccut6xh0cNHVWlIbZP9EvCcM
         eCMRRA0Fsi6fD3681UVVRwke8xX2Hw+E57sOritHEnFJxOMA3PZ5r3WfGZP2mp5u7SFP
         Touv8l48sejOlU13g+myyI/IYNgN0j4SX89Oz9HDkxyXi9IQjv/PsBByYW3Cwfo2PUdl
         gG+A==
X-Gm-Message-State: AGi0PuZaB7xpGviON4DkE7GRBeAOn4c9ra65S8ERBOMlXUpnvBeQEQU+
        fFANAGViinNR8XvGwGbfujEQ83Q7fXNZh5Tnl78=
X-Google-Smtp-Source: APiQypJ5GHPxzMFVraMUiKVhD3OACRC2/EACvph11iACbw5clZBFSXVxVdy+pE2tdp5sbmAHWtN0YvnmoCqfimB2rjE=
X-Received: by 2002:adf:ef51:: with SMTP id c17mr23091048wrp.130.1586170030510;
 Mon, 06 Apr 2020 03:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com> <20200401093310.GA13748@zn.tnic>
 <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com> <20200402155810.GD9352@zn.tnic> <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
In-Reply-To: <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 6 Apr 2020 12:47:30 +0200
Message-ID: <CA+icZUWP0HR5ZiWq438bpcyu71cxmkv2HPqeuR2EwUAz5CjwBg@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
To:     Nick Terrell <terrelln@fb.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 2, 2020 at 10:26 PM Nick Terrell <terrelln@fb.com> wrote:
>
>
>
> > On Apr 2, 2020, at 8:58 AM, Borislav Petkov <bp@alien8.de> wrote:
> >
> > On Wed, Apr 01, 2020 at 05:33:03PM +0000, Nick Terrell wrote:
> >> The code is currently written so that all the compression algorithms u=
se the
> >> same ZO_z_extra_bytes. It is taken to be the maximum of the growth rat=
e
> >> plus the maximum fixed overhead. Just a few lines above is the comment=
:
> >>
> >> # =E2=80=A6 Hence safety
> >> # margin should be updated to cover all decompressors so that we don't
> >> # need to deal with each of them separately. Please check
> >> # the description in lib/decompressor_xxx.c for specific information.
> >>
> >> So I was been following the guidance in the comments.
> >
> > Please state that in the commit message when you send your next
> > revision.
>
> Will do.
>
> >> Does it matter? I=E2=80=99m not an expert here,
> >
> > Huh, you're only sending the code then? Or what do you mean with not
> > being an expert?
>
> I mean that while I=E2=80=99ve read and understood this piece of the code=
, have tested
> the patches, have followed the template of other compression methods
> added, and am confident in the correctness of the code, I=E2=80=99m not a=
 regular
> contributor to the pre-boot x86 kernel code. So it is possible that there=
 is a
> use case for kernel compression that I=E2=80=99m not aware of where RAM i=
s extremely
> tight and within 64 KB of the current limits.
>
> It seems to me that adding 64KB to the memory requirement for kernel
> decompression is not going to break anyone. If it did the kernel image is=
 taking
> up nearly all available RAM, which doesn=E2=80=99t seem likely. But, I do=
n=E2=80=99t know all
> use cases. If it does break someone, we can put up a separate patch that
> switches all the compression methods over a per-method ZO_z_extra_bytes.
>

Hi Nick,

are you planning a zstd-v5?
If yes, please CC me, thanks.

Regards,
- Sedat -
