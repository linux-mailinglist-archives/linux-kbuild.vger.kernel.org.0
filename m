Return-Path: <linux-kbuild+bounces-8907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D82B86EC5
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 22:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7342566A83
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Sep 2025 20:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE1029E0ED;
	Thu, 18 Sep 2025 20:37:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284092D63FF;
	Thu, 18 Sep 2025 20:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758227833; cv=none; b=tiDxDeFl/yy+KmiA8Wh9a7c7KJjQOt1TSdLZiZ0sxvaLJ3TJtOSDCqrFR5RFK2gDMYzZuHnVNYOpgfxObY4KLN+tS2dY7dvYb8UsqbzMeTpH9j7EKRAcd+VAqH+Aqhgtsni1o/Z05QEsr8unXo4B0DskdfveUXSQ7ElG3iL1FjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758227833; c=relaxed/simple;
	bh=K4mBwSrBNcKyhAm8gbEHryo4PTBkpR7Q30/ZWeXHl1I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V+UIXSbqTa16v04yCupiVXIUlIwsc1ePqF6QmiyG1QlhxnYlV7zG1a+Of9PDn8PfFKsuVjbBS2iSaDn56T2YZ3TD3VvKJbywK/2IgFPA9IfvAB5Ef8Ns/heq8pFizo9ZmRtJ7vwL8JmIuwVhJi8N/80y5Fk4fIrxoxxHAuuoyVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 8E6D31604ED;
	Thu, 18 Sep 2025 20:37:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 9D9BE6000D;
	Thu, 18 Sep 2025 20:36:44 +0000 (UTC)
Message-ID: <13389786a2a121c21a6f4940b4acf09fad53a3d9.camel@perches.com>
Subject: Re: [PATCH v3 05/35] checkpatch: Warn about capability_unsafe()
 without comment
From: Joe Perches <joe@perches.com>
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, Will
 Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck	
 <luc.vanoostenryck@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Alexander Potapenko	 <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Bart Van Assche	 <bvanassche@acm.org>, Bill Wendling <morbo@google.com>,
 Christoph Hellwig	 <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric
 Dumazet	 <edumazet@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, Ian Rogers	 <irogers@google.com>, Jann Horn
 <jannh@google.com>, Joel Fernandes	 <joelagnelf@nvidia.com>, Jonathan
 Corbet <corbet@lwn.net>, Josh Triplett	 <josh@joshtriplett.org>, Justin
 Stitt <justinstitt@google.com>, Kees Cook	 <kees@kernel.org>, Kentaro
 Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn	 <lukas.bulwahn@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, Nathan
 Chancellor	 <nathan@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa	 <penguin-kernel@I-love.SAKURA.ne.jp>, Thomas Gleixner
 <tglx@linutronix.de>,  Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki
 <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Date: Thu, 18 Sep 2025 13:36:43 -0700
In-Reply-To: <20250918140451.1289454-6-elver@google.com>
References: <20250918140451.1289454-1-elver@google.com>
	 <20250918140451.1289454-6-elver@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 9D9BE6000D
X-Stat-Signature: py53mcfac346e64tk9rcf8ugswnwrn9n
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+Psz6mclmN7I07c5jPtb/CcemQyIEeoMA=
X-HE-Tag: 1758227804-881299
X-HE-Meta: U2FsdGVkX1+3ZResTrAAf9g9L6dJTCgmeXzyM4kYyOanBXCbxLPKLUzexU279fp4Uk1s32nIlGL7ALFntG4iQsakleJTeVRQim4oreS1teDe2c1v+Yr3chddZziKPoDc++AISXJQPhyq2w3G+YXN9VlSwrMnsmWf2JBDP+6EKscCwfkdUqEPS2c1jIOhGC9JFL5oLKZVp7yaxDYTVOVvcxJD81BMXbf5A4qGtQvLNkMWZnMoJtyHKmlojlv7i6K2T4g5I4c9AZ5UYsKsHO+RYQ2ZU++uSS7Q3j7El4OW8jbzA/Y7Pj1Sh8vbE9tWV5T5

On Thu, 2025-09-18 at 15:59 +0200, Marco Elver wrote:
> Warn about applications of capability_unsafe() without a comment, to
> encourage documenting the reasoning behind why it was deemed safe.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -6717,6 +6717,14 @@ sub process {
>  			}
>  		}
> =20
> +# check for capability_unsafe without a comment.
> +		if ($line =3D~ /\bcapability_unsafe\b/) {
> +			if (!ctx_has_comment($first_line, $linenr)) {
> +				WARN("CAPABILITY_UNSAFE",
> +				     "capability_unsafe without comment\n" . $herecurr);

while most of these are using the same multi-line style
I'd prefer combining and reducing indentation

		if ($line =3D~ /\bcapability_unsafe\b/ &&
		    !ctx_has_comment($first_line, $linenr)) {
			WARN(etc...

