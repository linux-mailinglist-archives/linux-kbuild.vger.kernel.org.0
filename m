Return-Path: <linux-kbuild+bounces-5665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50887A2CABE
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 19:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9353F188C2B6
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 18:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579B8199EB7;
	Fri,  7 Feb 2025 18:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9N80+iQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2949C8479;
	Fri,  7 Feb 2025 18:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951501; cv=none; b=ugRtIWnBn6FiSo3k3idy8c3NXIqSS83AgsoaOVtUt134XkQINLJzpcB9yLzzp3H3THFq4m+fX/Mm6RX7EW2qopn6YBJZvIW1ngIYsDWQwpEO90FBZPuIDYiw2owCgRad4aNI3/Kq4PkQCLquxhKuz2OlOTursO6XdUpZm93XuQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951501; c=relaxed/simple;
	bh=vxDcpZboLVW/aH0FGJw+5R5kXjImOV5NYrtw1W4ikYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoKf34VGU0OKRgPEEsujQcjfd0E/SlE4RvT/HOKhp9F2Nz1atVDCNBN+3TaTdpjIrktJzYE4NjV65zqhJtHgOjs8+OGB4b4Al98suSVVjBsKu1ZKyoV5kbQLJBbH0ER9SFg5rekygDvGAjvZvt0Ho66jvfD401x8pTciIggpmEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9N80+iQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942B1C4CEEA;
	Fri,  7 Feb 2025 18:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738951500;
	bh=vxDcpZboLVW/aH0FGJw+5R5kXjImOV5NYrtw1W4ikYo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h9N80+iQ9hvYUc99nM2KSz9WvHhYld548a5ArDMqsjM4IWnryFGyYcrvRQQ2l66Cx
	 V8bUn9+tzGv3AjbkFse/Zdzz4g/nzwKezrmdxzZ/PL4dizkiL/nJSeCldLXCT6zd/L
	 DxtozOXBY0LjUG/2Qvupi+lQNNmoSUaTDFN+XxkDVUJIyKgw9yUtNRU0Z6o/UKMFvT
	 UmSGuKWlLv9IIv/jm8iWJk38FYdHZpvNh5HHpNTAZkkjr5mHbqZUn80jUjV0taYsmV
	 I1656viedNYHNuvYVSXI5VHofNdBfkap0x9YsGsPWcmfiWK1SIzo1++kQMA5AnOKt8
	 scxVrjw5ectPw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-307d9a13782so20035891fa.2;
        Fri, 07 Feb 2025 10:05:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5GDv95ruPlePj+qxmcnwwMTIThL25AuU5ZPc82Ke5jU51PbS+jsmKrwXFxudBv0p3GArQblPZhSuEcLc=@vger.kernel.org, AJvYcCWI9IP9l/mjnA4BH7gDD4bk28rpgsbCAF5sQgSnfKPGzc1jw+ZPJgE3Uth4bhedVan1mJJ1QDD+H12KvX9FTQ==@vger.kernel.org, AJvYcCWINEMG9QfRBWUH2SRe4L4Sq5mjBuaCgDtcTZDcT1DPczka+M1JRJ3A+65h1HEYeE29epwbpbyCWR/h5hGp@vger.kernel.org
X-Gm-Message-State: AOJu0YyFXKR7svrlLTCIjjGU/HhFgOAvDz/3CZ15NxzBKUof7OAFfeez
	1DxBmOW00FluKLrjWxz3vUaWzNi9dzlYyxnVjmnTRTsd1aeUgKuy1HlqGxYJkYWkPamRL/ZJAE6
	K65q6ucxJHPY1ZzC4Ac22cVuMln0=
X-Google-Smtp-Source: AGHT+IGpzSCLB/QU2+zSrtrGOd8GdXT3cFDNWrYeQ7bjyP5WsPJnOun3jPwxSosCSJWhsVGaSjDB5XOcPa3bu89bM44=
X-Received: by 2002:a05:6512:3b9c:b0:544:e8c:2964 with SMTP id
 2adb3069b0e04-54414ae0a95mr1408764e87.35.1738951499099; Fri, 07 Feb 2025
 10:04:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <94bf84a7-13a3-4701-807e-fc0f10d4dc88@suse.com>
 <b35737df-01ed-46a2-ae67-e56547d6c824@suse.com>
In-Reply-To: <b35737df-01ed-46a2-ae67-e56547d6c824@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Feb 2025 03:04:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQjGy+Cbt9wBsmQhn-EB8VKt_K53GJAGbk3g_qh6iorcA@mail.gmail.com>
X-Gm-Features: AWEUYZl1OkVtosDDBRfvCl8j1mOTD88uevQ5simYOtOi9cMlkBjK5qlG72ivY7w
Message-ID: <CAK7LNAQjGy+Cbt9wBsmQhn-EB8VKt_K53GJAGbk3g_qh6iorcA@mail.gmail.com>
Subject: Re: [PATCH -v2 0/7] module: Strict per-modname namespaces
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 7:14=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 12/16/24 17:43, Petr Pavlu wrote:
> > On 12/2/24 15:59, Peter Zijlstra wrote:
> >> Hi!
> >>
> >> Implement a means for exports to be available only to an explicit list=
 of named
> >> modules. By explicitly limiting the usage of certain exports, the abus=
e
> >> potential/risk is greatly reduced.
> >>
> >> The first 'patch' is an awk scripts that cleans up the existing module
> >> namespace code along the same lines of commit 33def8498fdd ("treewide:=
 Convert
> >> macro and uses of __section(foo) to __section("foo")") and for the sam=
e reason,
> >> it is not desired for the namespace argument to be a macro expansion i=
tself.
> >>
> >> The remainder of the patches introduce the special "MODULE_<modname-li=
st>"
> >> namespace, which shall be forbidden from being explicitly imported. A =
module
> >> that matches the simple modname-list will get an implicit import.
> >
> > @Masahiro, I'd like to take this on the modules tree for 6.14. Can I ge=
t
> > an Acked-by you for the changes?
>
> Ping, this still applies mostly cleanly. I plan to take the series on
> modules-next, or let me know if you prefer for this to go through the
> kbuild tree.


I do not think this patch set is in a mature state yet.
He did not provide proper documentation or commit description.

It would be nice if he takes some time to add documentation to
Documentation/core-api/symbol-namespaces.rst
since this is a new feature of the module namespace.




--
Best Regards
Masahiro Yamada

