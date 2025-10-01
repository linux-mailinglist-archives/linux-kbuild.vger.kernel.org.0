Return-Path: <linux-kbuild+bounces-8991-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D909BAF2A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Oct 2025 08:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDCC02A0B6C
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Oct 2025 06:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DE027B334;
	Wed,  1 Oct 2025 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFr2iLw3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F41242D60;
	Wed,  1 Oct 2025 06:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759298411; cv=none; b=R1qwfcWwokdcDeRCmAqWG7wDK7geCCmRFHAAZUyTbUMMVthZ6mxFPMoa4W05xsCUtlvICJAfy2vZ6KUhzsqdNYajCZJN/dix/FeG4vJApZsoiprT4WP1uSqliwSXWHIZpj2JQcv9y+bLgLdkGxpFzh9ZvRXWc9x2RKb5mw4MOBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759298411; c=relaxed/simple;
	bh=tX3W4sS6g+fbHZHPYibXiAaWLtvO7ViWxdZMFzQElRM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=l+21+yhv/jMjlDgNHbAjc5zUzlt682g+Jz+KPmSHJVn9/h/1WRx0/nZhNgAJ4+0Sa4K8xBHoLCy04nQAZ4CHsvULN/hq1xtcNPsqsI4b7gVR9MZ9wf/mPLmhNE31FBncTEgYBdw86oXRlXsEv/Ubh8YuDPbuegKxPzY96YMsjBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFr2iLw3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE86C4CEF4;
	Wed,  1 Oct 2025 06:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759298411;
	bh=tX3W4sS6g+fbHZHPYibXiAaWLtvO7ViWxdZMFzQElRM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=kFr2iLw3eY+CaGq9+3amCiVaeIz1zKmFyUba50HisCQ0+cMsn1Fb092Z00Sp+Kg2f
	 NX1WxIc/NRc8Qk86dciuOxqbkjzlve22B53ax0ktEWKsjJcJRowCfy4etPyA5axwzO
	 S4FwtG++A8CkTnuXM5FXA3sx56A5BrbAF4ov4RhIK0e8pGDK+C0OBkfT8psvx+3CGQ
	 H9cdn4YEjPQlkJcKh/tEbNxgWnP3u1auyZ3X96O0w68Ug/ED0psw1v9Lpz8UvBm9AY
	 gdNlRjVW5y/dRCSazAuWHF892b7vGKVlwVnHNOxNn5K+IJed07dIvg+N5V2aeJdtJH
	 nXIqS1E6fOpdQ==
Date: Tue, 30 Sep 2025 23:00:07 -0700
From: Kees Cook <kees@kernel.org>
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Vegard Nossum <vegard.nossum@oracle.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Petr Vorel <pvorel@suse.cz>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: Avoid prompting for transitional symbols
User-Agent: K-9 Mail for Android
In-Reply-To: <01f772073dba88daf7f5acd824d10fc37412c99e.camel@linux.ibm.com>
References: <20250930154514.it.623-kees@kernel.org> <01f772073dba88daf7f5acd824d10fc37412c99e.camel@linux.ibm.com>
Message-ID: <B1170B95-F9B4-43F5-90A7-B31076CDA3F3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 30, 2025 9:21:07 PM PDT, Andrew Donnellan <ajd@linux=2Eibm=2E=
com> wrote:
>On Tue, 2025-09-30 at 08:45 -0700, Kees Cook wrote:
>> The "transitional" symbol keyword, while working with the "olddefconfig=
"
>> target, was prompting during "oldconfig"=2E This occurred because these
>> symbols were not being marked as user-defined when they received values
>> from transitional symbols that had user values=2E The "olddefconfig" ta=
rget
>> explicitly doesn't prompt for anything, so this deficiency wasn't notic=
ed=2E
>>=20
>> The issue manifested when a symbol's value came from a transitional
>> symbol's user value but the receiving symbol wasn't marked with
>> SYMBOL_DEF_USER=2E Thus the "oldconfig" logic would then prompt for the=
se
>> symbols unnecessarily=2E
>>=20
>> Check after value calculation whether a symbol without a user value
>> gets its value from a single transitional symbol that does have a user
>> value=2E In such cases, mark the receiving symbol as user-defined to
>> prevent prompting=2E
>>=20
>> Update regression tests to verify that symbols with transitional defaul=
ts
>> are not prompted in "oldconfig", except when conditional defaults evalu=
ate
>> to 'no' and should legitimately be prompted=2E
>>=20
>> Build tested with "make testconfig"=2E
>>=20
>> Reported-by: Linus Torvalds <torvalds@linux-foundation=2Eorg>
>> Closes:
>> https://lore=2Ekernel=2Eorg/lkml/CAHk-=3DwgZjUk4Cy2XgNkTrQoO8XCmNUHrTe5=
D519Fij1POK+3qw@mail=2Egmail=2Ecom/
>> Fixes: 05020835c86e ("kconfig: Add transitional symbol attribute for mi=
gration
>> support")
>
>I think this should be f9afce4f32e9=2E

Indeed=2E I fixed this before I pushed it to -next; thank you!

-Kees


--=20
Kees Cook

