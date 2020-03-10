Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3BD17F6F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2020 13:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgCJMA1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Mar 2020 08:00:27 -0400
Received: from ozlabs.org ([203.11.71.1]:35325 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgCJMA1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 08:00:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cDDm2kHrz9sQx;
        Tue, 10 Mar 2020 23:00:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1583841624;
        bh=IOL1pQ8k+h2icJ3+rdfKQ0FCcEAuFYRuFoHqHy9IlP4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=myWQjj6ou9M/rx0t6WppLArlcp+X62GAuWKKpOnbPPnrled0bjPkm6keJHrkThfrs
         MVIJ4XU8hsmpo3lYwjj6XaEof4a9dw1MBHyRZSaU2Qp6WdLSb1pmkhhFNplYT84goq
         SFkv3VIkrG/i5lUUzC1D7USo4Jo2Trweix6nchWDVLKq4deu8xSR67RbIcABnaO6ud
         oNqCvaogrZu90PPuuv234bt05tO35Y1lIKl+rWny0zdlvXHbIhJat1rgNkICdZoeT6
         0YM/z3sDxJl1dxyqJsT2ZxVH7hCK0kjQ/GWh8wsvi+jD+f43M/iEnqOonRX6n2Cfty
         2fYA1ZVIjRcbQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     linuxppc-dev@ozlabs.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
In-Reply-To: <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
References: <20200219000434.15872-1-mpe@ellerman.id.au> <48YT3Y2QBsz9sSs@ozlabs.org> <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
Date:   Tue, 10 Mar 2020 23:00:21 +1100
Message-ID: <87r1y0ifmy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Fri, Mar 6, 2020 at 9:27 AM Michael Ellerman
> <patch-notifications@ellerman.id.au> wrote:
>>
>> On Wed, 2020-02-19 at 00:04:34 UTC, Michael Ellerman wrote:
>> > Some of our phony targets are not marked as such. This can lead to
>> > confusing errors, eg:
>> >
>> >   $ make clean
>> >   $ touch install
>> >   $ make install
>> >   make: 'install' is up to date.
>> >   $
>> >
>> > Fix it by adding them to the PHONY variable which is marked phony in
>> > the top-level Makefile, or in scripts/Makefile.build for the boot
>> > Makefile.
>> >
>> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
>> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>
>> Applied to powerpc next.
>>
>> https://git.kernel.org/powerpc/c/d42c6d0f8d004c3661dde3c376ed637e9f292c22
>>
>
> You do not have to double your Signed-off-by.

Oops :/

My scripts don't cope with applying my own patches very well. Will try
to fix it.

cheers
