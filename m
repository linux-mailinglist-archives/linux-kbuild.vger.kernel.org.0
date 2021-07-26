Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E493D6821
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Jul 2021 22:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhGZTqo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Jul 2021 15:46:44 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:48850 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhGZTqo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Jul 2021 15:46:44 -0400
Received: from in02.mta.xmission.com ([166.70.13.52]:55256)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m87Bu-00C6VG-5e; Mon, 26 Jul 2021 14:27:10 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:43626 helo=email.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m87Bt-001UWD-5O; Mon, 26 Jul 2021 14:27:09 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
References: <20210708232522.3118208-1-ndesaulniers@google.com>
        <20210708232522.3118208-3-ndesaulniers@google.com>
        <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
        <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
        <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
        <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
Date:   Mon, 26 Jul 2021 15:27:02 -0500
In-Reply-To: <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
        (Masahiro Yamada's message of "Wed, 21 Jul 2021 13:04:16 +0900")
Message-ID: <87r1fkizxl.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1m87Bt-001UWD-5O;;;mid=<87r1fkizxl.fsf@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX18tWp/rseM+A6K5maWqOboB6DPgUpqRyvE=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa03.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
        T_TooManySym_02,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4816]
        *  0.7 XMSubLong Long Subject
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
        *  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Masahiro Yamada <masahiroy@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 426 ms - load_scoreonly_sql: 0.05 (0.0%),
        signal_user_changed: 3.8 (0.9%), b_tie_ro: 2.6 (0.6%), parse: 0.71
        (0.2%), extract_message_metadata: 9 (2.0%), get_uri_detail_list: 1.60
        (0.4%), tests_pri_-1000: 4.2 (1.0%), tests_pri_-950: 1.01 (0.2%),
        tests_pri_-900: 0.82 (0.2%), tests_pri_-90: 59 (13.9%), check_bayes:
        58 (13.7%), b_tokenize: 7 (1.6%), b_tok_get_all: 7 (1.5%),
        b_comp_prob: 1.85 (0.4%), b_tok_touch_all: 41 (9.6%), b_finish: 0.57
        (0.1%), tests_pri_0: 337 (79.1%), check_dkim_signature: 0.41 (0.1%),
        check_dkim_adsp: 9 (2.0%), poll_dns_idle: 0.15 (0.0%), tests_pri_10:
        1.80 (0.4%), tests_pri_500: 6 (1.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for LLVM=1 LLVM_IAS=1
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
>> <torvalds@linux-foundation.org> wrote:
>> > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>> >
>> > We do most of the other heavy lifting in this area in Kconfig anyway,
>> > why not add that compiler choice?
>> >
>> > Obviously it would be gated by the tests to see which compilers are
>> > _installed_ (and that they are valid versions), so that it doesn't ask
>> > stupid things ("do you want gcc or clang" when only one of them is
>> > installed and/or viable).
>>
>> I don't see a good way of making Kconfig options both select the
>> compiler and defining variables based on the compiler, since that
>> would mean teaching Kconfig about re-evaluating all compiler
>> dependent settings whenever the first option changes.
>>
>> I do have another idea that I think would work though.
>>
>> > Hmm? So then any "LLVM=1" thing would be about the "make config"
>> > stage, not the actual build stage.
>> >
>> > (It has annoyed me for years that if you want to cross-compile, you
>> > first have to do "make ARCH=xyz config" and then remember to do "make
>> > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
>> > never really cared).
>>
>> The best thing that I have come up with is a pre-configure step, where
>> an object tree gets seeded with a makefile fragment that gets included
>> for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
>> 'CC=' and possibly any other option that gets passed to 'make' as
>> a variable and has to exist before calling 'make *config'.
>
>
> There is no need to add a hook to include such makefile fragment(s).
>
> Quite opposite, you can put your Makefile (in a different filename)
> that includes the top Makefile.
>
>
> I think this is what people are already doing:
>
>
> GNU Make looks for 'GNUmakefile', 'makefile', and 'Makefile'
> in this order.
>
>
> So, you can put 'GNUmakefile' with your favorite setups.
>
>
> $ cat GNUmakefile
> ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu-
> CC=clang
> include Makefile

Very weird.

I just tested this and it does not work.
I did this:

$ cat GNUmakefile
ARCH = alpha
CROSS_COMPILE = $(arch-prefix alpha)
include Makefile

In one of my build directories and the main makefile simply does not see
the value of ARCH or CROSS_COMPILE I set.  I have confirmed that my
GNUmakefile is being read, because everything breaks if I remove the
include line.

Does anyone have any ideas?

Something so we don't have to specify all of these variables on the make
command line would be nice.

Eric
