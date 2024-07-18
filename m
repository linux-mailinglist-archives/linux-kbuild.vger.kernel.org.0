Return-Path: <linux-kbuild+bounces-2594-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC5F935161
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2024 19:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27779283E68
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jul 2024 17:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA591459EC;
	Thu, 18 Jul 2024 17:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tI0wHB8M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3D3144D3B
	for <linux-kbuild@vger.kernel.org>; Thu, 18 Jul 2024 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721325285; cv=none; b=CZ1uOR9uT0Imz6xuIH6RaU9vBkNtoDhaFjyXTu1pcznY7Yv5bE2o30NubYhmpO01G+GJYaJZZ8u96BpUmbSH/VHijxkrI5Bk6x+tICutaqTn3FS4nocMAkeCLMioM6tVDkE9dAiIDwdZvLaDZjOE27BtO5I9zgjWCQLk3xn7i7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721325285; c=relaxed/simple;
	bh=er1KGbL9lI7rHYeiRUh/0c+RhXEbNw4CXvEBwGOKCek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpXsZC2MQ8zLAkAHfoB6dpbt9ARRRA3ZI4sIfl+Nl6fN1pi3j13pmLVwdyyMY1cQaht1AflS8hjntUTI3MuTHK+mHvDGDgkYviiHC5urF0hfd81cevpjrYdQlGMfAt7rITley8Kdhm1mpLZ91Lk3zBkqse+cd9X8k8tIsh6/WwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tI0wHB8M; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-48fe544ce8cso304497137.2
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Jul 2024 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721325282; x=1721930082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4SvoCOfHNYf2EY8mfu400oO+cE1SqNQGKec2qHgTrs=;
        b=tI0wHB8MNkeNURiYC9YiZWmCbSzwT9s+ClxUvG5RC4HmUtpgF02Vw9jH2aCC90X/gk
         rEIHP1Nag6WHPwnoB7ikM1uh065Y7cZ+MPt27sehooJAHoiBN7YdmvOvsclDIan1Qjw3
         xklhvtj/0EGNfjhBPO1Z04cXlSnYWWUI67lGlPQLsqM47I01Gzf3vB3BHq9gZPkCU0Jq
         BMVkO0GpIPOpoWrI0aInq59N3KHebKlMQrMW5iluzJptAXUpbXMo86bkaPl4NkNqUpjx
         FTuxTpOOsLHTZIczAzRgx2IJS54LMbZ2p6v7KWP5MMS4cnrAy8JLOHGXhCWRPP2K6mpr
         jFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721325282; x=1721930082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4SvoCOfHNYf2EY8mfu400oO+cE1SqNQGKec2qHgTrs=;
        b=xJ3BY32Vx+TC3XYMOOqyd0ZLqU0RYGOhsaZew4oSSs34mt+r/ffnGc8UVbLwfnjory
         vE05lmH7ugXmC83xhpEtSFcPnHS2AdMX9xMhGikmlcelljuUh7tsSxWx/ObgvUr69R3o
         H2F+UC/Kjym2JLzUY5sG1VyCV6NZ/uTUewN1QLuzzRx4bX1QEjqGM4RQM56ZqyQTBbrf
         Xs1SGprM6iyr0Dt//9HDDIyGz7LEA3BbUh+doam2BtXeTG3bujpjfezNZjBw+UDxn7db
         9Slnh1l2DhJ7fEFC5ZYh4ZVAmqTjBQ3ZIHtpL1TVNYBxiPPOF20l8f3wOH1J/xh2qZ9S
         Lpzg==
X-Gm-Message-State: AOJu0Ywx5DChb3NqICA2w0S99qSSS27my7pYPF4FPPZR4Kb6ad23TxBq
	H9Z/lF3SxYdaLKHULzOb1kjJdiE9JDHG2Z3wYp2Djgn6W55bXaSw91LxLYwWpQLj/nfE6AAk41b
	YCpcjNbQVEXDnLDdU0uJK/bB3yW6M+HmJ86LG
X-Google-Smtp-Source: AGHT+IFu8fSO+esPncf5i90Eh9ur5Prn0Oq01lFyV4cisEHacDtIFIUR6lWCMmPTIx1Hw8JznJo213vAvtbAhHdx1OQ=
X-Received: by 2002:a05:6102:15aa:b0:48f:79de:909e with SMTP id
 ada2fe7eead31-49159849e1cmr8258860137.18.1721325281957; Thu, 18 Jul 2024
 10:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717182828.1527504-1-masahiroy@kernel.org>
In-Reply-To: <20240717182828.1527504-1-masahiroy@kernel.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 18 Jul 2024 17:54:03 +0000
Message-ID: <CABCJKucE0c7SLbf5sxcNCj+tiL9uwYDKspg2Zq0vjR-ZSePpng@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: add comment to discourage tools/* addition
 for kernel builds
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jiri Olsa <jolsa@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Brian Norris <briannorris@chromium.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, Jul 17, 2024 at 6:28=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Kbuild provides scripts/Makefile.host to build host programs used for
> building the kernel. Unfortunately, there are two exceptions that opt
> out of Kbuild. The build system under tools/ is a cheesy replica, and
> cause issues. I was recently poked about a problem in the tools build
> system, which I do not maintain (and nobody maintains). [1]
>
> Without a comment, people might believe this is the right location
> because that is where objtool lives, even if a more robust Kbuild
> syntax satisfies their needs. [2]
>
> [1]: https://lore.kernel.org/linux-kbuild/ZnIYWBgrJ-IJtqK8@google.com/T/#=
m8ece130dd0e23c6f2395ed89070161948dee8457
> [2]: https://lore.kernel.org/all/20240618200501.GA1611012@google.com/
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Nicolas Schier <nicolas@fjasle.eu>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> ---
>
> Changes in v2:
>   - rephase the comment for clarification
>
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 768d3dc107f8..943899656977 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1328,6 +1328,12 @@ prepare: tools/bpf/resolve_btfids
>  endif
>  endif
>
> +# The tools build system is not a part of Kbuild and tends to introduce
> +# its own unique issues. If you need to integrate a new tool into Kbuild=
,
> +# please consider locating that tool outside the tools/ tree and using t=
he
> +# standard Kbuild "hostprogs" syntax instead of adding a new tools/* ent=
ry
> +# here. See Documentation/kbuild/makefiles.rst for details.
> +
>  PHONY +=3D resolve_btfids_clean
>
>  resolve_btfids_O =3D $(abspath $(objtree))/tools/bpf/resolve_btfids

Looks good to me, thanks for adding the clarification!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

