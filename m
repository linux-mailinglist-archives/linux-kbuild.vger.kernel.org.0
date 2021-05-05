Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A5E373E3B
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 17:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbhEEPOQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 May 2021 11:14:16 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54829 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbhEEPOQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 11:14:16 -0400
Received: from [192.168.1.155] ([95.114.117.51]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MdNPq-1l4ySO2iSO-00ZLJb; Wed, 05 May 2021 17:13:04 +0200
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
 <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
 <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
 <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com>
 <CANiq72k+x13L+sFkjtDLahcvnpEySqk_NGow6FVMZfrV+MmHPw@mail.gmail.com>
 <CACRpkdbNv4O7zs0OpZhWa2fkXkF5arQgDOF9++zKvr+yB5yk_w@mail.gmail.com>
 <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <3cdfdc0c-ddff-26e7-3ac0-594439d7911c@metux.net>
Date:   Wed, 5 May 2021 17:13:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:o0lErJE54lAboRMaHiRxEsKPGOTWhgFWI58Qy2KWAXqmJx9/jBu
 29iAIcK/dqkP2FYF1xby6J6K+1G+CtdjJeuXpPztY6vUi+UAHTa4kJjwN5Fu2Gep/y2jvz5
 C6S2M6dmuScXTRkbLf9UJTcy6cDE6S/KrmD26KorI0FQD2r+dJ9xiuaS1DTLanUw/JYC7ts
 VgUI2x3uwzd7uljo/UkBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A3KVyl5Jfd8=:AVKFC4b0+wf9LEK/8RgfZ7
 0IBXVs1O4bLiYt0s6oQs/LykcwVoHMCvH77z3uZNne5Vjq+eJObjEHNMEmMAu9CleZj5Hfvmk
 9wCmtgb0tBKkfnsjMn4RLW6/EHjEY63pBvNvT+lA+EALs/lYFm5Ah/WvJtykE8o1lcIumlo4d
 2hHudJYY+vx6xnkJqugEu7SywFnr8VVntDuQqw2j0mafw1injjMO3+geRR2A2aes3jzm6XIQl
 p/MEMyE35gJ6BeCsZQCn1JtKg6SVqd2rIZMPhZ7CMQ70aCpHmyMN5gj/mecvo7EYBA6uliet4
 wwnWh8kQF8PMxFT4xjm6+svjRDLOb0ImkG6LjYxwNTVFoRoH+hLN+BC11YqNngKcxZNyM53Vy
 484nmT9eXSIZfNTSjYkFs6/m2mq6uZAXd1u7R1v0s2iJ8FIZOwbnriMsmmrm3Vllif/mnhZcp
 HbU9bFgw27/dUluQ+1S38OqFFZdIhRkykRwk7QdUccAhqbSmvU4ZGGVA00wT9pdnouP35BisE
 kBV/2tRCXsBYftTFYCVTzQ=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 05.05.21 16:17, Miguel Ojeda wrote:

> Note that there are quite a few major private players already
> involved, not just Google! e.g.
> 
>    - The Rust Foundation has AWS, Facebook, Google, Huawei, Microsoft
> and Mozilla: https://foundation.rust-lang.org/
> 
>    - AWS and Facebook using Rust for a few years now:
> https://engineering.fb.com/2021/04/29/developer-tools/rust/ and
> https://aws.amazon.com/blogs/opensource/how-our-aws-rust-team-will-contribute-to-rusts-future-successes/
> 
>    - Microsoft providing official Win32 bindings/docs for Rust:
> https://github.com/microsoft/windows-rs and
> https://docs.microsoft.com/en-us/windows/dev-environment/rust/overview

Exactly a list of corporations, I'd never want to rely on.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
