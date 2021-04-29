Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A937F36E985
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 13:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232101AbhD2L0B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 07:26:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230148AbhD2L0A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 07:26:00 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDEEC06138B;
        Thu, 29 Apr 2021 04:25:14 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x5so16248528wrv.13;
        Thu, 29 Apr 2021 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=df00PonkuA4V7Kk/IBUK2Bd0mIxBD8f2wwKpTO3y3gk=;
        b=Zk/vf2nj1LdGchhmqAMS8vStJBPjhcdzrzX7BasvJBOqWUbi+GSYHd971I8bTJ5Iqj
         v8IcxzrNH/C/QPnjSP5WFgQf0/LFMoxRtA29pEBpVEwM+DNqSZLAzG3o4kxwnsa8WfMv
         rRLDKzM8kh54f9cJ6kTJDS2sekVKMbZeXQCm3l4iAqyCxejO0aypeXR10KyrrLgJkFCm
         FZzrlfbQfx7OrqKNwdi5qpLHaAC61gYblJBAcxIOp9TjooKG+5kgH/bMsqwGW2W6Lkbe
         2rwgwHWlIOxdgLwNQWUC/fEbntJJpy/lth8BWRys/x4c9BZxAINIcn84Tzky9YuM+lSc
         Vllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=df00PonkuA4V7Kk/IBUK2Bd0mIxBD8f2wwKpTO3y3gk=;
        b=RokTAxTIoYIL5Kbu6zCZfVHoPygquW7Revv2Gi7cqnehhoB0SoqXtvzfYbstWr3m8l
         K/kwopD5/BIxR4SPjf47qxq7VT6Msli6ON72Yrsr9y2S8Yq0gQyxaeQaKSXUqGXtJY4+
         U/BuOsPv9APkc5N6HNWP2hgfjV9lingkgO2lHt0ujAKXthZZkY7Vv9YA3KaT54HJquQG
         UJ+vM6sl2l0kCGnYR9+mLkJ8bFbQYJOMLAKVXOXJxLDztR1APqzWpd1CD50qjOc3L//T
         5EqyqPN4SoAMQVNt7NVv8EI5WaT0+Zf60dbsFo/OVms4BOQWERt7suNGWVhbVSza03q3
         eYEQ==
X-Gm-Message-State: AOAM533l0syAs+JbICd4ahWKcQJL9iPb/LdQ+E1XFrV4dTTo+E8x5QEh
        V/cWSCHqyDRxXO4LVRdUWe5vrfp+Ge8=
X-Google-Smtp-Source: ABdhPJzZf1hlNoZj6Op58fEkghEcYJ9e8oTMm3bZ0mfFq6JzGv24lqarERvDig04Sx/KvDFBPP0Tdg==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr3067811wri.178.1619695512776;
        Thu, 29 Apr 2021 04:25:12 -0700 (PDT)
Received: from EDI-InfinityBook ([2a01:4b00:ea36:6c00:56e9:4ef3:28ef:7ef6])
        by smtp.gmail.com with ESMTPSA id x9sm4535392wrt.13.2021.04.29.04.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 04:25:12 -0700 (PDT)
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 28.0.50
From:   Kajetan Puchalski <mrkajetanp@gmail.com>
To:     mceier+kernel@gmail.com
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
In-reply-to: <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
Message-ID: <878s51e3jc.fsf@gmail.com>
Date:   Thu, 29 Apr 2021 12:25:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Mariusz Ceier <mceier+kernel@gmail.com> writes:

> Rust compiler license doesn't require for people to give back to 
> the
> community - corporation can create their own version of rust 
> compiler
> adding some proprietary extensions, develop drivers with it and 
> even
> if the drivers code will be GPL'd they won't be buildable by 
> anyone
> but that corporation. The rust compiler license doesn't require
> sharing changes when you modify it. The similar problem has flex 
> and
> openssl required to build the kernel, but so far no one thought 
> about
> abusing them afaik.

Could you explain exactly what the issue you see there is?
Surely if someone develops a proprietary compiler and then writes 
kernel
drivers that use that compiler, nobody else will be able to build 
them.
Because of that, none of the maintainers will be able to run or 
test
the code and it'll never actually get merged into the kernel.
Surely they'd effectively be sabotaging themselves.

--
Kind regards,
Kajetan
