Return-Path: <linux-kbuild+bounces-10137-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 597FFCC7EF4
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 14:45:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3F6130521E0
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 13:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8F434B697;
	Wed, 17 Dec 2025 13:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b="YYYsYcN4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bheJ8eIJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949C34A765;
	Wed, 17 Dec 2025 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976588; cv=none; b=ugQQAKPrutzHvRf7u7hQiP9i53FN+d6uxk0O9YiDr7lPtFiZN/eahXsqm/XGJj1AuIqVPVjGT/KhoEVVTFJlZzTyuvNYnuQKRDjUaXeRV0va3yeSw4YmbqKPEDG1ZrYb+DK7cQvTptLqYdPy6OVCuZlKD5q914unlarCD96jMr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976588; c=relaxed/simple;
	bh=KNOMpTz18c9hFEaslPIYk+SnMJnEqNf33j+qfUPXLYQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=jJEhClVULXvGk/44FZ/yl18+mV2Ka0QY/32+wjl+grBkimp6R1WtCAx6LqHAftnWbauvKonZNa7CDgCUhG808lD97nu/fLpxFKjK9CKVJjne/lVUnlRPQTXJHUxfeLNOMOUDJvglD0+/YMQ/GqAZhcJ1BhsuAJWYNXV0AejVFnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io; spf=pass smtp.mailfrom=likewhatevs.io; dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b=YYYsYcN4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bheJ8eIJ; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=likewhatevs.io
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 187B41D0012E;
	Wed, 17 Dec 2025 08:03:05 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 17 Dec 2025 08:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=likewhatevs.io;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1765976584; x=1766062984; bh=zDPnXRk/obdUY0LwllUsd/ief7O0CzZY
	dZxbE8dX5w4=; b=YYYsYcN4YC/LX8WsjJgtK0AceWIcGyScAlw44yqx9Aoc483X
	cc7AjAU06lBpyWKjywu1ZdtgJyYI5GG7/j24x9YPme4TwJ9bMjlkXAHzvKP0J4Wb
	/zMy8uUQppx6Q2AQMIutTMdeLsDZMdVG6rLIPQzzDeuy5Jst2t6Tn6QdczNtCAjy
	H7aeUPeyMS2G4mFSxPwWLW7XJvyXhTuMxdrqwNVhWASo6oJKZNRCRapgoXeY6a40
	3e3tRrphoiX3zwta+WK+O/KVwHQYELwLXjtAe/A+njyPpx0lPjRJn/2eNWX6G7xy
	digzByZhlW2ttlvnoZXiLCxUP6pV+tMFa7ogsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1765976584; x=
	1766062984; bh=zDPnXRk/obdUY0LwllUsd/ief7O0CzZYdZxbE8dX5w4=; b=b
	heJ8eIJ0mlbpzGYc2Yvd6yUd8zNbG7cEV8SK8RX4D1vLuF+i6KC0SmgbveZvoWSn
	OHIn+xZ46DnKEfEQ17pJofwfka1OVKeq/kKMI7qCC/UkvQDCVQil/dzJdIKDNJ+9
	TJ95ChRdRNZjzTJr7MZuf+4GWNGtEK9wFduMVmmlZL7Br5JEwO8/KCJsCVwR4SIb
	8Bbb0E/lVkjQtg5RYG+rO9kSdKIFxo3wJwfUeX3LONkiuZPre9iUuCgGQvUV9v8C
	HUQ0s0KRraZeVTozP7nI5FY9KwCtYzOkrF5RV5FTFEb66aOz1juDIbdiFsxapnPS
	VrxJ6kpBi3QwraC6N5bmg==
X-ME-Sender: <xms:CKpCaTnM9xqk5h10KNTaQBsk5GHmc4yDdBYN72w8ujQ7sigkzMC6bw>
    <xme:CKpCac2hi6iHA1s-o8I_FmtkGzZZ6XXmYVBEd1yTGNNQsjcqQ7g_IQ3D2pCy8xggo
    Z46tfslwL9mPtaRzculbweSOt_lpyg4siEK7P4X9-lZxICjSW88KwfQ>
X-ME-Received: <xmr:CKpCaUd7jrmtkdOI4-0PlKMp47gzZS5KLuNWvt_3x0la1SJaBynPHHi-MIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegvdeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpegggfgtfffkuffhvfevofhfjgesthhqredtredtjeenucfhrhhomhepfdfrrghtucfu
    ohhmrghruhdfuceophgrthhsoheslhhikhgvfihhrghtvghvshdrihhoqeenucggtffrrg
    htthgvrhhnpeeijeevgfeileetudefleejvddtkeegveffkeeugfdtgfeuieeivdeilefg
    teejteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghtshhosehlihhkvgifhhgrthgvvhhsrdhiohdpnhgspghrtghpthhtohepuddtpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopeguvhihuhhkohhvsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    nhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrthhsoheslhhikhgvfihhrg
    htvghvshdrihhopdhrtghpthhtohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhope
    htohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:CKpCaeZXUv4kNAUA-LGwdfvTyugIrbVnZ4LktSMLTRPwmPR3aCpiNw>
    <xmx:CKpCaRHTikkqEQdujcdpF6AfKzikgWE4_BXVMq1OBynpLD-K_MXgvQ>
    <xmx:CKpCaUmq4b3_dTwa7m-g2wPChReEfa1MRcH9Wi_RmldrXgWbu7J22A>
    <xmx:CKpCacdardg49uqtMLSouDX8DbgbZgXJ31QFxWL38XWJpUZgX6rt8Q>
    <xmx:CKpCad6wbiGHKQ2qib4Vtu-4NveG4apzMYn25x_oqg7zzKNVWEe-I9iw>
