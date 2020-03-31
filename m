Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4985C19994B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 17:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730391AbgCaPLh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 11:11:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39287 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbgCaPLh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 11:11:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id p10so26454268wrt.6;
        Tue, 31 Mar 2020 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=YYhDTmriCLA8KTnKhlbvHb66ns2uGy0fGvIYDhb16xc=;
        b=QlxLiCgJlYgom/DQ+81Mmado/IIC3zI4QbaqcNRZL0cypCxeTZLkhFgJ7WL0u7ZLcO
         6Fdvz6xdSBB8mYb7WtnlRYTQR02tGT241HzNUuBy+eaC1sJouiO2dflPRFL/HOEqMLea
         +IUIqS9s14KSfBVRbNWCiDC0pTZ5Zx162nPy7Dezp+bHSqJCDBCfjJ91s1sQg8tbs/BZ
         2WR81KRfzOQ0+FuOz69NvysUm/NT29jreAXXoPO2dGSW+TdoLV1gubqFui0hEzXD21Rj
         RVRZp4mSvm16hPkvDkBVMgMpjoyKPBNIxEg9bf0FjOgabdzl/5WJWSDMrMS8BFxhGktt
         hCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=YYhDTmriCLA8KTnKhlbvHb66ns2uGy0fGvIYDhb16xc=;
        b=Vo9j0+/kEjw5YdoWjVOjtyhUM2A5xTNAfh9eiOstCeVYXQfrbwU8FgM7zP+BIgVREw
         2IXGWJOQSh1McMGTA02fzJRURNctq3OuDm3b9N52MqFt1Bb0QEyMWEO6XsHJeo7sn07o
         hnK6YstkElqbtEQQ+bbxRmkQ/17tp5BgOCgjzJVt3ZPoIJD9xtYZZfXiFd6bG4oAzOSI
         k+bbVe+36GmTA5TTvIScu4+GYFjiejzOJqUT7GQ7Z8WXcdwn9kglMB1RuKsngDfEOAjX
         8T4VfM0srGSU+7EDmEoNIWl0pudlRVLokzsXD5j9L8ib/99c1TxXZTeBYpzeKDRQhCjO
         s38Q==
X-Gm-Message-State: ANhLgQ2eMV7R/cpqiTyzAFqmAcDiP886005PxpXX6xHVHL7FfelY4QDF
        fwroHm/14Ub5RaY4NoOG4HlXBWa4FysbisfvQnc=
X-Google-Smtp-Source: ADFU+vtP4vt6oMeO5LfNYEDj0gjnca9MI09Sub6Coviiad1q1qVMRL79d9Dmr78UBhMmNMy5fyf9s9gtLFi1o9ULx3U=
X-Received: by 2002:adf:ef51:: with SMTP id c17mr20737459wrp.130.1585667494944;
 Tue, 31 Mar 2020 08:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
In-Reply-To: <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 31 Mar 2020 17:11:35 +0200
Message-ID: <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and initramfs
To:     Nick Terrell <terrelln@fb.com>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
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
        Patrick Williams <patrick@stwcx.xyz>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 31, 2020 at 6:15 AM Nick Terrell <terrelln@fb.com> wrote:

[...]

> > Do you plan to push this for Linux v5.7?
>
> I hope that it will be accepted. From my point of view this patch set is
> ready for merge, except for the maximum window size increase
> requested by Petr.
>

Hi Nick,

thanks for your answer.

Did you send out a pull-request already?

Can you point me to that request or patch of Petr?
Is it relevant or optional for the pull-request?

> > Feel free to add credits for the whole series:
> >
> >   Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> Thanks for testing the patch set Sedat!
>

I have re-tested zstd-v3 patchset with Linux version 5.6 final and
Clang/LLD version 10.0.0 final (from Debian/unstable repository).

Is it possible to mention that there might distro-specific changes
needed to initramfs-handling?
For Debian you are welcome to include below Link [1].
Not sure I will send/ask to/on the debian-kernel mailing list in this topic.

Thanks and bonne chance.

Regards,
- Sedat -

[1] LINK: https://lore.kernel.org/lkml/CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com/
