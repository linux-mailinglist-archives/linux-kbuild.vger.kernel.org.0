Return-Path: <linux-kbuild+bounces-5413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5C8A0766E
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 14:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DBAF18881CD
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 13:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7645A21883F;
	Thu,  9 Jan 2025 13:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVmUKx15"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45421BA2E;
	Thu,  9 Jan 2025 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427832; cv=none; b=DVIHlgPLuKixlipNgBFxM/TG66ytuRYVOaCekiXlBqcLmEkXBvXC12xxITJ8jPknu1zixzyC0UiU75e74QLYGm/dTfMgvQ+L5i3AXyzhFE3lgXgHKKsRD5EobIFZB7b905JOWIluP/xKVMqXBBYWZ91Fv/mwt0jMBQIxOf0scwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427832; c=relaxed/simple;
	bh=xZ0gVmDsstMSYzIv3w5jumTWe+H72YqJT/OlG8njRww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JltfLyC2AUWUiHvrZ33bhIb/myCFbXuyepGc7ZzqxxpCeODcO+DUxfZBYZZ0JNgFySmtRG8/0P6ikqWWf516+EXeVhtFTGXAcvZzwUb1xRMkjkfsm6XPbL9Y0rJgJji3wQnuhN+OVJS2PI0joh5sds3ZDWDh1PwROYlsiQ6k7CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVmUKx15; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AE1C4CED3;
	Thu,  9 Jan 2025 13:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736427831;
	bh=xZ0gVmDsstMSYzIv3w5jumTWe+H72YqJT/OlG8njRww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aVmUKx157wVFnijvEiQx/kkkJMAP7Q1/9OqCG1kELi6iXJX66FFMcft78tOx426o1
	 RAurfMs7z3W+TK/3ZaugmRtKFdnVCKBasqafw/vBlgu/kGEOfButbPLntvbjBlA6Yv
	 0glyuINURtPnKnVyxQJUBbEziD61FSNAIhSan1XbOp/m8pkifeX9DorcWhenE5/XYg
	 mdOqc5fOC69sX/jHTKIOXoirM59/Pt2s5nXfg90FOgNN+6Boi0VV3+VJQVmij2yHPO
	 UXIt6Cp1s6xLg3xVDX+yYpJ58MBcAfnXSDdep2eKpYrIZGKP/5Tlwv6ALGlTgVzZ/e
	 IIl9gwZpyLgNA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Luis
 Chamberlain" <mcgrof@kernel.org>,  "Trevor Gross" <tmgross@umich.edu>,
  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Petr Pavlu" <petr.pavlu@suse.com>,
  "Sami Tolvanen" <samitolvanen@google.com>,  "Daniel Gomez"
 <da.gomez@samsung.com>,  "Simona Vetter" <simona.vetter@ffwll.ch>,
  <linux-modules@vger.kernel.org>
Subject: Re: [PATCH v4 4/4] rust: add parameter support to the `module!` macro
In-Reply-To: <2025010953-saint-share-fc41@gregkh> (Greg KH's message of "Thu,
	09 Jan 2025 12:27:10 +0100")
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
	<20250109-module-params-v3-v4-4-c208bcfbe11f@kernel.org>
	<wC8h91AfnWSBFa03McC40iatGVtxZIiezOJ2etM0H4rvoRkvoI50VOELVTmhk3VDHjF7UR3rIlezUyHLP9H_aA==@protonmail.internalid>
	<2025010953-saint-share-fc41@gregkh>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 14:03:39 +0100
Message-ID: <87h6689m1g.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Thu, Jan 09, 2025 at 11:54:59AM +0100, Andreas Hindborg wrote:
>> This patch includes changes required for Rust kernel modules to utilize
>> module parameters. This code implements read only support for integer
>> types without `sysfs` support.
>
> I know you want to keep this simple for now, but will you have to go and
> touch all users of this when you do add the sysfs support later?  sysfs
> wants the mode of the file to be set here, so how do you think of that
> happening?

We would add the required fields to the `module!` macro as optional
fields. No need to touch everyone. Leaving out the sysfs file permission
field would cause the parameter to not show up in sysfs.

> And don't you need that for your null block driver?

Yes I need it eventually.

> Also, what about all the other "types" of module parameters that are
> currently able to be done, like call-back, hardware control, and unsafe?
> Are we just not going to do that for rust code (no objection from me,
> just wanting to be sure.)

Someone told me "no dead code", so I would defer those features to when
we have a user.

We have blueprints for strings and arrays based on Adams earlier
work.

I don't imagine any rust code relying on hw param and the use in the
kernel seems to be very limited.

Not sure about cb params. While it might be nice for the user to be able
to pass a callback to decode/sanitize , the same effect could be
achieved by putting the logic elsewhere. I don't have an idea of how to
implement this in Rust at the moment, but I am sure we can come up with
a solution if we need to.


Best regards,
Andreas Hindborg