Feedback-ID: i7f194913:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Dec 2025 08:03:04 -0500 (EST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 08:03:03 -0500
Message-Id: <DF0IGATZ1PFD.C4MMH0JG9IK6@likewhatevs.io>
Subject: Re: [GIT PULL] kbuild changes for v6.19
From: "Pat Somaru" <patso@likewhatevs.io>
To: "Dmitry Vyukov" <dvyukov@google.com>, "Nathan Chancellor"
 <nathan@kernel.org>
Cc: "Nicolas Schier" <nsc@kernel.org>, <patso@likewhatevs.io>, "Justin
 Stitt" <justinstitt@google.com>, <eddyz87@gmail.com>, "Linus Torvalds"
 <torvalds@linux-foundation.org>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <aS22QhwdrHN24ToD@levanger>
 <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
 <20251217083202.GA2118121@ax162>
 <CACT4Y+bsiPfmL-yV99mLCA4n7ukYwS-6E7kTcLg1EOxOQ_cZjg@mail.gmail.com>
 <CACT4Y+aFSLS95qtpWQ0UjVU3wZ+svi2igLh_SoOqQec_Zwg7Mw@mail.gmail.com>
 <20251217104517.GA3546346@ax162>
 <CACT4Y+ZCvNu+-_FT=FMA6icB6x+2_E5-zo--PDnwR5X7tQ7O7w@mail.gmail.com>
In-Reply-To: <CACT4Y+ZCvNu+-_FT=FMA6icB6x+2_E5-zo--PDnwR5X7tQ7O7w@mail.gmail.com>

Hi All,

>> itself to fix this. Again, unless Pat can come up with some way to work
>> around this (which I do not personally see at this point), I think we
>> would be better off just reverting 9362d34acf91 outright and calling the
>> situation of including .c files within other .c files broken for
>> compile_commands.json and returning to the status quo from 6.18 and
>> earlier.

I would say revert this.

When I was testing this change, I wrote a script to non-interactively
run clangd against all the files in the kernel individually and report if=
=20
there were more errors or fewer and how many files clangd gave up on indexi=
ng.

I vaguely recall this script reported there were more errors overall, but a=
lso
that there were fewer files which clangd gave up on indexing (i.e. fewer
files where LSP more/less outright does not work)/more files processed
overall.

My understanding of that output was "folks's ide's/clangd works on more fil=
es
with this, but there are more errors overall because fewer files are
treated as totally broken/given up on by clangd".

If there are only a handful of problematic files with this, I can see if
there are some common patterns (such as c files including themselves) which=
=20
could be accounted for in the script, but if the outputs of
gen_compile_commands are used as inputs to further automation, both issues=
=20
with the script itself and those in files previously excluded due to the=20
omission of compilation database entries are going to be surfaced by this, =
and
I'm not super confident I could come up with a complete set of fixes for th=
e
latter.

Have a good day,
Pat

On Wed Dec 17, 2025 at 7:07 AM EST, Dmitry Vyukov wrote:
> On Wed, 17 Dec 2025 at 11:45, Nathan Chancellor <nathan@kernel.org> wrote=
:
>>
>> On Wed, Dec 17, 2025 at 11:16:37AM +0100, Dmitry Vyukov wrote:
>> > Yikes! I am trying to workaround this, but this is PITA.
>> > Entries are not in order, + there are now multiple entries for the
>> > same source file (yes, files include themselves). This is plain
>> > broken, and hard to workaround. Even if I find the entry that is
>> > correct, I can't really tell about it to a clang tool since it accepts
>> > just the source file name, and there are multiple entries for the same
>> > file name.
>> >
>> > Does anybody see a reasonable way to undo what this commit is doing?
>>
>> Does
>>
>>   $ git revert 9362d34acf91a706c543d919ade3e651b9bd2d6f
>>
>> not work for you? It is a clean revert for me.
>
> I am not typing commands in the console, I work on an automated system
> that does not have a notion of "also do these custom changes to the
> source tree at this particular point in the process".
>
>> > Thinking about this: I think included source files should be treated
>> > as include files by anything, rather than added to the database. They
>> > _are_ include files, and systems should handle include files already.
>>
>> The commit message of 9362d34acf91 mentions that clangd does not work
>> properly with the files that are included in kernel/sched/build_policy.c
>> (such as kernel/sched/ext.c) because there are no entries for them in
>> compile_commmands.json (so it does not know how to build them),
>
> The same stands for e.g. include/linux/sched.h.
> kernel/sched/ext.c is just not a source file, it is a header file effecti=
vely.
>
>> which is
>> what 9362d34acf91 was trying to fix. I don't use clangd or
>> compile_commands.json, so I can't say if there is a way for the tool
>> itself to fix this. Again, unless Pat can come up with some way to work
>> around this (which I do not personally see at this point), I think we
>> would be better off just reverting 9362d34acf91 outright and calling the
>> situation of including .c files within other .c files broken for
>> compile_commands.json and returning to the status quo from 6.18 and
>> earlier.
>>
>> Cheers,
>> Nathan


