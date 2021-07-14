Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83713C91DC
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 22:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239583AbhGNUMF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 16:12:05 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:55832 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238029AbhGNUMD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 16:12:03 -0400
Received: from in02.mta.xmission.com ([166.70.13.52]:37656)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m3lBu-00G2fD-3g; Wed, 14 Jul 2021 14:09:10 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:50644 helo=email.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m3lBs-008XEt-12; Wed, 14 Jul 2021 14:09:09 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list\:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
        <20210704202756.29107-3-ojeda@kernel.org>
        <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
        <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
Date:   Wed, 14 Jul 2021 15:09:01 -0500
In-Reply-To: <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
        (Linus Torvalds's message of "Wed, 14 Jul 2021 12:04:08 -0700")
Message-ID: <87mtqo1wv6.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1m3lBs-008XEt-12;;;mid=<87mtqo1wv6.fsf@disp2133>;;;hst=in02.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1+RhqiLRuXkUrC80vE88JVm8tG24B3OT+w=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=8.0 tests=ALL_TRUSTED,BAYES_40,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMNoVowels,XMSubLong
        autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
        *      [score: 0.3777]
        *  0.7 XMSubLong Long Subject
        *  1.5 XMNoVowels Alpha-numberic number with no vowels
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1522 ms - load_scoreonly_sql: 0.04 (0.0%),
        signal_user_changed: 18 (1.2%), b_tie_ro: 16 (1.0%), parse: 1.98
        (0.1%), extract_message_metadata: 16 (1.0%), get_uri_detail_list: 1.35
        (0.1%), tests_pri_-1000: 7 (0.4%), tests_pri_-950: 1.51 (0.1%),
        tests_pri_-900: 1.18 (0.1%), tests_pri_-90: 217 (14.2%), check_bayes:
        205 (13.5%), b_tokenize: 7 (0.5%), b_tok_get_all: 6 (0.4%),
        b_comp_prob: 2.2 (0.1%), b_tok_touch_all: 187 (12.3%), b_finish: 0.97
        (0.1%), tests_pri_0: 1238 (81.4%), check_dkim_signature: 0.63 (0.0%),
        check_dkim_adsp: 3.1 (0.2%), poll_dns_idle: 1.10 (0.1%), tests_pri_10:
        3.2 (0.2%), tests_pri_500: 14 (0.9%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Jul 14, 2021 at 11:20 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
>>
>> Do we demangle rust symbols when printing a trace from a warn/panic?
>> That would be nice.
>
> I think it would be pretty much required. Otherwise stack traces are
> going to be very very painful.
>
> In fact, I'm starting to think that Willy is right: we should use
> hashes for the "real" symbol name, and have demangled names for
> printing, and at no point would the kernel actually want or need to
> have the nasty mangled names.
>
> (This wouldn't be rust-specific - using hashes for module linking
> sounds like a good diea for C code as well, even if the de-mangled
> names for printing are then the regular ones)
>
> Anybody interested in looking into that? It would make this "big
> kernel symbols" patch immaterial.

Are you thinking the hashed kernel symbols need to have their types
included in the hash?  Or is this just a hash to make the names a
managable size?

Eric
