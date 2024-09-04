Return-Path: <linux-kbuild+bounces-3357-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5703C96AE85
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 04:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6426B2321A
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 02:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC512D60C;
	Wed,  4 Sep 2024 02:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+QROyqm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF46BE49;
	Wed,  4 Sep 2024 02:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725416632; cv=none; b=Bn4PM02pyDh7iJc09Jb8CKbol3H7LEncNU2XL1FClH/WhJRKYhLHAlFMj1+jfZG+O52ZedIy7VB3N+PN+LU4LjJae89reNUcu05BnyTUxcoHpaHhZIasKpbMOHm2+exQIuc8zlRQK3sveJpwP9b9uMQxtiRd6+7X9AcSAXNpyJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725416632; c=relaxed/simple;
	bh=oJFukLmjhHmgCvwx9cAiQ94whPhUJuGQuGXCVz7NOaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVV1a/Guv1ztFqcuoQZbcwTAevgQOGh1eBMEWTjItGhI5PyZpVPNUwwxkz+bW7fhohW8/WAfvW84gtLaRWdfQDIeObMG/VRtB9iZ6ku/vBsK5QGxpW1q9WDRGIm18ORrLn66ZO2W7NluxVDOEmc+X0rc0DzkZDbIcK3I0bPLfmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+QROyqm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51076C4AF09;
	Wed,  4 Sep 2024 02:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725416632;
	bh=oJFukLmjhHmgCvwx9cAiQ94whPhUJuGQuGXCVz7NOaA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I+QROyqmR8U+5YQXIJOiplFq4e91z+xTZpqfrpXE/cNG5u/Q7EMB0N1Ky/mM+vmZv
	 sbEwdVot9J6Y+MbYn18wHjTPyGw+d2HmYIh3MUI8qJs0kCSHrV7VlRX6U1YLm9RdM7
	 0CRbnVJ1GSqrB+vaLKMIR2hiEbM39Jx27HDgf9Hsc52nWTW7j2Q+jc3q56v+PsCn9c
	 1sCKYJ6+Akh9/umz3wGVGdgEFtFnWEE+CuMHub+OJrrzElQFKTHWNUd1TVY3lZIJoV
	 e8uriDT/aqnRF1aH1vbu2t8a0q5FFl7zGYj9HnyanvWZaovsfEyU9LQ1dYRNHqwPmJ
	 pBdxX6+DFY1GA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f502086419so12685131fa.3;
        Tue, 03 Sep 2024 19:23:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7uvKZ8M/a22tRyMcfg2H/6NeqrA4AJyu2M83ZfAzVxFqqKk4LhMnpyJtP+gExsTjQ6CPVvGx2ZJmnmica@vger.kernel.org, AJvYcCXSStGQLkUlhGqa9RTeKI2GPRi0KMFvlMYx7uylhgePfWXE//Yk66IK82W/7XWRkKhMotC60ozyM6HsAdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3tgGLvqXPg+Q88DGiXJW5HSwt9Bup0cmRyaDOvObjIFnL8pc
	9LfOEWrrV158WSOxAZ4lzFUptmHP8vpHtH33MbGuTjZ/hi7mtV0GlMIp12KAfLJEWEP6W+kudhM
	rf58JX+K9+dGqmUFqyc29ngmN4lc=
X-Google-Smtp-Source: AGHT+IFIVM3Dvzbxo6N+w/K63knyYQ+g/ShDi4w4Mhp0J6NipTdeKN/hyEV/Y7ZPGtgYDgcpCmm1am5D/S02V+kKHH0=
X-Received: by 2002:a05:6512:3188:b0:52e:f58b:65ee with SMTP id
 2adb3069b0e04-53546bab08amr12201178e87.57.1725416630985; Tue, 03 Sep 2024
 19:23:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902160828.1092891-1-ojeda@kernel.org> <20240903-super-elk-of-bliss-eaed2c@lindesnes>
 <CANiq72=KrOnx1utXaM17x07B=V-6zmW5nA+zYKS0AU8Rd+2v9A@mail.gmail.com>
In-Reply-To: <CANiq72=KrOnx1utXaM17x07B=V-6zmW5nA+zYKS0AU8Rd+2v9A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 4 Sep 2024 11:23:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5Y-FDUasJ9OJ50T3h=EUDPcnEmP1_QhDTSheViQiLrw@mail.gmail.com>
Message-ID: <CAK7LNAQ5Y-FDUasJ9OJ50T3h=EUDPcnEmP1_QhDTSheViQiLrw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: pahole-version: improve overall checking and
 error messages
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 9:15=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Sep 3, 2024 at 9:49=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu>=
 wrote:
> >
> > thanks, no objections.
>
> Thanks for taking a look!
>
> > I'd rather like to have
> >
> >     output=3D$(echo "$output" | sed -nE 's/v([0-9]+)\.([0-9][0-9])/\1\2=
/p')
> >
> > here (thus, explicitly check against a two number subversion), so that
> > we can detect also versions like 1.100 or 2.1 and bail out.
>
> So I didn't change that here to avoid more changes in the same commit,
> but happy to do that if preferred.
>
> However, do we want to make it too strict? i.e. I don't think it is
> very unexpected to get v1.100 or v2.1 -- it may not be what current
> `pahole` does or ever do, but I am not sure we gain much by being so
> strict.


I am not sure whether pahole never releases v2.0


$ echo v2.0 | sed -nE 's/v([0-9]+)\.([0-9]+)/\1\2/p'
20


Not a syntax error, but the version comparison will not work correctly.








>
> (Similarly, for the ^..$ suggestion, it could be that `pahole` decides
> to to something like `pahole v1.25`, i.e. `name version`, like other
> programs).
>
> Either way, I am happy -- I doubt `pahole` changes too much, and if it
> does, we can change this too.
>
> Cheers,
> Miguel
>


--=20
Best Regards
Masahiro Yamada

