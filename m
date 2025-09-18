Return-Path: <linux-kbuild+bounces-8900-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 447E8B85EE3
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 18:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9F71189FCFC
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 16:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03F431065D;
	Thu, 18 Sep 2025 16:13:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C0DF59;
	Thu, 18 Sep 2025 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212008; cv=none; b=HrjQ1HVtE0edd/lHatUZS4R51DabCeEZbHfeRHgs5Yx1FmRUyPqV9TIJcgESKpIlhuHE0RJUG2lBNSkxXGl/qNVbyvO2Pwe+/xxZTxIoCkvS3inEIbu1qF/AylwroJVRjw2ZvtNR/wleT9D1gA9xqn853pQ3z2BDZo0ZQ4T50Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212008; c=relaxed/simple;
	bh=RkkHYldHqxfCy+eO9kZc2Nu88Vb/p3AF9OgOx7ZCEAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNqs8aIlnoX7xicHSXDduoCGWQTGQpyMhhph/j9lqeCAuRHf7I4ARqkb20t9rHcAEZodMyCHqer4Gf895xODVTRqARdGbFHjwBmhs0nwM+e6CwyI2FITbhYSmseWdN9K1ifml9lGHAO08vM5T/c4A9VBHJqP/L9ck8ktQYvRGaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 0D508118E89;
	Thu, 18 Sep 2025 16:13:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 2846618;
	Thu, 18 Sep 2025 16:13:08 +0000 (UTC)
Date: Thu, 18 Sep 2025 12:14:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Ian Rogers <irogers@google.com>, Marco Elver <elver@google.com>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Ingo
 Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko
 <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bill Wendling
 <morbo@google.com>, Christoph Hellwig <hch@lst.de>, Dmitry Vyukov
 <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, Frederic
 Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>,
 Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Kentaro
 Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Tetsuo Handa
 <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman
 Long <longman@redhat.com>, kasan-dev@googlegroups.com,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-sparse@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Subject: Re: [PATCH v3 02/35] compiler-capability-analysis: Add
 infrastructure for Clang's capability analysis
Message-ID: <20250918121416.19a8041e@gandalf.local.home>
In-Reply-To: <1ca90ba0-7bdc-43d1-af12-bba73dd3234a@acm.org>
References: <20250918140451.1289454-1-elver@google.com>
	<20250918140451.1289454-3-elver@google.com>
	<CAP-5=fUfbMAKrLC_z04o9r0kGZ02tpHfv8cOecQAQaYPx44awA@mail.gmail.com>
	<1ca90ba0-7bdc-43d1-af12-bba73dd3234a@acm.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 2846618
X-Stat-Signature: jk37s4n4y1abypzz3ibjma6i8hwh3dpi
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX187tFXsL5Le7f+OEdXPb8EfevPMdYJjxao=
X-HE-Tag: 1758211988-794253
X-HE-Meta: U2FsdGVkX19m1tAn22PHk3kX2Wk2POBgAZFzgAQIMCx/TzKCFJHSRgy7lqGNU4t4JpUf2LxrofFc8Ml/SzvQUemqI2s/M2eVv2TcCTTofn0gFGf1qiKnggle2+rBi9jozqgLP+w5zmTzD8j5BYGNETdC7HYpSCmlxzgRl1HmUDgT6vBPRbNQKlew/GiSPntamWI4BN+3BQMlrQzHKrw2Hd44nH0TJbDzGUvq4EnHN5l77wWkx8yamYKm0wF/UonjU1auAq1+e+AHgLIMHgDBTy/q+l9/HvzB2gWDjclvwsnGTS+Jv2LDmjZbgWOiLNXP1sp9TafIX1LTwyRs55KIsTFDvD2gur62c5R5bpv6t02yJBvS9Pt6FACmEbxkfSaUp1nLcDU5Q19B7Ha8v33a91ClwZlXoj1UYYAtqvo6OkbX+GZwbhQ0RoFfAYIW3JVWEzxWKbCA0qFysRVjwJOtsFC2FqAYNCgDAkEhxNFg1LQ=

On Thu, 18 Sep 2025 09:03:17 -0700
Bart Van Assche <bvanassche@acm.org> wrote:

> On 9/18/25 8:58 AM, Ian Rogers wrote:
> > On Thu, Sep 18, 2025 at 7:05=E2=80=AFAM Marco Elver <elver@google.com> =
wrote: =20
> >> +config WARN_CAPABILITY_ANALYSIS
> >> +       bool "Compiler capability-analysis warnings"
> >> +       depends on CC_IS_CLANG && CLANG_VERSION >=3D 220000
> >> +       # Branch profiling re-defines "if", which messes with the comp=
iler's
> >> +       # ability to analyze __cond_acquires(..), resulting in false p=
ositives.
> >> +       depends on !TRACE_BRANCH_PROFILING =20
> >=20
> > Err, wow! What and huh, and why? Crikes. I'm amazed you found such an
> > option exists. I must be very naive to have never heard of it and now
> > I wonder if it is needed and load bearing? =20
>=20
> (+Steven)
>=20
> This is an old option. I think this commit introduced it:
>=20
> commit 52f232cb720a7babb752849cbc2cab2d24021209
> Author: Steven Rostedt <rostedt@goodmis.org>
> Date:   Wed Nov 12 00:14:40 2008 -0500
>=20
>      tracing: likely/unlikely branch annotation tracer
>=20

I still use it every year (enable it during December for a few weeks on my
workstation and server) and post the results publicly. When I get time, I
try to fix (add / remove) likely/unlikely statements. Unfortunately, I
haven't had time to look deeper at them.

 https://rostedt.org/branches/current/

This year I missed December and ended up running it in January instead.

-- Steve

