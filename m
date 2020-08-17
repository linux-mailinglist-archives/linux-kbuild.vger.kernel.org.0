Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4253E24788D
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Aug 2020 23:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgHQVPq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 17:15:46 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:48070 "EHLO
        out03.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727885AbgHQVPp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 17:15:45 -0400
Received: from in01.mta.xmission.com ([166.70.13.51])
        by out03.mta.xmission.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1k7mTk-001Bwu-Sg; Mon, 17 Aug 2020 15:15:40 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95] helo=x220.xmission.com)
        by in01.mta.xmission.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.87)
        (envelope-from <ebiederm@xmission.com>)
        id 1k7mTk-00074A-6O; Mon, 17 Aug 2020 15:15:40 -0600
From:   ebiederm@xmission.com (Eric W. Biederman)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Michael Witten <mfwitten@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, John Levon <john.levon@joyent.com>,
        John Levon <levon@movementarian.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
        <20200816175303.GB1236603@ZenIV.linux.org.uk>
        <20200817204223.GB12414@amd>
Date:   Mon, 17 Aug 2020 16:12:09 -0500
In-Reply-To: <20200817204223.GB12414@amd> (Pavel Machek's message of "Mon, 17
        Aug 2020 22:42:24 +0200")
Message-ID: <87lfid6kpi.fsf@x220.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1k7mTk-00074A-6O;;;mid=<87lfid6kpi.fsf@x220.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.227.160.95;;;frm=ebiederm@xmission.com;;;spf=neutral
X-XM-AID: U2FsdGVkX1//ZQ9z85heRXtRqSwjyTMi/k4mhCF2Zkk=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa02.xmission.com
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=8.0 tests=ALL_TRUSTED,BAYES_50,
        DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
        T_TooManySym_02,XMSubLong autolearn=disabled version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4986]
        *  0.7 XMSubLong Long Subject
        *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
        * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
        *      [sa02 0; Body=1 Fuz1=1 Fuz2=1]
        *  0.0 T_TooManySym_01 4+ unique symbols in subject
        *  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: ; sa02 0; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Pavel Machek <pavel@ucw.cz>
X-Spam-Relay-Country: 
X-Spam-Timing: total 330 ms - load_scoreonly_sql: 0.03 (0.0%),
        signal_user_changed: 3.7 (1.1%), b_tie_ro: 2.5 (0.7%), parse: 0.69
        (0.2%), extract_message_metadata: 9 (2.7%), get_uri_detail_list: 1.22
        (0.4%), tests_pri_-1000: 9 (2.8%), tests_pri_-950: 0.98 (0.3%),
        tests_pri_-900: 0.82 (0.2%), tests_pri_-90: 64 (19.5%), check_bayes:
        63 (19.1%), b_tokenize: 6 (1.7%), b_tok_get_all: 8 (2.5%),
        b_comp_prob: 2.1 (0.6%), b_tok_touch_all: 44 (13.3%), b_finish: 0.68
        (0.2%), tests_pri_0: 232 (70.3%), check_dkim_signature: 0.39 (0.1%),
        check_dkim_adsp: 2.2 (0.7%), poll_dns_idle: 0.91 (0.3%), tests_pri_10:
        1.71 (0.5%), tests_pri_500: 5 (1.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] Makefile: Yes. Finally remove '-Wdeclaration-after-statement'
X-Spam-Flag: No
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Pavel Machek <pavel@ucw.cz> writes:

> Hi!
>
>> > This is not just a matter of style; this is a matter of semantics,
>> > especially with regard to:
>> > 
>> >   * const Correctness.
>> >     A const-declared variable must be initialized when defined.
>> > 
>> >   * Conditional Compilation.
>> >     When there is complex interaction between compile-time
>> >     configuration options, it's essential to be able to
>> >     make declarations where needed; otherwise unnecessary
>> >     gymnastics are required to silence the compiler.
>> > 
>> > Gentleman... Just let people say exactly what they mean to say.
> ..
>
>> You obviously need every bit of help in that task, judging by the amount
>> of clarity (or thoughts, for that matter) visible in the spew above...
>> 
>> NAK.  And as for letting people say exactly what they mean to say...
>> I am tempted to take you on that invitation, but that would be cruel
>> to gregkh - he would have to reply to inevitable screeds about
>> CoC-violating postings on l-k.
>
> We should really get rid of CoC, because I'd really like to see you
> _not_ resist that temptation.
>
> But... he's right.
>
> With rust-like programming style with widespread consts, this warning
> has to go. And it is causing additional/ugly #ifdefs in some cases.
>
> Maybe author can show examples in kernel .c where disabling the
> warning would lead to nicer code. I believe we should give it a try.


This change came in with 535231e8252e ("[PATCH] add
-Wdeclaration-after-statement").  AKA
https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=535231e8252eea14abf4f14d28f6c1c03f5e0f02

Does anyone remember why we added this warning?  I had always thought
it's purpose was to ensure we stayed within our chosen dialect of C.
The actual commit says that it was in reaction to gcc miscompiling proc.
Which is a far more serious thing.

With all of the our bumping of our gcc version lately perhaps it is safe
to remove this warning.

Eric
