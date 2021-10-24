Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EF34387C2
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 Oct 2021 11:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhJXJI2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 Oct 2021 05:08:28 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:39236 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbhJXJI2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Oct 2021 05:08:28 -0400
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 19O95hZT013814
        for <linux-kbuild@vger.kernel.org>; Sun, 24 Oct 2021 18:05:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 19O95hZT013814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1635066343;
        bh=O1JGiWXqm2mTlj5Nl0zYMBLH341v1Ts20C0G67RlrR8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uFt7+Z70WTOAEld5IcJ7MG8QVZQt7lPUaTr9lJ2n8RS9nQtlCdp2SXv0JgtmS3JMC
         y8rIDWb64I1WapZYeQ7txMsKrp5UqxcsJ3y1au7GRoe9ApRg5ldGRQsj6z0ovWKkkm
         Jx18Du1FxESp2IWVWvXokajOZkY/lVbok14JPNci7ihhZSUbozBRo4mnV2vmZRUhbc
         crsXMAzA8DY2aGEbZt5qqw++VD+yKRHbzZplcVLmx7/gL5cf56steDYyTLrrWE9UvQ
         WyLk+yqBiOY48yRSPK/1a1SrrmowAYMB4e8t+K4tlwxDOOjnIIOsce9fLctefabfGb
         OkoDfU1D9oGSA==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id m26so7825203pff.3
        for <linux-kbuild@vger.kernel.org>; Sun, 24 Oct 2021 02:05:43 -0700 (PDT)
X-Gm-Message-State: AOAM532bk2h3CNrug91J3aHmBtA3I4aehFEWK+vohvXfFQz/uCp4ERq5
        ABnFVQPhuvqB0tgQijgkuvcpwbayr7YTSll/NkE=
X-Google-Smtp-Source: ABdhPJzcsQvsVwxtmatmcuZG8fOwmb0/DXNBrxbYyiXU+9Lkmbb9xCuLf11pNPNxUg9h25lCK/1tE5gsrmFX3ejv+Sk=
X-Received: by 2002:a05:6a00:1487:b0:44d:c51:c88b with SMTP id
 v7-20020a056a00148700b0044d0c51c88bmr11442156pfu.32.1635066342601; Sun, 24
 Oct 2021 02:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de> <61051172-6078-4920-a335-3ad1c8ab0d1c@rub.de>
In-Reply-To: <61051172-6078-4920-a335-3ad1c8ab0d1c@rub.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 24 Oct 2021 18:05:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=S0tVNdQXGg+MKMK7vA-YZawhw08QfFwifxEGJRWayA@mail.gmail.com>
Message-ID: <CAK7LNAR=S0tVNdQXGg+MKMK7vA-YZawhw08QfFwifxEGJRWayA@mail.gmail.com>
Subject: Re: [RFC v3 03/12] Add picosat.c (2/3)
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        deltaone@debian.org, phayax@gmail.com,
        Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 22, 2021 at 10:38 PM Thorsten Berger <thorsten.berger@rub.de> wrote:
>
> The second part of picosat.c
>
> ---


Most of the patches in this series are corrupted.

Both 'git am' and 'patch' failed.

masahiro@grover:~/workspace/linux-kbuild$ git am
~/Downloads/RFC-v3-03-12-Add-picosat.c-2-3.patch
Applying: Add picosat.c (2/3)
error: corrupt patch at line 10
Patch failed at 0001 Add picosat.c (2/3)
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


$ patch -p1 <  ~/Downloads/RFC-v3-03-12-Add-picosat.c-2-3.patch
patching file scripts/kconfig/picosat.c
patch: **** malformed patch at line 82:        {





Each line of the diff context should begin with
a space, '+', or '-'.

But the offending line starts with 0xc2, 0xa0.
Strange.



Could you re-check the patch format and resend?
(or can you push your branch to somewhere?)

One more request:

Please tell me which version of picosat
(http://fmv.jku.at/picosat/) you imported.

Thanks.





-- 
Best Regards
Masahiro Yamada
