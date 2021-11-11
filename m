Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6058444D074
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 04:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhKKDjM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Nov 2021 22:39:12 -0500
Received: from mout.gmx.net ([212.227.17.22]:47519 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230256AbhKKDjM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Nov 2021 22:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636601745;
        bh=+K8Pws57ECthHaz3IU9isSEu+78rlyPTi2Ia/AIqnIU=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=bCYCzn56z6pRPNd/ozQJMTaxqymfZr4cERB+j+6nSXcJespXzxo76y/26Q5qvVu/7
         K/Rk+T8og5irxiViBUjKKb2QazeDffW8YYXrwgI3cTh3dEMxBhHjMroziH1B2Q7fDC
         qdeS2KEiYqiApI/d3nV9B+TQVhlnENvnQCDaAMu8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.107]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV67y-1nAxUc3DDa-00S6B4; Thu, 11
 Nov 2021 04:35:44 +0100
Message-ID: <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
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
Date:   Thu, 11 Nov 2021 04:35:39 +0100
In-Reply-To: <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
         <20211110202448.4054153-3-valentin.schneider@arm.com>
         <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m5Cbra52DdXMAE7H+VG8AT7kX3qlvfgdfpx6gGyNLbPdqVV0j9i
 pqzgjniLDEtfh+GNR7V7YSZ1CReg05G3m1fkgnm9KcORv5LF22UU7ZiSxoWjxnlG4T3f68i
 XuDCvFG+2//qny6q6ZpXwZsJrPVLYHdDi/3SO9LVn3FgF7eJmr1NNUTbMSzhK4R5tO9M4Az
 tNyjyk0ii+TyMFksaQtAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EYpd5k5MlBQ=:AkAFq4JduQ34cfsAEeLQGz
 NQzFKr2UtLN2lACkzrMnzk5KbDLPM/2n315ZQ22SkVf9sdJ8eKFWFfhTBJniSyEXb8o2kkGYi
 30GSabsPni/S9Q7uHbLgQm2QN3Bh/nkQVeXLMk5oourWqhdhORVGlJneREUmyAa32WHtIJUDW
 7IyPbNrPb3CN9INF4hfQr6A6gwGwvNXHf1aukUQR+ypLXD2nzOdlsx++iA0lHBMo/uFrSBPtl
 ShTrPStgk5McKTcTbLYAybfAg2XcOldDyf7XdkIlE+1U+H9BHOtkoi9ltfupzDm3cnr/B35Ow
 Huhrsz7/QWgjK3Ul/mhV9GGtUb+CawUMwNdPIoa5tDxkbu7OdPOTsvwJ1LBdcmPKi/e5rB76c
 FxcEhQdwRXAkju6sUORkllHVyaxYKMMqYWNAgyUKpEZv9pCdWKQlqPWiTwHnHmok1vu1I0MjD
 LUqkLRjVIiDhRdCi09LvEXl4wwrbuuGm0BER4VLGbBzJHzNPSTvWghPzqvMLZiCOPt9UeZB6P
 lnYz7r1avfa1yKQB4x/GHPT3emYVqXgt+TMVBHBQL6lhBehPBuu5dNIb0Hhz/wKUTog/qJjO2
 ktp4KvN9ZNL5dzaRzywa/UVcU6v7eVxcDMP1TUJe0dFdCfcp7Cxh59P0VcbZX1UZgDhOhNuTq
 39xT1X2FnoyMMViwjbOT0gQgDwyJistV4LvtQBg69lg0Vn7kaElF8yRjQxmv8eEvQmmlUpM+s
 ZcaWA9ImTq9ogvsCF0AQhfJzMRmlbj32luOz91G8uIfKoCAQhYXbz3Vh9lfwvzqa1At2O6ufP
 Smu1pAxrq4rngh6JOVwmiERIfwXA6TDfwZbcyo+M+MGBdwotmKsYxBcay3LJ1kSxFq7iDrKrH
 rrYtPp1rkpR9NvzJ4vkzeOuIGqr9/sD+2mZWvKUeDoYFKlfEowfTSnHrWiQRgL+NUDx2y1RSx
 /eQkuKECO6xGGJyuV1uUFdNqDFH7V8b9lS+agRqtmxAw0hGSZ0BKSJD/g7104U3YxMvN4HzZx
 kDDrhFf2SUQDBfNgdtYhnx0/0PnAfQF0tifLCW5u380Oafrps70dyG0DbWyp7N+7iAheuzkum
 jvbGqXv/XL7eBY=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 2021-11-11 at 04:16 +0100, Mike Galbraith wrote:
> On Wed, 2021-11-10 at 20:24 +0000, Valentin Schneider wrote:
> >
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 5f8db54226af..0640d5622496 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
> > =C2=A0#endif
> > =C2=A0}
> > =C2=A0
> > +#ifdef CONFIG_PREEMPT_DYNAMIC
> > +
> > +extern bool is_preempt_none(void);
> > +extern bool is_preempt_voluntary(void);
> > +extern bool is_preempt_full(void);
> > +
> > +#else
> > +
> > +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> > +#define is_preempt_voluntary()
> > IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> > +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
>
> I think that should be IS_ENABLED(CONFIG_PREEMPTION), see
> c1a280b68d4e.
>
> Noticed while applying the series to an RT tree, where tglx
> has done that replacement to the powerpc spot your next patch
> diddles.

Damn, then comes patch 5 properly differentiating PREEMPT/PREEMPT_RT.

	-Mike

