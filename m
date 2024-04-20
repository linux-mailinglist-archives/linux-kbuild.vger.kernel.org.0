Return-Path: <linux-kbuild+bounces-1611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDBC8ABA13
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Apr 2024 09:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF5B42814CA
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Apr 2024 07:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7835AF9DE;
	Sat, 20 Apr 2024 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJRQZcuI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546A2946F
	for <linux-kbuild@vger.kernel.org>; Sat, 20 Apr 2024 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713597895; cv=none; b=Xwgy3CtYzJD3hZv7X0qJKVV/s/7WshDXFgX0MWaq3qv1PzVGtOmpI9bQ4gapPj85Ykk6rWdLwvfjFwjtv/G0E8b5GlmJ5+7SL32HTvP1v69iE+HZbs+4q7Ycx0z7iGMN6DGFr/F1fe2l0GWP3ui7U77Brh4bV86qJHyNM/kj0ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713597895; c=relaxed/simple;
	bh=2qGRMMb0BQ91X7IRN+E/o5jOeaNxPzmct4GBQO4mVgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/oZ2JwysjuVDGUe3tsr5QqrXkj1acU//M4vmzIOje3xxXQVmgO0wwv+mxcGGbMoM0cav4qpU2au/72Mi3NGjkYc2KDhTnflcxfqK0O1BBU1QTxFTenqnqdMRQl1TO/NT3Sq2nn2fKQXqBvsXhOoXsKMTo3S7NlTDr5obyPc4Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJRQZcuI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C753EC113CE
	for <linux-kbuild@vger.kernel.org>; Sat, 20 Apr 2024 07:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713597894;
	bh=2qGRMMb0BQ91X7IRN+E/o5jOeaNxPzmct4GBQO4mVgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jJRQZcuIbMrMitgA6KsSGe8uDLgT+780RbI68/JkGbecc2IgPQ+2YGXHe5rFibP4g
	 55w01fWwKH44YXt8vDvAhuNm5/vrDxyrnwWiQYcQm/kzRjHz8hyt7FavSCV+UDZg6q
	 CrgzrUbA3LBGn7wAvO4q2YnC6GKR5bxgQIOlF4qWjh5gtx6B38ULy0LBrTy0meIlqh
	 /RIQIZnlGNdSq6AV2OCvX7fgIqLw4EroAeLWXXDSL9hSWRtFzjupXekkjefqIH+tDa
	 HUCZrIttLEfqXQ6T3tXX992xi7Lm5iu8wwOmVsLrkuzYsNx2k36UKgcJ06aR6keS7U
	 OSZeY/IcECuKA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51ae2e37a87so456773e87.2
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Apr 2024 00:24:54 -0700 (PDT)
X-Gm-Message-State: AOJu0YyTZqoFQv0nhqngZ3R3rSLx2SQeja3K/n0JOLyrUBMvSml8jvRQ
	//83rFvRNjtApAfPALeICyua6Zux0toJ7aaVEYXmEhgxdGW9E/IOj3nifBkxJEonSib4Qp87P75
	0aScK4HPp7uK9elUWtdSG7Cyjim4=
X-Google-Smtp-Source: AGHT+IGAZtkPEBgJurc+7fB96LZa8zxV82zkz7ceVZ5ccm1tV6Aj1SnrwYSUezXz+0si2aWZqKy49EpJu7HzSRPJPBY=
X-Received: by 2002:a05:6512:2203:b0:519:5e81:276d with SMTP id
 h3-20020a056512220300b005195e81276dmr3324600lfu.31.1713597893504; Sat, 20 Apr
 2024 00:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240407072933.3562124-1-ppandit@redhat.com> <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com>
 <668901914.114470.1713335369416@mail.yahoo.com>
In-Reply-To: <668901914.114470.1713335369416@mail.yahoo.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 20 Apr 2024 16:24:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAReoYHT0-SUzFT11y=pN6GTLSgu0+7Su+2Tthkz5VFymw@mail.gmail.com>
Message-ID: <CAK7LNAReoYHT0-SUzFT11y=pN6GTLSgu0+7Su+2Tthkz5VFymw@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: add config and source entry details
To: Prasad Pandit <pj.pandit@yahoo.in>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 3:30=E2=80=AFPM Prasad Pandit <pjp@fedoraproject.or=
g> wrote:
>
> Hello Masahiro,
>
> On Tuesday, 16 April, 2024 at 05:19:40 pm IST, Masahiro Yamada <masahiroy=
@kernel.org> wrote:>
> >You added
> >
> >- indented by a leading tab (\t) character,
> >- Help text is further indented by two more spaces.
> >
> >These are recommended coding styles for readability,
> >not grammatical requirements.
>
>   -> https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html
>
> * I see, thank you for the clarification. Reading this language reference=
 and seeing the config entries consistently using indentation in Kconfig fi=
les, I mistook it as language syntax.
>
> * Maybe it'll help to explicitly specify that indentation is not the Kcon=
fig language syntax.
>
>
> >You can write Kconfig code without indentation,
> >without blank lines in-between.
> >
> >
> >config FOO
> >bool "foo"
> >depends on BAR
> >config BAR
> >bool "bar"
> >config BAZ
> >bool "baz"
> >
> >
> >It is unreadable, but it works fine.
> >
> >
> >Only the place where the indentation plays an act
> >is the end of help. It is already documented.
> >
> >  The end of the help text is determined by
> >  the indentation level, this means it ends at the first line which has
> >  a smaller indentation than the first line of the help text.
> >
>
> * Got it. In that case, to confirm: are there any input cases which are e=
rroneous according to the Kconfig language syntax? Because even config entr=
ies ending with an 'EOF' are not flagged as an error.


Why should it be flagged as an error?


Kconfig does not require a new line at the end of file.
Same for other languages such as C, Python, etc.



>
> * Last to confirm: is 'kconfig-language.html' reference for the Kconfig l=
angauge as implemented in kernel OR it is the general language reference th=
at applies to all Kconfig files across all projects? Because non-kernel pro=
jects also seem to use Kconfig files.


I hoped this file explained Kconfig language as a standalone project.

Apparently, it contains a kernel-specific description.
(e.g. "Compile-testing")



>
>
> Thank you.
> ---
>   - Prasad



--=20
Best Regards
Masahiro Yamada

