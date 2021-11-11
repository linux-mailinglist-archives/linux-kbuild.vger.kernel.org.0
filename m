Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C180444D592
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 12:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhKKLNe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Nov 2021 06:13:34 -0500
Received: from mout.gmx.net ([212.227.15.15]:60465 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230400AbhKKLNe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Nov 2021 06:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1636629001;
        bh=jZ8l3uLh6D2hc2aCIqbUyH09CmUhgtayHxcRx2JWf8g=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=UTUxLOk/EUKRKJlgq2IC2DMMyf3u+gSF1X4iNSzZrwQUm/mWj++60N1YMQt0V0DbR
         9g5fX/fhLmCrYvf47tgYeOrj72JVcYLVAra5wBeOJ/6o+6HwHizvXPToVdVpMEC5+E
         I0vcGbnYnx+tw9OZQsxB+1CNGN1TEkvINZbKeqkQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.107]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzf6-1nByG23evC-00R0Xc; Thu, 11
 Nov 2021 12:10:00 +0100
Message-ID: <85ac7c9ccb578155738f2dfdfb74904e677f0141.camel@gmx.de>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
From:   Mike Galbraith <efault@gmx.de>
To:     Valentin Schneider <valentin.schneider@arm.com>,
        Marco Elver <elver@google.com>
Cc:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
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
Date:   Thu, 11 Nov 2021 12:09:58 +0100
In-Reply-To: <8735o3rmej.mognet@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
         <20211110202448.4054153-3-valentin.schneider@arm.com>
         <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
         <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
         <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
         <CANpmjNPeRwupeg=S8yGGUracoehSUbS-Fkfb8juv5mYN36uiqg@mail.gmail.com>
         <26fd47db11763a9c79662a66eed2dbdbcbedaa8a.camel@gmx.de>
         <8735o3rmej.mognet@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b6XWn7xnRrqcRL+59pdpMav+X0ElAqBwSTXFfB30ZrRhE9+Q/tG
 CnbC0FkUyt1tYIRBSNU00o5E7fcsZssc2k3TxttlXIFQhvAM3fvI1lrqbzAKCMOOwI9Q8fw
 kPr6lCNsVKp/0xk3UQQH3k9wNNFvmPeRiyyvNvKBLQQPCSM1RnjJ1f8gd1mgJhSxluULckZ
 +u6IUecArxEcMKflkVYQg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kKs/s/Utpbw=:rs2TwhUKxUtsfSh7oaDZOd
 kWP0wsK+RiTr3S3cI89LbH37yGehAJDxd+UmrxX7F2Dr7zWNOJJ/flI6MDo79C61PdDatSrkV
 BKCJsHAikUNHd0PJF+FM98W6ZWv4hXSnhYme0WolG/bzZDz/cZ8VI45UtAYhrzu380Uf8pqN+
 FqALEu9owqsnWXbZ1Y7ArYTShNwCc5bsTbxNhm46NSd0E019pZBssjrA64MXeSyUWaGVX4vP2
 KITWr8s6Kv6lXhEpjgNmwGUiSYis3+5DD6KDtbrcOYcsbR8Gr27XDFOKyaO17MxlInwT0C0l1
 6rmWymDW2wHfE/n+Z2+OKc9rbiXx2Y+2mjg/mTd7LrruDOLc/Yzd/DxACcaAGq84sMdpUZk6H
 EyXFXJyaHl/OjyfKJREMhVgUI1xjOj+8tYKhu1ILIJPNwCc7XpM87t9JibebEgQLcs5TN/pso
 GIW6KPxMjlltmLjGagm8mYz72DOaE0UYUzmBo9gD/PntpGyBRzf6li84fjHbaAXH0FmAcj85k
 +4LYiTaLgfKpCEkzRh5vfks5CY8oKAGLZogjk0JzcwWpIhtqbT8tNlgYR3JSqgVXcpGdw2l04
 EZrRU2b1/U1X7hT5ZsvZHE8ZKa9yxmHVYgvhAXWzzgVzxTWYwq3CabjjQqDfCNVu8E/KQdWix
 4b3WPH0vIMXYSRVuVAIZ0tl3Aj1H06dUL555NbHH9FBZuRyd7cVRl9BqTEnhyyqUJtN2Gkwot
 Lt9H1u+f2hBQH1ZuFK0FJj2hnu8y+HFcZH4WTSGX4aljbJvIzbyU8qIckDfTo20PMnmsIqG6b
 vzhDSbHEz0sQIbjqHTpbyVmFw3/MkoLLB4DTf6OcFhdLFzISbnLhHe/vI6QJnTfSaoQVRuMkp
 fIIsik53Mlh+8g0YaGF5NNtZBgyAKiUr6LoiPgFK3/UyovlleIrFcBF/XnLdx4pyVt/PzuTPW
 R7cLhx/3xx5AAeJOZ5+T7cDQjG4hQOv1aopgPGhydICpoFVSsOEu1LsUAYLGjZE8muXa5GgTo
 2l1d9OhK9jOO0v8/R2t7flnoK6XK1XJgh0y6/F0NtUX4UYYBcWPSuK8SqIRyzOo96TOwuMmHy
 jlsP5A/KKvnNWI=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 2021-11-11 at 10:56 +0000, Valentin Schneider wrote:
> On 11/11/21 11:32, Mike Galbraith wrote:
> > On Thu, 2021-11-11 at 10:36 +0100, Marco Elver wrote:
> > > I guess the question is if is_preempt_full() should be true also if
> > > is_preempt_rt() is true?
> >
> > That's what CONFIG_PREEMPTION is.=C2=A0 More could follow, but it was =
added
> > to allow multiple models to say "preemptible".
> >
>
> That's what I was gonna say, but you can have CONFIG_PREEMPTION while be=
ing
> is_preempt_none() due to PREEMPT_DYNAMIC...

Ah, right.. this is gonna take some getting used to.

	-Mike
