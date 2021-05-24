Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 384A338E8A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 May 2021 16:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbhEXOXg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 May 2021 10:23:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:47554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232920AbhEXOXg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 May 2021 10:23:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3663D613BF;
        Mon, 24 May 2021 14:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621866128;
        bh=Ig1TZikfgT9yE4ksBhWHOA8tr3HMz5AKuvyU2Fd+tFY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IBXAjsA6XbuqqISnf2iaJGuU1XaFEVu5Visw48oSrtPaaIBbMxi9eGmsyDPDPufjT
         YAcKWv6CDaQXoa7d85pqdP2n6BOvNFcXL2k0XsGa7K7NTbV8mHCIb16khSOGm0yO3/
         T2mtwpqxy3WYKqbPHGm4G4E54tBlCClE806gFcY+iRJ5ySiXfjRN8ZdtVL/EtYZgiK
         sydPDIXxqSJl9Y3yIRDDQ3TXn+z06RCphD3evcCO83jo6DDN7nBjEaI8peKCKBLMjI
         X3Hrlxv8Cl8Xt05GcGo7j2wqo7OwEWPzzcMMEhBKXDRedjhsd9/eblFt0bnL9+qKnC
         JHOE1RJtxH39g==
Received: by mail-ed1-f52.google.com with SMTP id df21so32186767edb.3;
        Mon, 24 May 2021 07:22:08 -0700 (PDT)
X-Gm-Message-State: AOAM533IIBxdRXqQt64nBJHjaUtNCbNnnECTLz3WQUZ7apMA7okUoHum
        39P4puLB7L7z5kVFWfgeVPu1iNbg6vLB1dDsoA==
X-Google-Smtp-Source: ABdhPJzwNN7hvRYxN4vBSs9bD0hULMGH9C09SjXhLpry65xORcT11yP5FKn9bNMLePXXVgx7/ya7UPqQ9wWXOfNtIYA=
X-Received: by 2002:a50:c446:: with SMTP id w6mr25929307edf.62.1621866126761;
 Mon, 24 May 2021 07:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <1596650328-14869-1-git-send-email-eberman@codeaurora.org>
 <CAK7LNARrFFF5DTQfm3mo0NtdJjP9p4c=h5iM=vTuOSR=JE8Sbg@mail.gmail.com> <CAF2Aj3j7S3YXM-eFxWR7vOUMmN=gDEenmNLZP31iDTkBWG2PgQ@mail.gmail.com>
In-Reply-To: <CAF2Aj3j7S3YXM-eFxWR7vOUMmN=gDEenmNLZP31iDTkBWG2PgQ@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 24 May 2021 09:21:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJNkEmw_94aP95o+hMdA_nJLc+wkEMcOzYdzeYzYUbOVg@mail.gmail.com>
Message-ID: <CAL_JsqJNkEmw_94aP95o+hMdA_nJLc+wkEMcOzYdzeYzYUbOVg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add dtc flag test
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Steve Muckle <smuckle@google.com>,
        Trilok Soni <tsoni@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 24, 2021 at 6:40 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 6 Aug 2020 at 03:22, Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Thu, Aug 6, 2020 at 2:59 AM Elliot Berman <eberman@codeaurora.org> wrote:
>> >
>> > Host dtc may not support the same flags as kernel's copy of dtc. Test
>> > if dtc supports each flag when the dtc comes from host.
>> >
>> > Signed-off-by: Elliot Berman <eberman@codeaurora.org>
>>
>>
>> I think this supports only the newer external DTC,
>> but not older ones.
>>
>> This feature is intended to test the upstream DTC
>> before resyncing in-kernel scripts/dtc/.
>
>
> Was there ever a follow-up to this?

As Masahiro said, using an older dtc is not a usecase we care about.

Rob
