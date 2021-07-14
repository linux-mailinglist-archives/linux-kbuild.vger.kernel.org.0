Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2F43C9276
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 22:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhGNUvy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 16:51:54 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:44410 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhGNUvy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 16:51:54 -0400
Received: from in01.mta.xmission.com ([166.70.13.51]:38388)
        by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m3loT-00G9kQ-Ca; Wed, 14 Jul 2021 14:49:01 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:51614 helo=email.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1m3loS-00ADRq-9Q; Wed, 14 Jul 2021 14:49:00 -0600
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
        <87mtqo1wv6.fsf@disp2133>
        <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
Date:   Wed, 14 Jul 2021 15:48:53 -0500
In-Reply-To: <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
        (Linus Torvalds's message of "Wed, 14 Jul 2021 13:21:57 -0700")
Message-ID: <87a6mo1v0q.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1m3loS-00ADRq-9Q;;;mid=<87a6mo1v0q.fsf@disp2133>;;;hst=in01.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX186maXoDYNAZPSG3DdGCQFiPAEMHK+euQk=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa07.xmission.com
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=8.0 tests=ALL_TRUSTED,BAYES_20,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,XMNoVowels,XMSubLong
        autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        * -0.0 BAYES_20 BODY: Bayes spam probability is 5 to 20%
        *      [score: 0.0651]
        *  0.7 XMSubLong Long Subject
        *  1.5 XMNoVowels Alpha-numberic number with no vowels
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 480 ms - load_scoreonly_sql: 0.04 (0.0%),
        signal_user_changed: 10 (2.0%), b_tie_ro: 8 (1.7%), parse: 1.26 (0.3%),
         extract_message_metadata: 25 (5.1%), get_uri_detail_list: 1.90 (0.4%),
         tests_pri_-1000: 37 (7.8%), tests_pri_-950: 1.80 (0.4%),
        tests_pri_-900: 1.45 (0.3%), tests_pri_-90: 103 (21.5%), check_bayes:
        101 (21.1%), b_tokenize: 11 (2.3%), b_tok_get_all: 5 (1.1%),
        b_comp_prob: 2.0 (0.4%), b_tok_touch_all: 79 (16.4%), b_finish: 0.92
        (0.2%), tests_pri_0: 285 (59.4%), check_dkim_signature: 0.71 (0.1%),
        check_dkim_adsp: 3.3 (0.7%), poll_dns_idle: 0.89 (0.2%), tests_pri_10:
        2.0 (0.4%), tests_pri_500: 8 (1.6%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Jul 14, 2021 at 1:09 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>>
>> Are you thinking the hashed kernel symbols need to have their types
>> included in the hash?
>
> I think the hash should be the whole mangled name. So yes, for Rust
> symbols they'd have the the type information.

Sorry I was meaning to ask should the C symbols that get hashed
include their types in the hash as well?  Because if everything
is going to be hashed we need to clear definition of what we do
with good old C symbols as well.

>>  Or is this just a hash to make the names a managable size?
>
> No, if that was the only point of it, the "just use two bytes for
> length" would be simpler.
>
> But I don't think we want to do run-time de-mangling of names in the
> kernel when doing stack traces, which implies that the kallsym
> information in the kernel should be the de-mangled names.
>
> That makes the names nice and readable, and also makes this "maximum
> symbol length" thing a non-issue.
>
> BUT.
>
> It also means that you can't use those names for linking purposes, so
> you'd then need to have a "full version" for that. But as Willy
> pointed out elsewhere, you might as well just use a constant-sized
> hash for that, rather than have both a manged and a de-mangled name.

Just to clarify.  We want this for the C symbols as well?

Eric

