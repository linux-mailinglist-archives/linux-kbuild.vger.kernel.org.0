Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE24F3D784E
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 16:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhG0OQM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 10:16:12 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:34630 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbhG0OQK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 10:16:10 -0400
Received: from in02.mta.xmission.com ([166.70.13.52]:49264)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m8NsP-00DgF3-2x; Tue, 27 Jul 2021 08:16:09 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:48960 helo=email.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m8NsN-003YiR-R6; Tue, 27 Jul 2021 08:16:08 -0600
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
        <87r1fkizxl.fsf@disp2133>
        <CAK7LNAS8Fz_kcwqzJD834QrSuWkkorHm4OZoGUhYsbKvJV=fJQ@mail.gmail.com>
Date:   Tue, 27 Jul 2021 09:16:01 -0500
In-Reply-To: <CAK7LNAS8Fz_kcwqzJD834QrSuWkkorHm4OZoGUhYsbKvJV=fJQ@mail.gmail.com>
        (Masahiro Yamada's message of "Tue, 27 Jul 2021 19:10:02 +0900")
Message-ID: <87v94vg7vi.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1m8NsN-003YiR-R6;;;mid=<87v94vg7vi.fsf@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1/A0yNJecA7Q20Vto//jCC4YwhQhHttrn4=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa05.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
        T_TooManySym_02,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4988]
        *  0.7 XMSubLong Long Subject
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_02 5+ unique symbols in subject
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Masahiro Yamada <masahiroy@kernel.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 627 ms - load_scoreonly_sql: 0.12 (0.0%),
        signal_user_changed: 13 (2.0%), b_tie_ro: 11 (1.7%), parse: 1.94
        (0.3%), extract_message_metadata: 26 (4.2%), get_uri_detail_list: 4.8
        (0.8%), tests_pri_-1000: 22 (3.5%), tests_pri_-950: 1.67 (0.3%),
        tests_pri_-900: 1.40 (0.2%), tests_pri_-90: 155 (24.7%), check_bayes:
        137 (21.8%), b_tokenize: 13 (2.1%), b_tok_get_all: 8 (1.3%),
        b_comp_prob: 3.7 (0.6%), b_tok_touch_all: 108 (17.2%), b_finish: 1.02
        (0.2%), tests_pri_0: 382 (61.0%), check_dkim_signature: 0.80 (0.1%),
        check_dkim_adsp: 3.2 (0.5%), poll_dns_idle: 1.01 (0.2%), tests_pri_10:
        3.4 (0.5%), tests_pri_500: 15 (2.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for LLVM=1 LLVM_IAS=1
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> On Tue, Jul 27, 2021 at 5:27 AM Eric W. Biederman <ebiederm@xmission.com> wrote:
>>
>> Masahiro Yamada <masahiroy@kernel.org> writes:
>>
>> > On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
>> >>
>> >> On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
>> >> <torvalds@linux-foundation.org> wrote:
>> >> > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>> >> >
>> >> > We do most of the other heavy lifting in this area in Kconfig anyway,
>> >> > why not add that compiler choice?
>> >> >
>> >> > Obviously it would be gated by the tests to see which compilers are
>> >> > _installed_ (and that they are valid versions), so that it doesn't ask
>> >> > stupid things ("do you want gcc or clang" when only one of them is
>> >> > installed and/or viable).
>> >>
>> >> I don't see a good way of making Kconfig options both select the
>> >> compiler and defining variables based on the compiler, since that
>> >> would mean teaching Kconfig about re-evaluating all compiler
>> >> dependent settings whenever the first option changes.
>> >>
>> >> I do have another idea that I think would work though.
>> >>
>> >> > Hmm? So then any "LLVM=1" thing would be about the "make config"
>> >> > stage, not the actual build stage.
>> >> >
>> >> > (It has annoyed me for years that if you want to cross-compile, you
>> >> > first have to do "make ARCH=xyz config" and then remember to do "make
>> >> > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
>> >> > never really cared).
>> >>
>> >> The best thing that I have come up with is a pre-configure step, where
>> >> an object tree gets seeded with a makefile fragment that gets included
>> >> for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
>> >> 'CC=' and possibly any other option that gets passed to 'make' as
>> >> a variable and has to exist before calling 'make *config'.
>> >
>> >
>> > There is no need to add a hook to include such makefile fragment(s).
>> >
>> > Quite opposite, you can put your Makefile (in a different filename)
>> > that includes the top Makefile.
>> >
>> >
>> > I think this is what people are already doing:
>> >
>> >
>> > GNU Make looks for 'GNUmakefile', 'makefile', and 'Makefile'
>> > in this order.
>> >
>> >
>> > So, you can put 'GNUmakefile' with your favorite setups.
>> >
>> >
>> > $ cat GNUmakefile
>> > ARCH=arm64
>> > CROSS_COMPILE=aarch64-linux-gnu-
>> > CC=clang
>> > include Makefile
>>
>> Very weird.
>>
>> I just tested this and it does not work.
>> I did this:
>>
>> $ cat GNUmakefile
>> ARCH = alpha
>> CROSS_COMPILE = $(arch-prefix alpha)
>> include Makefile
>>
>> In one of my build directories and the main makefile simply does not see
>> the value of ARCH or CROSS_COMPILE I set.  I have confirmed that my
>> GNUmakefile is being read, because everything breaks if I remove the
>> include line.
>>
>> Does anyone have any ideas?
>>
>> Something so we don't have to specify all of these variables on the make
>> command line would be nice.
>>
>> Eric
>
>
> Worked for me.
>
> Could you tell me the exact steps you did?
>
>
> This is my case:
>
> My kernel source tree is located at $HOME/ref/linux
> alpha tool chains are located at $HOME/tools/alpha-10.1.0/bin
>
>
>
> I tried a simple GNUmakefile with 3 lines.
>
> You can see 'make' is building the alpha kernel
>
>
> Please see below:

Interesting.  That appears to work if I don't specify a build directory.
Once I specify a build directory with O= it does not work.

When I am working on a change that affects multiple architectures
I really want a build directory that is not my source tree so I can
test small changes on multiple architectures without needing to rebuild
everything.

Eric
