Return-Path: <linux-kbuild+bounces-7818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E887CAF0121
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 19:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21CA41C2750C
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 16:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BFA127CCCD;
	Tue,  1 Jul 2025 16:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjTP4Cjg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E02737EE;
	Tue,  1 Jul 2025 16:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388864; cv=none; b=BX+x4ffySt4bbArb3/lcOA2snvrusM1RGG6HbFrK3BuIXV9sptBmX5VS2iyiFVQfW1kWyfCeqbtav+NwCRuwmwEH0A4RF4viayc9WLPcVizHWJGxDxc24sRPJnvt6TD/Vyt3QWNP1HLkDHs0OfKxU1dp8qVvfFtYOXOpgl+wn8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388864; c=relaxed/simple;
	bh=1+3vg/zcoknj5CNtt2fI/fvugWzLylZAThTmozfd2T0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Bfaa8peOH7ELrh+VUwjLRaD+OdvwXj6vWCH/toI1d+9c7X85tY+8I8Py2HcUX8VVmpmYScQhMsiFv6UMHzUCl0ku7jfDCbPd7BomquZtSHRE/ezamwkPGm6uqzWzlW1sSQUCjWQ3ceuYHzugUKCsul4eGg8JbnNaa8aObEWYuAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjTP4Cjg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28305C4CEEB;
	Tue,  1 Jul 2025 16:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751388863;
	bh=1+3vg/zcoknj5CNtt2fI/fvugWzLylZAThTmozfd2T0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=cjTP4CjglFq69TzZto2YkmcX6/C7ZNv28mnh9AgDEuhJOIUT927ObGGXqas1KFbtM
	 f1C+fiZ3YupfXos9/wRxQJzsicUjKU7e6Ioh7MnV53rCAmRIaEYFEzSPHttRnjL4ZB
	 XKSsF9I02+8CvW5KukJooRRAZVtBvwzhuxW0C9oJfCTV5DhT7eUGKMsTXRBScDzB7W
	 etq9XgPFSr45JT32yhfr+03b8uG8bNsrveui1Cp6xt70R8w24RfW2wmPk5qBqINA+x
	 euU+wag8GoK/GZumIDc7W+9pG4QEorfu4prSu72NlqD7tiWKwVruPAZKbz7EG/K3Vv
	 xf07OWDySblvQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 18:54:16 +0200
Message-Id: <DB0VJ9HRT0VG.GT9HOT7J29EL@kernel.org>
Cc: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Masahiro Yamada" <masahiroy@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Trevor Gross" <tmgross@umich.edu>, "Adam
 Bratschi-Kaye" <ark.email@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Greg KH" <gregkh@linuxfoundation.org>, "Fiona
 Behrens" <me@kloenk.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v13 2/6] rust: introduce module_param module
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
 <DARCZYNPIJVZ.3JJSZ6PSAEMEC@kernel.org> <877c126bce.fsf@kernel.org>
 <Mg1_h6lRpg9tdi0VjiyDfIEy2juzgDWxOhYX61qSUfyEpeMMksWW1e-blTka_G1dXUvpZVktdD-zL3X1a6T6Cg==@protonmail.internalid> <DATW0XWNN45X.1L2WMZ41JJ5O8@kernel.org> <87v7om4jhq.fsf@kernel.org> <RPPvXQKnjK77Kp9mKaiFxbNj1fTHKb_I7_nbY81fZop-Wz8n5TTi4_lpXP9U9AwjocvZKqJPI8PGKufJn9cIzQ==@protonmail.internalid> <DAU0J3T0IEVM.2K7ZRQOVOHF8H@kernel.org> <878qlh4aj1.fsf@kernel.org> <87plepzke5.fsf@kernel.org> <xFouVLxX1_t1mH69FDYwlIhBlI72M0IzQEKn0ntG_wT9z7V5DtbxiwVP_frH_yiS-Gf0q_AhqetbLmuvJ_yP5Q==@protonmail.internalid> <DAX65TRN0TGP.25VZ9DYV86XWY@kernel.org> <87wm8txysl.fsf@kernel.org> <9G3W1seaM7elcwWXaeoaa2nfpFYCf-AmBdvZhACGP13KGUtTPVMwGNYdTQsdtp8ru7GIP3-UYTzXscC1MRUKrg==@protonmail.internalid> <DAZV8OGL8BMH.11SLXBXQ17ZJ9@kernel.org> <87h5zxxtdw.fsf@kernel.org> <H78pT7YnQEhAXdxzl_hhnGVUiQuFpibB21_bjH658fMz_5JYbwsPLYYVh8u1gYnzK3N3ilTEAvqOpkuptVx3rg==@protonmail.internalid> <DB03MZI2FCOW.2JBFL3TY38FK@kernel.org> <87bjq4xpv7.fsf@kernel.org>
 <ffROWpeKczrWSBlKYov2atJG-QD5l5fUOb2dVCNkWlcT9h6DJpa4joGQpjqtYyLP7HX227fCAayyDQunZ464XQ==@protonmail.internalid> <DB0LKI8BO3HZ.3FF03JN4364RM@kernel.org> <87zfdovvz4.fsf@kernel.org> <DB0U12HAEVZ6.JKFPI2UQHDRY@kernel.org> <CANiq72kFUSFgBv7Es3Mhe4HUaSPZk0EVW=JaMdaAGHsQOxYN6w@mail.gmail.com>
In-Reply-To: <CANiq72kFUSFgBv7Es3Mhe4HUaSPZk0EVW=JaMdaAGHsQOxYN6w@mail.gmail.com>

On Tue Jul 1, 2025 at 6:27 PM CEST, Miguel Ojeda wrote:
> On Tue, Jul 1, 2025 at 5:43=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>>
>> Ultimately this is something for Miguel to decide.
>
> Only if you all cannot get to an agreement ;)

:)

> If Andreas wants to have it already added, then I would say just mark
> it `unsafe` as Benno recommends (possibly with an overbearing
> precondition), given it has proven subtle/forgettable enough and that,
> if I understand correctly, it would actually become unsafe if someone
> "just" added "reasonably-looking code" elsewhere.

Yeah, if we added code that ran at the same time as the parameter
parsing (such as custom parameter parsing or a way to start a "thread"
before the parsing is completed) it would be a problem.

> That way we have an incentive to make it safe later on and, more
> importantly, to think again about it when such a patch lands,
> justifying it properly. And it could plausibly protect out-of-tree
> users, too.
>
> This is all assuming that we will not have many users of this added
> right away (in a cycle or two), i.e. assuming it will be easy to
> change callers later on (if only to remove the `unsafe {}`).

Yeah we would add internal synchronization and could keep the API the
same (except removing unsafe of course).

---
Cheers,
Benno

