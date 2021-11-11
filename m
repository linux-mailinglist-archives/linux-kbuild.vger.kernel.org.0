Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3543A44D07F
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 04:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhKKDu4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Nov 2021 22:50:56 -0500
Received: from mout.gmx.net ([212.227.15.15]:39211 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229699AbhKKDuz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Nov 2021 22:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636602454;
        bh=LoicmqBqzWAMXX2wC0w7BTZ7gGrgoV9hzUfH7Tyk2sE=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=a+8s+042cMt+dn9FVaEZV7wcRgko9XWb+TKA1SJZdEiOqrPMy83IoyNowHa84M2tU
         YVe+lXoVCWzSskxRWbHuhjf1g8OsNDQI3Cq1d9mA48ZI86pvnv5rwunP9hYY4KvuFp
         RA13bggYwqxFCTLT8FkvG3y7Y6Cxg4epbVCJbmiw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mirna-1mEy5h3G1k-00eu48; Thu, 11
 Nov 2021 04:47:33 +0100
Message-ID: <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
From:   Mike Galbraith <efault@gmx.de>
To:     Valentin Schneider <valentin.schneider@arm.com>,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Cc:     Marco Elver <elver@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 11 Nov 2021 04:47:28 +0100
In-Reply-To: <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
         <20211110202448.4054153-3-valentin.schneider@arm.com>
         <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
         <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:neYARZGAV19oG8yqEbX7zTlDy0reCiY8txJkj+HjJpP++d7PuH1
 EFCHlPw8/g5XIXswE4Utys7VwXDBQESfjgmfjgw9iy8vCIh2z2vCZkV3y9UimkdQuep2EDP
 gWW8TrgLOlO77B5MDA2ngOMVQwWmIBtLQVkrKgVHHhOQGw0ms/Pq2FJuAX1OqafJQRANTQU
 wJ97V0XSChTV4+9OUo0sA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H0lKKDMMkPg=:sOFjR+XBi2b2ykrjd07bVe
 KXa7oMTF2HOqn8t+1Tu1/OaLvyEbMCTvN6aDPtwoSsnQAEBXaWVfBRSxINKhLt5KKZJaXfwdQ
 +BwSqVYtqlaLBYOnCeUC+1P2hsyhC3CbQ0MNaIVj6mSGGkdYxFV0jtZftpqjroSsdIf2uCTdx
 AlNCMV5O7if0rX3FqzLp4Bo3xrt95DzDeYexTqe13cdoXcT+HSZY+wendJ1z4q+f5NxSgy93F
 9tdLrxkCCO0yWDAfn0DdBbEeR9jjRcZ0J/UBC1W95CSBkCxpcT2vmrMI8+Vf2ZRVi2miSZmKG
 e6Aw5erTQt79VAQjEmCWQhhl5crSju/2cqCRHwBZ2PurhSLgCW+2HBDxlrvhlJFtqzB3teQ5n
 1Idbijz7pNO2ajWGTzA6EMrVCdZ9gU9zDP4ukCVSMjz2jVlnjIX+jJo4vqAzbBy4zNJMWq9xl
 PfF947O+uWcAiKqJV4oo6pjIVw7vc/BP1o47ZnjLvnewS6UwaLR16OMheim79HkQqCrXxmcKo
 wah4FkYwKlh4DzQmF08nSKgzDDjI1h+mf74xR06jfuGiRJ7EORXBVo9yAnS+JXriG2EoQgDt5
 oucNM5gHuQcGxVO9X6lEjlD6d1OiO91uTItqPY+VQwfotNMRK8UOTDvtWD3tT2He9+XORfnmE
 DnNc0cyn+5X/II1jmuuZEnp7OyguJjKLTXH1TZJPz2OzAJWbRmxAiS19kClMksDHNf2vBZ7bR
 TFxZpifVBFPM18VaBo4FkHfSV15oFpu1MIqMHZkgWyaLr+BUWLRCK1+IKMCbGj6ZUGNivykx8
 Yk58Mf0iGg4iFaEuaLDpgdcPdIh0qJqGcPzE49E8Y8+gXVkUz4ZGE5k3rWqylFEU1Oy22rmbY
 am1fzEn0AC40ErLdgYXqxW5m05hKNLljH/Y7frpVJZ/8BSAG2TbGyLKpsBOCpR9v11wiL9nwY
 ClDuJnFV0NIbHK4AjeEoadUQ8iSp2hx/Et/vZJFZqzH751j3CfsiONK9JE9KpA69amgukSbsx
 ISq/30qO0+YKfpJVwD/ySpjZWIUkSZijiDfWbLDTYj6f3Ep5d9q3thEIsBBFJGxe01AV1IINH
 iXnuUQB9alIHSE=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 2021-11-11 at 04:35 +0100, Mike Galbraith wrote:
> On Thu, 2021-11-11 at 04:16 +0100, Mike Galbraith wrote:
> > On Wed, 2021-11-10 at 20:24 +0000, Valentin Schneider wrote:
> > >
> > > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > > index 5f8db54226af..0640d5622496 100644
> > > --- a/include/linux/sched.h
> > > +++ b/include/linux/sched.h
> > > @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
> > > =C2=A0#endif
> > > =C2=A0}
> > > =C2=A0
> > > +#ifdef CONFIG_PREEMPT_DYNAMIC
> > > +
> > > +extern bool is_preempt_none(void);
> > > +extern bool is_preempt_voluntary(void);
> > > +extern bool is_preempt_full(void);
> > > +
> > > +#else
> > > +
> > > +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> > > +#define is_preempt_voluntary()
> > > IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> > > +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
> >
> > I think that should be IS_ENABLED(CONFIG_PREEMPTION), see
> > c1a280b68d4e.
> >
> > Noticed while applying the series to an RT tree, where tglx
> > has done that replacement to the powerpc spot your next patch
> > diddles.
>
> Damn, then comes patch 5 properly differentiating PREEMPT/PREEMPT_RT.

So I suppose the powerpc spot should remain CONFIG_PREEMPT and become
CONFIG_PREEMPTION when the RT change gets merged, because that spot is
about full preemptibility, not a distinct preemption model.

That's rather annoying :-/

	-Mike
