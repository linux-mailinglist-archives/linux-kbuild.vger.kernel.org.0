Return-Path: <linux-kbuild+bounces-5046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8606A9E8DB6
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 09:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41CBA2813FF
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 08:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615602156FF;
	Mon,  9 Dec 2024 08:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPzpjm6I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C356136357
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Dec 2024 08:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733733819; cv=none; b=fdrFwzGoNJZ2AEfQ8z37vR1eJhvHFUVlkRUPup8rVDZqwG8vH1lFnNs5OuArbHlcCmN2d/IX6ON/8m+WN32jMYHoT57oK30XDO+4wNg45KahtnzSPQN9OThOopyxI8Nban5NG2IURuVVbxuLyql2ESHrUfKrJ77ozxFTAKyU2Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733733819; c=relaxed/simple;
	bh=SSGLGSr9h7m0Q5b9WJaaH1BlWAJiiIIUGMmGk43sh7U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=vAhBY4jsPSGoM0Fz5BJypgJ/c2GJHWfoWfKeXFGkd7Au3JAXEVT36B/xerxPkhZqtF8/Khk6LD/rtXmuyFSE7hcN5T1a4OlmhqGl1mV5ytwbi0CbKK+lTi4EYX3e48toZbSMX0FKfhb2JtsiQqikoWvLC+fahFvkUX1P3onuMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPzpjm6I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A087EC4CED1
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Dec 2024 08:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733733818;
	bh=SSGLGSr9h7m0Q5b9WJaaH1BlWAJiiIIUGMmGk43sh7U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qPzpjm6IOhE8E+vkyhtl2A1Cna8AjVY73zALFsPxCHQEiwkgaOhU01/lk3lx3I80s
	 OfUcx135GrBfxeoXAR4ntxY+vXTmq8wrBNYDde6KJJ/CpSaKpBOX8pwfc0PPBcNoOO
	 9m6HmqISQbtL4+AwNcMOp9WOHBncBsvlmSymkq7OVP+WwP5XC08VyNKMLQIsTuInU4
	 myu02h31TVnM9iB4L067OsvSSJyWDAZuB5kjHmJYmSVWranzbcHTIjKhbzLSewY4Pp
	 T48Yr/BmSCCN+0HcpFcr9aCWeg0gDYLDQDSaFUSmvae8GEkKHK90+vyUujGU0WaskW
	 Ol0b03RZ7REJg==
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9A4BB1200074;
	Mon,  9 Dec 2024 03:43:37 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-03.internal (MEProxy); Mon, 09 Dec 2024 03:43:37 -0500
X-ME-Sender: <xms:ua1WZxCggoTIFRnZOrAwUX_TQaVLGwSCyY9ji_pRLu3xDjK9gmxFEA>
    <xme:ua1WZ_iiIn6Uxcs5YbGMJhUmIknnsLn0Eh4uYdgybET2lVIMZ2wv8qGwtxYTgq4Rl
    V0I8_2f-1cEqXwpRbM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeeggdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfnfgvohhnucftohhmrghnohhvshhkhidfuceolhgvohhnsehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdehueetudeljeejueeljeefhfeludff
    hefhhfdvgfetjefgtdeiffeuheetvdffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
    dpghhithhhuhgsrdgtohhmpdguohdqsghuihhlugdrphihpdhsthhonhgvrdguvghvpdhp
    hihthhhonhdrohhrghdpshhusghprhhotggvshhsrdgtrghllhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlvghonhdomhgvshhmthhprghu
    thhhphgvrhhsohhnrghlihhthidquddvfedtheefleekgedqvdejjeeljeejvdekqdhlvg
    honheppehkvghrnhgvlhdrohhrgheslhgvohhnrdhnuhdpnhgspghrtghpthhtohepfedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:ua1WZ8mLKhf6jx1NRgaAo9LEzum12zjHNzD_KjDxp1cqIjpNkZkTEw>
    <xmx:ua1WZ7yG44YR59e7_zkGHthwyaWhI7xwlZlFAdwt9SahiVffmfM-SA>
    <xmx:ua1WZ2QKgVMQPWpA6FhnnJoRW47cuGnlw29QMCclhRUG3As9PF9LnQ>
    <xmx:ua1WZ-bgXUpAgxHvYr5k04kYe0NcAT-vitUhb2pRSRIRd3MQ4jWZkQ>
    <xmx:ua1WZ3T3rDyam9xqioKfr4lGnIGAOJrgdZ6oxLO2K44pU7yADOYWYr6G>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A3361C20067; Mon,  9 Dec 2024 03:43:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 10:43:17 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Masahiro Yamada" <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <c73891e5-13f6-4ca4-964a-a453a24cd6b8@app.fastmail.com>
In-Reply-To: 
 <CAK7LNASYp+LWyfF78rc3V=ZpR1iu9gZBj4npuE6Md86X0KcWOQ@mail.gmail.com>
References: 
 <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
 <CAK7LNATU2OKEWh6p9QuUXtYmYmqTkN5nspBq9DbCh9yUjqW5xA@mail.gmail.com>
 <20241204084943.GM1245331@unreal>
 <CAK7LNATGbTxu9cYGfW6FK5VFfJ2+ut_e1dSFOfo+q6CgM4XHtQ@mail.gmail.com>
 <20241208163557.GA1245331@unreal>
 <CAK7LNASYp+LWyfF78rc3V=ZpR1iu9gZBj4npuE6Md86X0KcWOQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next] kbuild: Respect request to silent output when merging
 configs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, Dec 9, 2024, at 07:34, Masahiro Yamada wrote:
