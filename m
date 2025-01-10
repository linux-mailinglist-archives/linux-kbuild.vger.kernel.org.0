Return-Path: <linux-kbuild+bounces-5433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786DA09918
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 19:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291793A7671
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 18:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB10212D65;
	Fri, 10 Jan 2025 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/JqBXyD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD8B2066E0;
	Fri, 10 Jan 2025 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736532683; cv=none; b=eoX1uTDF4qU7YeI2U82NxxTrXdNwarp47tjfJRcNoaXvJqd9R3jLNapni7p+jtPb6lolmTDRYDC4JX4BlfXdeZQULgrodAmKaieB9rJDU8leBT6ddCmZ5pdJT1GFmdlDgCkBFeTdBrHRoZylae337GEPZR4KIGXq8ZVDSy+48eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736532683; c=relaxed/simple;
	bh=tvsh4hr+RpRunTiBWlCn4gyuE/0HI1YBjC00BuBbCZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFyRIK91Pl3J0vaWQqg5fLXcfhD7mbATA0JNviSRPJZtzzk26jgby2yrvvTHTd5MWkS6vB6wuZh556WuzuoAl//0XY60+fFp6gQom/5LjjDjsERIjTlA+V1qCSHyrXmNx/Af2I7j13Fxw1s8FJih56vEx3w15NJ4oxDR50400cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/JqBXyD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5405CC4CED6;
	Fri, 10 Jan 2025 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736532683;
	bh=tvsh4hr+RpRunTiBWlCn4gyuE/0HI1YBjC00BuBbCZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K/JqBXyDfZHReSXezfeArduMX/HhV0GxaP7feYQuH9tZczRfS2NDttkQbcyLrIyYv
	 Fwmf6D2nWqVIw5UmM2/IjprnkTiiQHJIv5FvINmGzxeJY+B64N4D6GsiZhaEnUFKOg
	 4aHPRpbF5p50Kg6HI+sbZZS9V4YVTKBKZh4yg1E/ZbbwiASICV+EDXiowfqD8XEjhs
	 F07D0sds/OKom3n4hMtAHGjStmNcD54KikSI0YtJZv9V+H9nax9VbPLMGmthh1ZgxS
	 JhIRRaxUy8MEjsmFXrwCSYeYql8gjcO98eddfNudTwfeqJM+3m4KsYw8Ky5PYGwTtr
	 xqtV7N7I6xULA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401be44b58so2388645e87.0;
        Fri, 10 Jan 2025 10:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS6RwQUxD44SzlnCj93F+w3+vkSEMaIDQCsIkhSh9NXyCLJWWOiOoUmpUHYgjFTHxgJrpwKhCceiRIais=@vger.kernel.org, AJvYcCW2fm2zvouRMRugGbi6yOkXDBdynMUtnVa7rtTMGniImkM0qc4TStc2oo37MW/Gugia9LTkq6csm10s9Q==@vger.kernel.org, AJvYcCXnukuI6BX7UJy85FQFi7fVllk3T2Qg7lT8DFh9zHdOnBXQTaB+fOkAeQpb+dQbgtMl0VEhjUKFh3RXn8O5@vger.kernel.org
X-Gm-Message-State: AOJu0YxtdQRLboag+sAd/PzmFlKGX8+v8rb0Z8u6Dt7+S6zNcDZSultH
	xYVftNOn64DJ3VuQjDiFoFi1Wn8g3M8NYuQBYXsqmQWwqlOai9SQ9pLgWb2rWfl3PgwGDMgIsqD
	6NvpUA47sqIHKqEZpLN6wpSRmnUA=
X-Google-Smtp-Source: AGHT+IHb+bVSbz/gWKROdqBObQn5D87lJ5UfB6lJ8BolyK+Cbfvoq5wnSddYteub72xoaPb4ig6IvpgTBgEULc/b/no=
X-Received: by 2002:a05:6512:3b0e:b0:540:5253:6af2 with SMTP id
 2adb3069b0e04-542845af9c9mr3654946e87.12.1736532681694; Fri, 10 Jan 2025
 10:11:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com> <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
In-Reply-To: <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jan 2025 19:11:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
X-Gm-Features: AbW1kvasbJxXizyCj8YjS23s-yzUuL4NZfOhY2CO3pG_FqQEpOsXCxnYOlub1mk
Message-ID: <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jan 2025 at 13:14, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Jan 10, 2025 at 5:28=E2=80=AFPM Ard Biesheuvel <ardb+git@google.c=
om> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Due to the fact that runtime const ELF sections are named without a
> > leading period or double underscore, the RSTRIP logic that removes the
> > static RELA sections from vmlinux fails to identify them. This results
> > in a situation like below, where some sections that were supposed to ge=
t
> > removed are left behind.
> >
> >   [Nr] Name                              Type            Address       =
   Off     Size   ES Flg Lk Inf Al
> >
> >   [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f=
50 2900f50 000014 00   A  0   0  1
> >   [59] .relaruntime_shift_d_hash_shift   RELA            00000000000000=
00 55b6f00 000078 18   I 70  58  8
> >   [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f=
68 2900f68 000014 00   A  0   0  1
> >   [61] .relaruntime_ptr_dentry_hashtable RELA            00000000000000=
00 55b6f78 000078 18   I 70  60  8
> >   [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f=
80 2900f80 000238 00   A  0   0  1
> >   [63] .relaruntime_ptr_USER_PTR_MAX     RELA            00000000000000=
00 55b6ff0 000d50 18   I 70  62  8
> >
> > So tweak the match expression to strip all sections starting with .rel.
> > While at it, consolidate the logic used by RISC-V, s390 and x86 into a
> > single shared Makefile library command.
>
> I do not know how this works because arch/*/Makefile.post
> do not include scripts/Makefile.lib
>

Apologies - it seems I didn't test this thoroughly.

The build happily completes without any errors, though - it appears
doing '$(call cmd,foo)' does not trigger an error when cmd_foo does
not exist.

I suppose this is a consequence of 8962b6b475bddc ("kbuild: print
short log in addition to the whole command with V=3D1") which introduced
an $(if ) where the else branch is simply ':' and so it always
succeeds.

