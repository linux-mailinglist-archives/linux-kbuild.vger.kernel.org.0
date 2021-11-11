Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A0544D054
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 04:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhKKDUn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Nov 2021 22:20:43 -0500
Received: from mout.gmx.net ([212.227.15.15]:44589 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232958AbhKKDUi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Nov 2021 22:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636600623;
        bh=YnlTNGIxb0TctMcI3romfUmhYM4cIj46dGXd8nNdiFA=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=eXapQbE+ReTsd7FsGokinRSwpaik7JN4vgOiwh5n0ZyZGVOwm14V71ixF68peBhLv
         8+XUG52abJbypOFP6EzKsfgmWK8RQ5TEC87uugbGwrsp0p2Dg+Gm4Twa4dZ+FK+mUH
         Q8szu2FwA6oAbHgsj0WSWUYtNs3NAvkbYe86S+Wo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1n4sv12HCy-00OFiG; Thu, 11
 Nov 2021 04:17:03 +0100
Message-ID: <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
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
Date:   Thu, 11 Nov 2021 04:16:58 +0100
In-Reply-To: <20211110202448.4054153-3-valentin.schneider@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
         <20211110202448.4054153-3-valentin.schneider@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qdKVFo3qUd8POKOz+yc+x/4T44OcjnJV/MAWTG4EkF4hhUSRvqQ
 mUzoLUU1fEtSpidfUhv0y/XvxJ05PaVaIwghabR3cN0QZU3PllhBeGse5gsbZgORgHk0G65
 0YJqU3vKLoBpBV4AOyPaB7kj4As5svKEGAxE1eDJ/pETDTeSYlv4D6x0KqsCLgCRqrsRB1M
 cPmkHNhgrsUG08c9itIpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LZWBhAOA29M=:3Rf6nidJu4DK5U1hJ+TlOb
 fnCw/Zzx1GMgYx0cJovFivxszUF2Vkq4E5zleDi9N1tPsHDKlj5nUJlFJXfG6YMMvqept9Nc+
 T/1uVgUHSCiqBeamu2uv8jf7i2L7oWP96K4TnVfKoegF7s5oG6skJ54tGyWoKdeYygIvzhMM7
 gCpfz4AgLI4AQ5bqCFBxheN9Abwlh9pvogfetMr4ml3WCCzvLRoAB3N9qKt6J6sWnSbUpBejE
 hux2LDf/agCifoHTIVWZKuYSU8KeQr1CdZZo0d79PsmngVPNz6/Hxv33EvcoUqaRY6XorRGqf
 DYURLAYgHILTMDxNttC1Jxx4pzyX66XkmuNziMHwM86HB5S0kljCWzfBQZvZy1zYa2mqBcf72
 MvKJgj7bGXNeIuRwo4HjSOgUIuc+YcNj9aES9dr61Dmpu8Ims2ShrcMDFlVe8GlwraaholgCV
 s7YsIKSDPcbikYu0jxYATZxvYh+fRgU7dwoEtH45EzdunVi19cXo5ZxvHzi1Itdg0Zy3Suw/F
 pcprzm4RtJtiDUy8WCYlH1r/M046lHmrKvh1i+a5k/8GslvhRmHqYUobSUXHbTrlzZQgviQHj
 D5E4kKxWpFIWju9QrXgYSm9TrMeEmldQ9EJXKVakFTj4yM0eFLegY0KdMcaWvSnBdJPsy7VGT
 v/KQPp8J4k272DPRlf5tJ2z/XYVoy+4NGkmPeG4tZM09WKUAg5RiWF9rz/OCiE0cenrfw6GHg
 B1mo5g4wwL/z5i/1D8RNp9JodB4qe61xYOE4QpO+MgzJ7xQxFhr8lBs6EJjqVUZ64DbqGXOxt
 sHrHpIdUNBEN83FowKbVLGhXYO9V+tQ/OZ3tYw4Gom1FRPfO9HdBWTIOrIk8EWS52xlA9rBwG
 HVGp/Q9nmPi3Jd8MHAs5dodJ3qeTIKyInGkd40dkcWPHxp6tQjifJ9sHm1lK5oxT7tTV2hNFC
 TkgMtWDHH0tAw/DY/4FbCzNNF00lrTS47zQxebx7HsN66w7SYhnhh975x/+9pxIeFujzJd+BR
 M9EuuIit0IuefH2mKHZRyXUQTaWKgIdFJ+61q4jkGBAbDmOXEe8/fAxh5+zuuuGDeyCv7jU7K
 T+iEzWbTojYQ7M=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2021-11-10 at 20:24 +0000, Valentin Schneider wrote:
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 5f8db54226af..0640d5622496 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
> =C2=A0#endif
> =C2=A0}
> =C2=A0
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +
> +extern bool is_preempt_none(void);
> +extern bool is_preempt_voluntary(void);
> +extern bool is_preempt_full(void);
> +
> +#else
> +
> +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> +#define is_preempt_voluntary() IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)

I think that should be IS_ENABLED(CONFIG_PREEMPTION), see c1a280b68d4e.

Noticed while applying the series to an RT tree, where tglx
has done that replacement to the powerpc spot your next patch diddles.

	-Mike