> On Mon, Dec 9, 2024 at 1:36=E2=80=AFAM Leon Romanovsky <leon@kernel.or=
g> wrote:
>>
>> On Sun, Dec 08, 2024 at 11:49:12PM +0900, Masahiro Yamada wrote:
>> > On Wed, Dec 4, 2024 at 5:49=E2=80=AFPM Leon Romanovsky <leon@kernel=
.org> wrote:
>> > >
>> > > On Wed, Dec 04, 2024 at 05:25:50PM +0900, Masahiro Yamada wrote:
>> > > > On Tue, Dec 3, 2024 at 10:55=E2=80=AFPM Leon Romanovsky <leon@k=
ernel.org> wrote:
>> > > > >
>> > > > > From: Leon Romanovsky <leonro@nvidia.com>
>> > > > >
>> > > > > Builds with -s option (silent) are supposed to silence all ou=
tput
>> > > > > which is not an error. It is the case for target builds but n=
ot
>> > > > > for configs. These builds generate prints like this:
>> > > > >
>> > > > > =E2=9E=9C  kernel git:(rdma-next) make -s defconfig debug.con=
fig
>> > > > >  Using .config as base
>> > > > >  Merging ./kernel/configs/debug.config
>> > > > >  #
>> > > > >  # merged configuration written to .config (needs make)
>> > > > >  #
>> > > > >  ...
>> > > > >  Value of CONFIG_FUNCTION_TRACER is redefined by fragment ./k=
ernel/configs/debug.config:
>> > > > >  Previous value: # CONFIG_FUNCTION_TRACER is not set
>> > > > >  New value: CONFIG_FUNCTION_TRACER=3Dy
>> > > > >  ----
>> > > > >
>> > > > > Let's honor -s option and hide all non-error output.
>> > > >
>> > > >
>> > > > Is it necessary to add the --quiet option to every script?
>> > > >
>> > > > Kbuild already provides a generic way to suppress the stdout
>> > > > with 'make -s'.
>> > > >
>> > > > The following code works for me.
>> > > > 'make defconfig debug.config' is as verbose as before.
>> > > > 'make -s defconfig debug.config' is really silent.
>> > >
>> > > This is exactly what I'm doing. I'm using -s option and added -q =
to very
>> > > specific merge_config script, because "-s" is already in use in t=
hat
>> > > script.
>> > >
>> > > Before my change on 40384c840ea1 ("Linux 6.13-rc1"):
>> > > [leonro@e534d5fa4327 kernel]$ make -s defconfig debug.config
>> > > Using .config as base
>> > > Merging ./kernel/configs/debug.config
>> > > Value of CONFIG_DYNAMIC_DEBUG is redefined by fragment ./kernel/c=
onfigs/debug.config:
>> > > Previous value: # CONFIG_DYNAMIC_DEBUG is not set
>> > > New value: CONFIG_DYNAMIC_DEBUG=3Dy
>> > >
>> > > Value of CONFIG_PRINTK_CALLER is redefined by fragment ./kernel/c=
onfigs/debug.config:
>> > > Previous value: # CONFIG_PRINTK_CALLER is not set
>> > > New value: CONFIG_PRINTK_CALLER=3Dy
>> > > ...
>> > >
>> > > After my change:
>> > > [leonro@4dd2c2078dff kernel]$ make -s defconfig debug.config <---=
 silent
>> >
>> >
>> > Not sure if you checked the attached code diff in my previous reply.
>> >
>> > To make my question clearer, does this suffice your needs?
>> > https://lore.kernel.org/all/20241208144622.605523-1-masahiroy@kerne=
l.org/T/#u
>>
>> Unfortunately no, as both my development suite and our CI rely on
>> merge_config script to create right config.
>>
>> In CI, they run add very specific config options to already
>> well-established .config.
>> In my development suite, I'm removing extra options with merge_config
>> script.
>>
>>         subprocess.call(cmd + ['defconfig', 'kvm_guest.config', 'nopm=
.config', 'debug.config'])
>>         subprocess.call(['scripts/kconfig/merge_config.sh', '-y', '-m=
', '-q',
>>                          '.config', '/plugins/kernel.config'])
>>         subprocess.call(cmd + ['olddefconfig'])
>>
>> https://github.com/Mellanox/mkt/blob/master/plugins/do-build.py#L19
>> https://github.com/Mellanox/mkt/commit/26d7cbd776f508ab506f6d33cfe0e9=
b0bf44d557
>>
>> I need both chunks, silence make ... and silence merge_config script.
>
>
> You are no longer talking about 'make -s'.

Yes, I killed two birds with one stone.

>
> "> /dev/null" is the standard way to suppress stdout, but you do not u=
se it.
>
> Similarly, subprocess.call() supports stdout=3Dsubprocess.DEVNULL
>  https://docs.python.org/3.13/library/subprocess.html#subprocess.call

No problem, will do it.

>
>
>
>
>
>
>
>> Thanks
>>
>> >
>> >
>> > --
>> > Best Regards
>> > Masahiro Yamada
>
>
>
> --
> Best Regards
> Masahiro Yamada

